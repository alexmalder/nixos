setup_local_path:
	kubectl apply -f local-path-storage.yaml
	kubectl patch storageclass local-path -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'

setup_helm_repos:
	helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
	helm repo add argo https://argoproj.github.io/argo-helm
	helm repo add sentry https://sentry-kubernetes.github.io/charts 
	helm repo add gitea https://dl.gitea.com/charts
	helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
	helm repo add vm https://victoriametrics.github.io/helm-charts/
	helm repo add grafana-community https://grafana-community.github.io/helm-charts
	helm repo add grafana https://grafana.github.io/helm-charts

	helm repo update

install_ingress:
	helm upgrade --install ingress-nginx ingress-nginx/ingress-nginx --namespace ingress-nginx --version 4.15.1 -f ingress-nginx.yaml

install_argo_cd:
	helm upgrade --install argo-cd argo/argo-cd --namespace argocd --version 10.10.5 -f argo-cd.yaml

diff_argo_cd:
	helm diff upgrade argo-cd argo/argo-cd --namespace argocd --version 10.10.5 --values argo-cd.yaml

generate_cert:
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout homeserver.key -out homeserver.crt -subj "/CN=*.homeserver.local" -addext "subjectAltName = DNS:*.homeserver.local"

create_cert_secret:
	kubectl create secret tls argocd-server-tls --cert=./homeserver.crt --key=./homeserver.key -n argocd 

install_vm_cluster:
	helm upgrade --install vmcluster vm/victoria-metrics-cluster --version 0.53.0 -n vm -f monitoring/victoria-metrics-cluster-values.yml

install_vm_agent:
	helm upgrade --install vmagent vm/victoria-metrics-agent --version 0.50.0 -n vm -f monitoring/guide-vmcluster-vmagent-values.yaml

install_grafana:
	helm upgrade --install grafana grafana-community/grafana --version 14.0.1 -n vm -f monitoring/grafana.yaml

get_argocd_admin_password:
	kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

get_grafana_admin_password:
	kubectl get secrets -n vm grafana -o jsonpath="{.data.admin-password}" | base64 -d

