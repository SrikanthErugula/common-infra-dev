locals {
  common_name_suffix = "${var.project_name}-${var.environment}" # roboshop-dev      #sess-42
  private_subnet_id = split("," , data.aws_ssm_parameter.private_subnet_ids.value)[0]     #sess-42
   private_subnet_ids = split("," , data.aws_ssm_parameter.private_subnet_ids.value)      # sess-43
  ami_id = data.aws_ami.devops.id                                                       #sess-42
  catalogue_sg_id = data.aws_ssm_parameter.catalogue_sg_id.value                   #sess-42,-43
  vpc_id = data.aws_ssm_parameter.vpc_id.value                                          #sess -43
  backend_alb_listener_arn = data.aws_ssm_parameter.backend_alb_listener_arn.value    # sess-43
  common_tags = {                                                   #sess-42
      Project = var.project_name
      Environment = var.environment
      Terraform = "true"
  }
}