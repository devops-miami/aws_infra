# Network
variable "network" {
    type = map
    default = {
        dev-vpc = {
            cidr_block = "10.0.0.0/16"
            tag = "dev - network"
            
        }
    }
}
variable "sub_network" {
    type = map
    default = {
         subnet01 = {
            cidr_block = "10.0.1.0/24"
            vpc = "dev-vpc"
            tag = "dev - network"
        }
         subnet02 = {
            cidr_block = "10.0.2.0/24"
            vpc = "dev-vpc"
            tag = "dev - network"
        }
    }
}
