resource "aws_instance" "web" {
  ami                    = "ami-0c02fb55956c7d316" 
  instance_type          = "t3.micro"
  key_name               = aws_key_pair.my_key_pair.key_name
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  subnet_id              = aws_subnet.public_subnet.id
  tags = {
    Name = "web"
  } 
   provisioner "local-exec" {
    command = "echo ${self.public_ip} > ec2-ip.txt"
   }
}