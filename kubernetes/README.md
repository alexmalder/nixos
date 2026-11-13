# kubernetes

## nixos kubernetes components

1. etcd
2. flannel
3. kube-apiserver
4. kube-certmgr-bootstrap
5. kube-controller-mananger
6. kube-proxy
7. kube-scheduler
8. kubelet

## structure

1. Gitea server used as docker and helm storage (easy to use).
2. System logs scraped with vector from host.
3. Kubernetes logs scraped with promtail from kubernetes.
4. All logs sending to loki on host.
5. Kubernetes metrics send with vm-agent to victoria-metrics (kubernetes).

- grafana (k8s)
  - loki (nixos)
    - promtail (k8s)
    - vector (nixos)
  - victoria-metrics (k8s)
    - vm-agent (k8s)

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
