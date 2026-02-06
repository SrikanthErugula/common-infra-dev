data "aws_ssm_parameter" "backend_alb_sg_id" {                              #1
  name = "/${var.project_name}/${var.environment}/backend_alb_sg_id"
}

data "aws_ssm_parameter" "frontend_alb_sg_id" {                             # 9 sess-45
  name = "/${var.project_name}/${var.environment}/frontend_alb_sg_id"
}

data "aws_ssm_parameter" "bastion_sg_id" {                                      #2
  name = "/${var.project_name}/${var.environment}/bastion_sg_id"
}
data "aws_ssm_parameter" "mongodb_sg_id" {                                      #3
  name = "/${var.project_name}/${var.environment}/mongodb_sg_id"
}

data "aws_ssm_parameter" "redis_sg_id" {                                      #4
  name = "/${var.project_name}/${var.environment}/redis_sg_id"
}

data "aws_ssm_parameter" "rabbitmq_sg_id" {                                   #5
  name = "/${var.project_name}/${var.environment}/rabbitmq_sg_id"
}

data "aws_ssm_parameter" "mysql_sg_id" {                                       #6
  name = "/${var.project_name}/${var.environment}/mysql_sg_id"
}

data "aws_ssm_parameter" "catalogue_sg_id" {                            #7 sess-42
  name = "/${var.project_name}/${var.environment}/catalogue_sg_id"
}


# sess-46 upto frontend-sg-id
data "aws_ssm_parameter" "user_sg_id" {
  name = "/${var.project_name}/${var.environment}/user_sg_id"
}

data "aws_ssm_parameter" "cart_sg_id" {
  name = "/${var.project_name}/${var.environment}/cart_sg_id"
}

data "aws_ssm_parameter" "shipping_sg_id" {
  name = "/${var.project_name}/${var.environment}/shipping_sg_id"
}

data "aws_ssm_parameter" "payment_sg_id" {
  name = "/${var.project_name}/${var.environment}/payment_sg_id"
}

data "aws_ssm_parameter" "frontend_sg_id" {      
  name = "/${var.project_name}/${var.environment}/frontend_sg_id"
}

# data "aws_ssm_parameter" "open_vpn_sg_id" {
#   name = "/${var.project_name}/${var.environment}/open_vpn_sg_id"
# }