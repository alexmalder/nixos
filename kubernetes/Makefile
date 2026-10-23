setup_local_path:
	kubectl apply -f https://raw.githubusercontent.com/rancher/local-path-provisioner/v0.0.37/deploy/local-path-storage.yaml

setup_ingress_repo:
	# 1. Add the official ingress-nginx Helm repository
	helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
	# 2. Update your local chart registry cache
	helm repo update

install_ingress:
	helm upgrade --install ingress-nginx ingress-nginx/ingress-nginx --namespace ingress-nginx --create-namespace --version 4.15.1 -f ingress-nginx-4.15.1.yaml

install_argo_cd:
	helm upgrade --install argo-cd argo/argo-cd --namespace argocd --create-namespace --version 10.10.5 -f argo-cd.yaml

diff_argo_cd:
	helm diff upgrade argo-cd argo/argo-cd --namespace argocd --version 10.10.5 --values argo-cd.yaml

generate_cert:
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout homeserver.key -out homeserver.crt -subj "/CN=argocd.homeserver.local" -addext "subjectAltName = DNS:argocd.homeserver.local"

create_cert_secret:
	kubectl create secret tls argocd-server-tls --cert=./homeserver.crt --key=./homeserver.key -n argocd 
