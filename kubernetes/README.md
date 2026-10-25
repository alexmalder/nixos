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

## helm repositories

```bash
❯ helm repo ls
NAME                    URL                                               
ingress-nginx           https://kubernetes.github.io/ingress-nginx        
argo                    https://argoproj.github.io/argo-helm              
sentry                  https://sentry-kubernetes.github.io/charts        
gitea                   https://dl.gitea.com/charts                       
prometheus-community    https://prometheus-community.github.io/helm-charts
vm                      https://victoriametrics.github.io/helm-charts/    
grafana-community       https://grafana-community.github.io/helm-charts   
```

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
