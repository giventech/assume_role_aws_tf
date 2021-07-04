terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
# Configure the AWS Provider
provider "aws" {
  region = "ap-southeast-2"
#   default_tags {
#       tags = {
#             cost-centre = "0172"
#             name = "admzjl2-ec2-instance"
#             schedule = "office-hours"
#             business-owner = "rajesh.gulrajani@bendigoadelaide.com.au"
#             created-by = "fabrice.ginape@bendigoadelaide.com.au"
#             environment = "sandbox"
#       }
#   }
}