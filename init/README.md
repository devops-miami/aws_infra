# Notes
Only a main and provider. Because this section only runs once we don't really need to waste time keeping it dry.

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