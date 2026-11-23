let
  admin = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPduu7qWi3RG7hh3UEepqgZilkjxtGhC1rrbr044wN5r root@nixos";
  alexmalder = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFjhcuSI6HxgfCZ+F1rGIPsFt0AOf+MIgyhPssKXmOoA alexmalder@devopsfaith-desktop";
in
{
  "homeserver.pem.age".publicKeys = [ admin alexmalder ];
  "homeserver.crt.age".publicKeys = [ admin alexmalder ];
  "homeserver.key.age".publicKeys = [ admin alexmalder ];
  "gitlab-runner-token.age".publicKeys = [ admin alexmalder ];
}
