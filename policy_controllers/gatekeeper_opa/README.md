# Examples are mainly taken from https://open-policy-agent.github.io/gatekeeper-library/website/

helm repo add gatekeeper https://open-policy-agent.github.io/gatekeeper/charts

helm install gatekeeper gatekeeper/gatekeeper

kubectl --namespace gatekeeper-system get all
