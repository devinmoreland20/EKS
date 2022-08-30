variable "vpc_cidr" {}
variable "access_ip" {}
variable "public_sn_count" {}
variable "public_cidrs" {
  type = list(any)
}


