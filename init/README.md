# Notes
Only a main and provider. Because this section only runs once we don't really need to waste time keeping it dry.

## Dependencies
Some things are assumed like:
* SOPs is installed
* AWS is installed
* The org configure is complete
* A user token with perms is available
* Terraform-docs is installed for tfvars conversions

## Provider
* Say we need AWS stuff
* Set the credentials
* Set the region

## Resources
* Bucket - remote backend for TF
* KMS Key - encryption using SOPs
* DynamoDB - a couple table for managing state

## Use 
The init state runs before the whole env does in order to give us pre reqs. 

```sh
tf apply --vars-file ../env/init.tfvars
```

## Configure Secrets
When we apply the terraform from the init folder we get kms key which we can use to encrypt all our secrets. When doing this init the first time around the files are unencrypted and require contents before this step. Make sure the env vars exists in the file if you are following these instructions.

Back up the kms key to your env var
```sh
KMS_ARN=$(terraform output aws_kms_key_arn | jq -r)
```

Convert the tfvars to json for SOPS. 
```sh
cd ..
terraform-docs tfvars json network > env/dev.tfvars.json 
```

At this point I'll jump over to the env folder.
```sh
sops --kms ${KMS_ARN} --encrypt env/dev.tfvars.json > env/dev.enc.tfvars.json 
```