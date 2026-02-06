
#sess-37

module "vpc_test" {
  #source = "../terraform-AWS-VPC-module" for practice 

  source = "git::https://github.com/SrikanthErugula/terraform-AWS-VPC-module.git" 


   # VPC
    vpc_cidr = var.vpc_test_cidr # must comes from users 
    project_name = var.project_name
    environment = var.environment
    vpc_tags = var.vpc_test_tags

    # For public subnets
    public_subnet_cidrs = var.public_subnet_cidrs # see in notes

    # Private Subnets

    private_subnet_cidrs = var.private_subnet_cidrs

    # database subnets
    database_subnet_cidrs = var.database_subnet_cidrs

    is_peering_required = false # see notes
}


