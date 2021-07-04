resource "aws_security_group" "admzjl2_ingress_ssh" {
name = "admzjl2_ingress_ssh"
vpc_id = var.vpc-id
ingress {
    # BEN onprem ip range
    cidr_blocks = ["10.0.0.0/8", "172.16.0.0/12"]
    from_port = 22
    to_port = 22
    protocol = "tcp"
  }
// Terraform removes the default rule
  egress {
   from_port = 0
   to_port = 0
   protocol = "-1"
   cidr_blocks = ["0.0.0.0/0"]
 }
}