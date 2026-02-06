data "aws_ami" "devops" {           #sess-42
    owners           = ["973714476881"]
    most_recent      = true
    
    filter {
        name   = "name"
        values = ["Redhat-9-DevOps-Practice"]
    }

    filter {
        name   = "root-device-type"
        values = ["ebs"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
}

data "aws_ssm_parameter" "private_subnet_ids" {         #sess-42
  name = "/${var.project_name}/${var.environment}/private_subnet_ids"
}

data "aws_ssm_parameter" "catalogue_sg_id" {            #sess-42
  name = "/${var.project_name}/${var.environment}/catalogue_sg_id"
}

data "aws_ssm_parameter" "vpc_id" {                     # sess-43
  name = "/${var.project_name}/${var.environment}/vpc_id"
}



data "aws_ssm_parameter" "backend_alb_listener_arn" {  # sess-43
  name = "/${var.project_name}/${var.environment}/backend_alb_listener_arn"
}