# aws_infra
AWS Infra for blog for new job

## Folder Structure
* env - enviromental variables (dev, prod) 
* init - first boot items (state bucket, iam user)
* network - networking items usually live outside of inidivual projects
* service - service we are deploying

## First Time Run
*This section of the read me is dedicated to first time steps which do not need to be repeated.*

This setup assumes you are beginning from a brand new AWS account. 

Create an organization. Using organizations allow for billing, least priviledge, 

* Login to aws and go to `IAM Identity Center` and create a new organization. 
* Confirm the identity source
* Create the first user and superAdmin group
* Create permission set to AdministratorAccess
* Assign users or groups to the org
* Use the new SSO server and login the new user
* Create a token for the TF

## Remote State 

## Secrets Management
I use `Mozilla SOPs` and `KMS` to encrypt secrets. 
The init process revolves around configuring these import items before the rest of the environment. 

[ref](https://medium.com/@javier.vlopez/using-mozilla-sops-terraform-provider-c48f65b73ca)