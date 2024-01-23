# Domains
variable "tables" {
    type = map
    default = {
        network = {
            tag = "init - network"
        }
    }
}