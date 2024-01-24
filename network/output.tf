output "vpc_id" {
    value = {for k in  aws_vpc.dev: k.tags.name => k.id}
}
