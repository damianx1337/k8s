echo -n '<username>:<docker_hub_access_token>' | base64

# fully working option
kubectl create secret generic regcred --from-file=.dockerconfigjson=config.json --type=kubernetes.io/dockerconfigjson

# alternate OPTION
kubectl create secret docker-registry regcred --docker-server=https://index.docker.io/v1/ --docker-username=<user> --docker-password=<pw>

# Create the kaniko executor pod
kubectl apply -f kaniko-pod.yaml
