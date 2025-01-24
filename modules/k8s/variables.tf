variable "identifiers" {
  type        = map(string)
  description = "Bundle of identifiers useful throughout the application"
}

variable "module" {
  type        = string
  description = "The shortname of this module. Can be overridden but a sensible default is provided"
  default     = "k8s"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of private subnet ids in which to deploy the EKS cluster"
}

variable "cidr" {
  type        = list(string)
  description = "List of CIDR blocks to allow traffic from"
}