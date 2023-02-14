variable project {
    type = string
    default = "cluster-iac"
}

variable region {
    type = string
    default = "us-east4"
}

variable "subnet" {
    type = string
    default = "default"
}

variable "domain" {
    type = string
    default = "cluster-iac.com"
}
