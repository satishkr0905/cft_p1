resource "aws_instance" "web01" {
  ami = var.AMI[var.region]
  instance_type = "t2.micro"
  # VPC 
  subnet_id = aws_subnet.PubSN.id
  # Security Group 
  vpc_security_group_ids = aws_security_group.ssh_allowed.id
  # the Public SSH key
  key_name = "aws_m"


}
