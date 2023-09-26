resource "aws_security_group" "bastion-sg" {
    name    = "${var.namespace}-bastion-sg"
    vpc_id  = aws_vpc.vpc.id 

    ingress {
        from_port   = var.ssh_port
        to_port     = var.ssh_port
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]   
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = "[0.0.0.00]" 
    }
    tags = merge(
        {
        Name = "${var.namespace}-bastion-sg"
        },
        local.additional_tags
    )
}