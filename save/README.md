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

Remember that, in our case, we need to create a namespace and fill the namespace in the ingress file, apply the service-account.yaml to create the permitions, and deploy action.

its necessary to create the secret with the certificate and the key, to do that, use the following command:

```bash

```

comment about ingress config, oidc

ingress command to create the load balancer and attach it to kube:

```bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.10.0/deploy/static/provider/aws/deploy.yaml
```

after it, creates the tls secret and apply the ingress file.
Also, apply the API-SERVICE file, so it could be connected to the load balancer by the host name.

the oidc url needs to be connected with the [IAM role](https://docs.aws.amazon.com/eks/latest/userguide/enable-iam-roles-for-service-accounts.html), so care of it, also, take the ID of the OIDC and change the POLICES at the terraform.

to install grafana, look at the docs: https://grafana.com/docs/grafana/latest/setup-grafana/installation/kubernetes/

to be able to see the metrics of the cluster and HPA, use:

```bash
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
```

and then, to apply the VPA, you will need to set the kubeconfig vars

```bash
export KUBECONFIG
export KUBE_CONFIG_PATH
```
