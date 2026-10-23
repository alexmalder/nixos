# argocd examples

## create sentry app from git

```bash
argocd app create sentry \
    --repo https://github.com/alexmalder/sentry.git \
    --path sentry \
    --revision 9.0.0-dev \
    --dest-server https://kubernetes.default.svc \
    --dest-namespace sentry \
    --sync-option CreateNamespace=true \
    --parameter namespace=sentry
```

## create gitea app from chartmuseum

```bash
argocd app create gitea \
    --repo https://dl.gitea.com/charts \
    --path gitea/gitea \
    --dest-server https://kubernetes.default.svc \
    --dest-namespace gitea \
    --sync-option CreateNamespace=true \
    --parameter namespace=gitea
```