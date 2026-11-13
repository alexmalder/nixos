{ ... }:

{
  services.loki = {
    enable = true;
    configFile = ./loki-config.yaml;
  };

  services.vector = {
    enable = true;
    journaldAccess = true;
    settings = {
      sources = {
        journald = {
          type = "journald";
        };

        # Scrape metrics from both local endpoints
        prometheus_metrics = {
          type = "prometheus_scrape";
          # scrape node exporter and systemd exporter metrics
          endpoints = [
            "http://192.168.0.90:9000/metrics"
            #"http://192.168.0.90:9558/metrics"
          ];
          scrape_interval_secs = 15;
        };

      };

      transforms = {
        prepare_journald = {
          type = "remap";
          inputs = [ "journald" ];
          source = ''
            # Normalize fields and provide fallbacks (journald uses _UID/_GID, fallback to UID/GID if present)
            .hostname = ._HOSTNAME || .host || "unknown"
            .unit = ._SYSTEMD_UNIT || "unknown"
            .facility = .SYSLOG_FACILITY || "unknown"
            .transport = ._TRANSPORT || "unknown"
            .comm = ._COMM || "unknown"
            .uid = ._UID || .UID || "unknown"
            .gid = ._GID || .GID || "unknown"
            .pid = ._PID || "unknown"
            .cmdline = ._CMDLINE || ""
            .msg = .MESSAGE || .message || ""
          '';
        };
      };

      sinks = {
        loki = {
          type = "loki";
          inputs = [ "prepare_journald" ];
          endpoint = "http://192.168.0.90:3100";
          encoding = {
            codec = "text";
          };
          remove_label_fields = true;
          remove_structured_metadata_fields = true;

          # Low-cardinality fields for fast stream indexing
          labels = {
            source = "journald";
            host = "{{ hostname }}";
            unit = "{{ unit }}";
            syslog_facility = "{{ facility }}";
            transport = "{{ transport }}";
          };

          # High-cardinality fields attached without bloating the index
          structured_metadata = {
            comm = "{{ comm }}";
            uid = "{{ uid }}";
            gid = "{{ gid }}";
            pid = "{{ pid }}";
            cmdline = "{{ cmdline }}";
          };
        };

        # Push scraped metrics to VictoriaMetrics
        victoria_metrics = {
          type = "prometheus_remote_write";
          inputs = [ "prometheus_metrics" ];
          endpoint = "https://vminsert.homeserver.local/insert/0/prometheus/api/v1/write";
          healthcheck.enabled = false;
        };
      };
    };
  };

}
