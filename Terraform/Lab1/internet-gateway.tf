resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.manual_vpc.id
    tags = {
        Name = "manual-igw"
    }
  
}