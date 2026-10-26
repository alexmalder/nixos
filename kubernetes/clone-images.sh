
set -eo pipefail



# ghcr.io/dexidp/dex:v2.46.0
# redis:8.6.4-alpine
# registry.k8s.io/ingress-nginx/controller:v1.15.1@sha256:594ceea76b01c592858f803f9ff4d2cb40542cae2060410b2c95f75907d659e1
# docker.io/rancher/local-path-provisioner:v0.0.37
# docker.io/curlimages/curl:8.23.0
# quay.io/argoproj/argocd:v3.5.5
# victoriametrics/vminsert:v1.154.0-cluster
# victoriametrics/vmselect:v1.154.0-cluster
# victoriametrics/vmstorage:v1.154.0-cluster
# victoriametrics/vmagent:v1.154.0
# docker.io/grafana/grafana:13.2.4-distroless


#!/usr/bin/env bash
set -euo pipefail

DEST_REGISTRY="git.homeserver.local"
DEST_NAMESPACE="devopsfaith"

images=(
  "ghcr.io/dexidp/dex:v2.46.0"
  "redis:8.6.4-alpine"
  "registry.k8s.io/ingress-nginx/controller:v1.15.1@sha256:594ceea76b01c592858f803f9ff4d2cb40542cae2060410b2c95f75907d659e1"
  "docker.io/rancher/local-path-provisioner:v0.0.37"
  "docker.io/curlimages/curl:8.23.0"
  "quay.io/argoproj/argocd:v3.5.5"
  "docker.io/victoriametrics/vminsert:v1.154.0-cluster"
  "docker.io/victoriametrics/vmselect:v1.154.0-cluster"
  "docker.io/victoriametrics/vmstorage:v1.154.0-cluster"
  "docker.io/victoriametrics/vmagent:v1.154.0"
  "docker.io/grafana/grafana:13.2.4-distroless"
)

for source in "${images[@]}"; do
  # Split off any digest, then use the tag portion for the destination name.
  source_without_digest="${source%%@*}"
  image_path="${source_without_digest#*/}"
  destination="${DEST_REGISTRY}/${DEST_NAMESPACE}/${image_path}"

  #echo "Pulling  ${source}"
  #docker pull "$source"

  echo "Tagging  ${destination}"
  docker tag "$source" "$destination"

  echo "Pushing  ${destination}"
  docker push "$destination"
done
