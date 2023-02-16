variable "AWS_REGION" {
  default = "us-east-1"
}
variable "PROFILE" {
  default = "dev"
}
variable "CIDR_BLOCK" {
  default = "0.0.0.0/0"
}
variable "PUBLIC_CIDR_BLOCK" {
  default = "0.0.0.0/0"
}
variable "COUNT" {
  default = 3
}
variable "VPC_NAME" {
  default = "vpc"
}
variable "PUBLIC_SUBNET_NAME" {
  default = "PUBLIC_SUBNET_"
}
variable "PRIVATE_SUBNET_NAME" {
  default = "PRIVATE_SUBNET_"
}
variable "GATEWAY_NAME" {
  default = "InternetGateway"
}
variable "PUBLIC_ROUTE_TABLE" {
  default = "public_route_table"
}
variable "PRIVATE_ROUTE_TABLE" {
  default = "private_route_table"
}