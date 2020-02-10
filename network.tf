// Add Internet Gateway , ovr VPC will need Internet Access
resource "aws_internet_gateway" "dev-ig01" {
  vpc_id = aws_vpc.dev-vpc01.id
  tags = {
      Name = "dev-ig01"
  }
}
// Create a custom route table for public subnet. public subnet can reach to the internet by using this.
resource "aws_route_table" "PubRT" {
  vpc_id = aws_vpc.dev-vpc01.id
  route {
      //associated subnet can reach everywhere
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.dev-ig01.id
  }
  tags = {
      Name = "PubRT"
  }
}
// Associate CRT and Subnet
resource "aws_route_table_association" "PubSN-PubRT" {
  subnet_id = aws_subnet.PubSN.id
  route_table_id = aws_route_table.PubRT.id
}


