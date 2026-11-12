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
        use_backend app if is_git
        default_backend kube_ingress

        default_backend app

      backend app
        server app1 127.0.0.1:3000 check

      # not used
      backend kube_ingress
        server other1 192.168.0.100:443 check
    '';
  };
}
