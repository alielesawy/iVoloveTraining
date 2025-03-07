resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.manual_vpc.id
  cidr_block              = "10.0.1.0/24"
    availability_zone       = "us-east-1a"
}
resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.manual_vpc.id
  cidr_block              = "10.0.55.0/24"
    availability_zone       = "us-east-1a"  
}

resource "aws_subnet" "private_subnet2" {
  vpc_id                  = aws_vpc.manual_vpc.id
  cidr_block              = "10.0.66.0/24"
    availability_zone       = "us-east-1b"  
}