resource "kubernetes_namespace" "dev_tools_ns" {
  metadata {
    name = "dev-tools-ns"
  }
}

resource "helm_release" "jenkins" {
  name		= "jenkins"
  repository	= "https://charts.jenkins.io/"
  chart		= "jenkins"
  namespace	= "dev-tools-ns"
  version	= "4.3.1"

/*
  values = [
    file("${path.module}/values.yaml")
  ]
*/

  set {
    name	= "controller.jenkinsUrlProtocol"
    value	= "https"
  }
  set {
    name	= "controller.jenkinsUrl"
    value	= "https://localhost"
  }

  set {
    name	= "controller.sidecars.configAutoReload.enabled"
    value	= true
  }
  set {
    name	= "agent.enabled"
    value	= false
  }
#  set {
#    name	= "controller.installPlugins"
#    value	= "{kubernetes:3600.v144b_cd192ca_a_,workflow-aggregator:581.v0c46fa_697ffd, git:4.11.5, configuration-as-code:1429.v09b_044a_c93de}"
#  }
#  set {
#    name	= "controller.additionalPlugins"
#    value	= "{blueocean:1.25.6}"
#  }
}
