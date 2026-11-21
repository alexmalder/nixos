{ ... }:

{
  services.haproxy = {
    enable = true;

    config = ''
      global
        log stdout format raw local0

      defaults
        log global
        mode http
        option httplog
        timeout connect 5s
        timeout client  60s
        timeout server  60s

      frontend http_in
        bind 192.168.0.90:80
        http-request redirect scheme https code 301

      frontend https_in
        bind 192.168.0.90:443 ssl crt /etc/nixos/certs/homeserver.pem
        http-request set-header Host %[req.hdr(Host)]
        http-request set-header X-Forwarded-Proto https

        acl is_git hdr(host),host_only -i git.homeserver.local
        use_backend gitea if is_git

        acl is_loki hdr(host),host_only -i loki.homeserver.local
        use_backend loki if is_loki

        default_backend loki

      backend gitea
        server app1 127.0.0.1:3000 check

      backend loki
        server app1 127.0.0.1:3100 check
    '';
  };
}
