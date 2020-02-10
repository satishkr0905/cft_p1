# Declare the data source
data "aws_availability_zones" "available" {
  state = "available"
}


resource "aws_vpc" "dev-vpc01" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true     # It will provide an internal domain name
  enable_dns_hostnames = true   # gives you an internal host name
  instance_tenancy = "default"
  tags = {
      Name = "dev-vpc01"
  }
}

resource "aws_subnet" "PubSN" {
  vpc_id = aws_vpc.dev-vpc01.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true  // it makes subnet public.
  availability_zone = data.aws_availability_zones.available.names[0]
  tags = {
      Name = "PubSN"
  }

}

