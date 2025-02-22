resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name        = "git-vpc"
    Environment = "Testing"
  }
}

# Create Public Subnets
# Data source to fetch existing VPC
data "aws_vpc" "existing_vpc" {
  tags = {
    Name = "git-vpc"
  }
}

# Create subnet in the existing VPC
resource "aws_subnet" "my_tf_subnet" {
  vpc_id     = data.aws_vpc.existing_vpc.id
  cidr_block = "10.0.2.0/24"

  availability_zone = "ap-southeast-1a"

  tags = {
    Name = "my_main_subnet"
  }
}

# resource "aws_subnet" "public_1" {
#   vpc_id                  = aws_vpc.main.id
#   cidr_block              = "10.0.1.0/24"
#   availability_zone       = "ap-southeast-1a"
#   map_public_ip_on_launch = true

#   tags = {
#     Name = "public-subnet-1"
#     Type = "Public"
#   }
# }

# # Create Private Subnets
# resource "aws_subnet" "private_1" {
#   vpc_id            = aws_vpc.main.id
#   cidr_block        = "10.0.3.0/24"
#   availability_zone = "ap-southeast-1a"

#   tags = {
#     Name = "private-subnet-1"
#     Type = "Private"
#   }
# }
