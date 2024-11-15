To ensure proper TLS functionality, follow these steps:

1. Create the dns to the API.
2. Add the dns to the service.
3. Configure the ingress to manage the TLS certificate.

To generate the kubeconfig for connecting to the cluster, use Terraform to create the infrastructure and then generate the kubeconfig.

To activate the infrastructure's actions, follow these steps:

1. Create a GitHub token with access to manage secrets, environment variables, and actions services in the infrastructure and API repositories.
2. Set the AWS credentials in the secrets of the infrastructure and API repositories.

The oidc file requires the cluster name {CLUSTER_NAME}, so make sure to provide it.

Additionally, ensure that the ports mapped in the API directory match the ports mapped in the Dockerfile to expose the API.

The ECR_IMAGE should be named ${var.prefix}-api, so keep that in mind. Don't forget to update the ECR_IMAGE in the api-deployment.yaml file as well.

To create the load balancer and attach it to Kubernetes, run the following command:

```bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.10.0/deploy/static/provider/aws/deploy.yaml
```

After that, execute the tls command and apply the ingress file.

In our case, it's necessary to create a namespace and specify it in the ingress file. Apply the service-account.yaml file to grant the necessary permissions and deploy the action.

To create the secret with the certificate and key, use the following command:

```bash
kubectl create secret tls <SECRET_NAME> --cert=<CERTIFICATE_FILE> --key=<KEY_FILE> -n <NAMESPACE>
```

Make sure to replace `<SECRET_NAME>`, `<CERTIFICATE_FILE>`, `<KEY_FILE>`, and `<NAMESPACE>` with the appropriate values.

Regarding the ingress configuration and oidc, ensure that the oidc URL is connected with the [IAM role](https://docs.aws.amazon.com/eks/latest/userguide/enable-iam-roles-for-service-accounts.html). Also, take note of the OIDC ID and update the policies in the Terraform accordingly.

To view the cluster metrics and enable HPA, run the following command:

```bash
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
```

To apply the VPA, set the kubeconfig variables:

```bash
export KUBECONFIG=<KUBECONFIG_PATH>
export KUBE_CONFIG_PATH=<KUBECONFIG_PATH>
```

Set up Fluent Bit to log to CloudWatch:

```bash
kubectl create namespace amazon-cloudwatch
ClusterName=""
RegionName=""
FluentBitHttpPort='2020'
FluentBitReadFromHead='Off'
[[ ${FluentBitReadFromHead} = 'On' ]] && FluentBitReadFromTail='Off'|| FluentBitReadFromTail='On'
[[ -z ${FluentBitHttpPort} ]] && FluentBitHttpServer='Off' || FluentBitHttpServer='On'
kubectl create configmap fluent-bit-cluster-info \
--from-literal=cluster.name=${ClusterName} \
--from-literal=http.server=${FluentBitHttpServer} \
--from-literal=http.port=${FluentBitHttpPort} \
--from-literal=read.head=${FluentBitReadFromHead} \
--from-literal=read.tail=${FluentBitReadFromTail} \
--from-literal=logs.region=${RegionName} -n amazon-cloudwatch \\

eksctl create iamserviceaccount --region ${RegionName} --name fluent-bit --namespace amazon-cloudwatch --cluster ${ClusterName} --attach-policy-arn arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy --override-existing-serviceaccounts --approve
```

Edit the fluent-bit.yaml file and apply it:

```bash
kubectl apply -f fluent-bit.yaml
```

Dump a Postgres Database and copy it to another:

```bash
pg_dump -h <HOST> -U <USER> -Fc <DATABASE> > <FILE_NAME>.dump
pg_restore -h <HOST> -U <USER> -d <DATABASE> <FILE_NAME>.dump


pg_dump -h tangramgamestage.cxbcoravi8jc.sa-east-1.rds.amazonaws.com -U postgres -Fc tangramgameprod > dump.dump

# on db
DROP SCHEMA public CASCADE;
CREATE SCHEMA public;

pg_restore -h tangram-db-qa.cxbcoravi8jc.sa-east-1.rds.amazonaws.com -U postgres -d tangramdbqa dump.dump
```
