{ ... }:

{
  services.gitea = {
    enable = true;

    # Persistent Gitea state/work directory
    stateDir = "/var/lib/gitea";

    # Lightweight single-server database; PostgreSQL is also a good choice
    # for larger or busier instances.
    database.type = "sqlite3";

    # Service settings
    settings = {
      service.DISABLE_REGISTRATION = false;
      server = {
        DOMAIN = "git.homeserver.local";
        ROOT_URL = "https://git.homeserver.local/";
        HTTP_ADDR = "127.0.0.1";
        HTTP_PORT = 3000;
      };
    };
  };
}
