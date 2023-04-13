AWS_REGION        = "us-east-1"
PROFILE           = "prod"
CIDR_BLOCK        = "10.0.0.0/16"
PUBLIC_CIDR_BLOCK = "0.0.0.0/0"

COUNT = 3

VPC_NAME           = "vpc"
PUBLIC_SUBNET_NAME = "PUBLIC_SUBNET_"

PRIVATE_SUBNET_NAME = "PRIVATE_SUBNET_"

GATEWAY_NAME        = "InternetGateway"
PUBLIC_ROUTE_TABLE  = "public_route_table"
PRIVATE_ROUTE_TABLE = "private_route_table"

AMI_ID      = "ami-0a5f7bf366a026503"
EC2_NAME    = "ec2"
RDS_NAME    = "rds"
RDS_PORT    = 3306
ENV         = "prod"
DB_NAME     = "csye6225"
DB_PASSWORD = ""
DB_USER     = "csye6225"
HOSTED_ZONE = "Z08305211CYGIUMXRXNDU"
APP_PORT    = 5002
CERTIFICATE = "arn:aws:acm:us-east-1:052936583614:certificate/4c342558-e333-44cb-b8a6-fa4d9d870cb3"