setup_local_path:
	kubectl apply -f https://raw.githubusercontent.com/rancher/local-path-provisioner/v0.0.37/deploy/local-path-storage.yaml

setup_ingress_repo:
	helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
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
