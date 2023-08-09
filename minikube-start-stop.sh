#!/bin/bash

if [ $1 == "start" ]; then
	echo "starting podman machine and minikube k8s cluster..."
	podman machine init --cpus 6 --memory 8192 --disk-size 15 minikube-6-8
	podman system connection default minikube-6-8-root
	podman machine start minikube-6-8
	minikube start -p 1-node-cluster --nodes 1 --memory 7000 --cpus 4 --kubernetes-version=v1.26.3 --driver=podman --container-runtime=containerd
	minikube profile list
	echo "DONE"
elif [ $1 == "stop" ]; then
	echo "stopping + deleting minikube cluster, stopping podman machine..."
	minikube stop -p 1-node-cluster
	minikube delete -p 1-node-cluster
	podman machine stop minikube-6-8
	podman machine rm minikube-6-8
	echo "DONE"
fi

exit 0
