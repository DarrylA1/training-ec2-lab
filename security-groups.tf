resource "aws_security_group" "my_public_app_sg" {
    name = "my_public_app_sg"
    description = "Creating Sg for my public app"
    vpc_id = data.aws_vpc.main_vpc.id


    #INBOUND CONNECTIONS
    ingress {
        description = "Allow SSH into the EC2"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    #OUTBOUND CONNECTIONS
    egress {
        description = "Allow acces to the world"
        from_port = 0
        to_port = 0
        protocol = "-1" #TCP + UDP
        cidr_blocks = ["0.0.0.0/0"]
    }
}