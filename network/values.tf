# Network
variable "network" {
    type = map
    default = {
        dev-vpc = {
            cidr_block = "10.0.0.0/16"
            tag = "dev-vpc"
        }
    }
}

variable "subnetworks" {
    type = map
    default = {
         subnet01 = {
            cidr_block = "10.0.1.0/24"
            vpc = "dev-vpc"
            tag = "subnet01"
        }
         subnet02 = {
            cidr_block = "10.0.2.0/24"
            vpc = "dev-vpc"
            tag = "subnet02"
        }
    }
}
