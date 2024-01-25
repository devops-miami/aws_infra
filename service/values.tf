variable "clusters" {
    type = map
    default = {
         cluster99 = {
            keys = "values"
        }
    }
}

variable "iam_roles" {
    type = map
    default = {
         iam_role99 = {
            keys = "values"
        }
    }
}

variable "policy_attachments" {
    type = map
    default = {
         iam_role99 = {
            keys = "values"
        }
    }
}
