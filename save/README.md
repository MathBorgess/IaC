To make the TLS work good, you have to create first the route to the API, then add it to the service and finally the ingress. The ingress will be the one that will manage the TLS certificate.

To generate the kubeconfig to connect to the cluster, you should use the terraform to generate the whole infrastructure and then generate the kubeconfig.
