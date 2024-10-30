variable "region" {
  type        = string
  description = "AWS region"
  default     = "us-east-1"
}

variable "prefix" {
  type        = string
  description = "Prefixo para os nomes dos buckets"
  default     = "meu-projeto-"
}