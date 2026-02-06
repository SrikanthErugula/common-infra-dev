locals {
  common_name_suffix = "${var.project_name}-${var.environment}" # roboshop-dev
  mongodb_sg_id = data.aws_ssm_parameter.mongodb_sg_id.value                                #1
  redis_sg_id = data.aws_ssm_parameter.redis_sg_id.value                                #3
  rabbitmq_sg_id = data.aws_ssm_parameter.rabbitmq_sg_id.value                            #4
  mysql_sg_id = data.aws_ssm_parameter.mysql_sg_id.value                                    #5
  database_subnet_id = split("," , data.aws_ssm_parameter.database_subnet_ids.value)[0]         #2
  ami_id = data.aws_ami.devops.id
  common_tags = {
      Project = var.project_name
      Environment = var.environment
      Terraform = "true"
  }
}