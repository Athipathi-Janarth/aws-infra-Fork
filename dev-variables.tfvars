AWS_REGION        = "us-east-1"
PROFILE           = "dev"
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
ENV         = "dev"
DB_NAME     = "csye6225"
DB_PASSWORD = ""
DB_USER     = "csye6225"
HOSTED_ZONE = "Z025752935II237ZL81E0"
APP_PORT    = 5002
CERTIFICATE = "arn:aws:acm:us-east-1:915022173661:certificate/7ff30a72-f10f-4334-b6d1-8c77d9c8b6da"