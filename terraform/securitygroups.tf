resource "aws_security_group" "webserver_security_group" { 
   name = "Webserver_port1"
   description = "Web Application"
   ingress{
   description = "Inbound Port"
   from_port = 8000
   to_port   = 9000
   protocol  = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
   
           }
  ingress{
   description = "Inbound Port"
   from_port = 443
   to_port   = 443
   protocol  = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
           }  
   ingress {
   from_port = 22
   to_port   = 22
   protocol  = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
            }
    egress{
   description = "Outbound Port "
   from_port = 80
   to_port   = 80
   protocol  = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
   ipv6_cidr_blocks = ["::/0"]
           }
    egress{
   description = "Open Port 80"
   from_port = 443
   to_port   = 443
   protocol  = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
   from_port = 22
   to_port   = 22
   protocol  = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
            }
    tags = {
    name = "Web App Application"
  }
  }