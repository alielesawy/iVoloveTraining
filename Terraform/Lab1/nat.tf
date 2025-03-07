resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet.id
  tags = {
    Name = "nat-gw"
  } 
  
}
resource "aws_eip" "nat_eip" {
  domain = "vpc"
}