## Service / Dept Infra
This folder runs like the network team but belongs to a service or department. 

In this case we will use it to stand up the roles and EKS cluster we need for a service. 

### Use
*After standing up the network*
Stand up the cluster:
```sh
# Stand up the cluster
sops exec-file --filename tmp.json ../env/dev.enc.tfvars.json 'terraform apply --var-file={}'
# Bring down the cluster
sops exec-file --filename tmp.json ../env/dev.enc.tfvars.json 'terraform destroy --var-file={}'
```

### Connecting To Your Cluster
When running private you need a bastion server. In GCP there is a setting to restrict access to the control plane to certain ip addresses or ranges. Will need to find a comparable setting or switch to private and tunnel through a bastion. (GCP experience feels better here)
```sh
# Connect kubectl to your cluster
aws eks update-kubeconfig \                                                                  
  --region us-west-1 \
  --name sudo-dev
```

To validate your connection run:
```sh
kubectl cluster-info
```

### Resources
References to resrouces
[subnets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet)
[eks](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_cluster#example-iam-role-for-eks-cluster)