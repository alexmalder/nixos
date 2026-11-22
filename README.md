## build agenix

```nix
nix build github:ryantm/agenix --offline -o /tmp/agenix-bin
```

## encrypt

```nix
agenix -- -e homeserver.pem.age
```

## use in code

```nix
age.secrets."homeserver.pem" = {
    file = ./secrets/homeserver.pem.age;
    owner = "haproxy";
    group = "haproxy";
    mode = "0400";
};
```

## extract path

```nix
bind 192.168.0.90:443 ssl crt ${config.age.secrets."homeserver.pem".path}
```
