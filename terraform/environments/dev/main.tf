module "vpc_aws" {
  source          = "../../modules/aws_infra/vpc"
  cidr_block_aws  = var.cidr_block_aws
  
}
module "vpc_gcp" {
  source = "../../modules/gcp_infra/vpc"
  cidr_block_gcp =var.cidr_block_gcp
  region_gcp     = var.region_gcp
}
