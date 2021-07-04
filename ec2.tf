resource "aws_instance" "admzjl2-ec2-instance" {
    ami = "ami-0d2fb06f3c1484132"
    availability_zone = "ap-southeast-2c"
    instance_type = "t3.micro"
    #instance_type = "t1.micro"
    subnet_id = "subnet-b2b1d9ea"
    # subnet_id = "subnet-09b4f5e0c2e5b3180"
    # vpc_security_group_ids = ["sg-0bff407c780d3abbf"]
    security_groups = ["${aws_security_group.admzjl2_ingress_ssh.id}"]
    key_name = var.ami_key_pair_name
    iam_instance_profile = "${aws_iam_instance_profile.admzjl2_iam_instance_profile.name}"
    tags = {
            Name = var.name
            cost-centre = var.cost-centre
            created-by = var.created-by
            name = var.name
            schedule = var.schedule
            environment = var.environment
            business-owner = var.business-owner
            operational-owner = var.operational-owner
            operational-hours = var.operational-hours
            gitlab-project-id     = var.gitlab-project-id
            security-classification = var.security-classification
    }
}