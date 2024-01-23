resource "aws_vpc" "dev" {
    for_each          = var.network
    
    cidr_block        = each.value.cidr_block
    instance_tenancy  = "default"

    tags = {
        Name = each.value.network
    }
}

resource "aws_subnet" "dev" {
    for_each    =   var.sub_network

    vpc_id      = aws_vpc.dev.id
    cidr_block  = each.value.cidr_block

    tags = {
        Name = "dev"
    }
}