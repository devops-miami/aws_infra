terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 5.0"
        }
    }
}

provider "aws" {
    shared_config_files      = ["/Users/dev/.aws/config"]
    shared_credentials_files = ["/Users/dev/.aws/credentials"]
    region = "us-west-1"

}