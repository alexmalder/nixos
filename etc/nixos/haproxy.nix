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
        bind *:80
        http-request redirect scheme https code 301

      frontend https_in
        bind *:443 ssl crt /etc/nixos/certs/homeserver.pem
        http-request set-header Host %[req.hdr(Host)]
        http-request set-header X-Forwarded-Proto https
        default_backend app

      backend app
        server app1 127.0.0.1:3000 check
    '';
  };
}
