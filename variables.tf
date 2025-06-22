variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "region" {
  default = "us-east-1"
}
variable "public_key_path" {
  default = "~/.ssh/nginx_key.pub"
}
