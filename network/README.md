## Network
VPC and subnets are essential but often run in their own space and ran by a dedicated team. 

I keep things apart just to emulate that part of the work. 

To run the dev environment the command looks like this:
```sh
sops exec-file --filename tmp.json ../env/dev.enc.tfvars.json 'terraform apply --var-file={}'
```

This setup will decrypt the json file we hide our env vars in and pass it along to terraform. Previously I was using Terragrunt as a wrapper to perform this option but it seems like this new feature came out a few years ago that lets me run barebones. [ref](https://github.com/getsops/sops/pull/761)