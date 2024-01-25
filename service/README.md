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
