To make the TLS work good, you have to create first the route to the API, then add it to the service and finally the ingress. The ingress will be the one that will manage the TLS certificate.

To generate the kubeconfig to connect to the cluster, you should use the terraform to generate the whole infrastructure and then generate the kubeconfig.

To make the action to activate the infra`s action, you should create a GitHub token that has access to manage secrets, env and actions services in the infra, also set the AWS credentials in the secrets of the infra and API repository.

the oidc file needs the cluster name {CLUSTER_NAME}, so care of it.

Furthermore, remember to map the ports in the API directory, the ports that are mapped in the API directory should be the same as the ones that are mapped in the dockerfile, to expose the API.

The ECR_IMAGE will be in the name of ${var.prefix}-api, so care of it.
Do not forget of the ECR_IMAGE also in the api-deployment.yaml file.

Cloudflare->Origin Server->Coloca o domínio e gera o certificado para substituir dentro do ingress

to create the load balancer and attach it to kube, use the following command:

```bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.10.0/deploy/static/provider/aws/deploy.yaml
```

after, run the tls command, and after, apply the ingress file.

Remember that, in our case, we need to create a namespace and fill the namespace in the ingress file, and deploy action.
