variable "region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "public_key_path" {
  description = "Path to your public SSH key"
  type        = string
}
