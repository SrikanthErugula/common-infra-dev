
# resource "aws_ssm_parameter" "foo" {
#   name  = "foo"
#   type  = "String"
#   value = "bar"
# } # SYNTAX for below code 

resource "aws_ssm_parameter" "vpc_id" {
  name  = "/${var.project_name}/${var.environment}/vpc_id"
  type  = "String"
  value = module.vpc_test.vpc_sri_id # comes from out.tf file
}

resource "aws_ssm_parameter" "public_subnet_ids" {
  name  = "/${var.project_name}/${var.environment}/public_subnet_ids"
  type  = "String"
  value = join("," , module.vpc_test.public_subnet_ids) # comes from out.tf file
}

resource "aws_ssm_parameter" "private_subnet_ids" {
  name  = "/${var.project_name}/${var.environment}/private_subnet_ids"
  type  = "String"
  value = join("," , module.vpc_test.private_subnet_ids) # comes from out.tf file
}

resource "aws_ssm_parameter" "database_subnet_ids" {
  name  = "/${var.project_name}/${var.environment}/database_subnet_ids"
  type  = "String"
  value = join("," , module.vpc_test.database_subnet_ids) # comes from out.tf file
}


