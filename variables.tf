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
variable "INGRESS_PORT" {
  type    = list(number)
  default = [22, 80, 443, 5002]
}
variable "AMI_ID" {
  default = "ami-08628ac362a60b73b"
}
variable "EC2_NAME" {
  default = "ec2"
}
variable "RDS_NAME" {
  default = "rds"
}
variable "RDS_PORT" {
  default = 3306
}
variable "ENV" {
  default = "dev"
}
variable "DB_NAME" {
  default = ""
}
variable "DB_PASSWORD" {
  default = ""
}
variable "DB_USER" {
  default = ""
}
variable "HOSTED_ZONE" {
  default = ""
}
variable "APP_PORT" {
  default = 5002
}
variable "LOAD_BALANCER_INGRESS_PORT" {
  type    = list(number)
  default = [80, 443]
}
variable "CERTIFICATE" {
  default = ""
}