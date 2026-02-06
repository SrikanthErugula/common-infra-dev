
#sess-37

# Using Open source module
#https://github.com/terraform-aws-modules/terraform-aws-security-group/blob/master/README.md
 
#  module "catalogue" {
#   source = "terraform-aws-modules/security-group/aws"

#   name        = "${local.common_name_suffix}-catalogue"
#   use_name_prefix = false # true vunte vere name will come
#   description = "Security group for catalogue with custom ports open within VPC, egress all traffic"
#   vpc_id      = data.aws_ssm_parameter.vpc_id.value # comes from data.tf

# } 


module "sg" {
  count = length(var.sg_names)
  source = "git::https://github.com/SrikanthErugula/custum-aws-sg.git"
  #source = "git::https://github.com/SrikanthErugula/custum-aws-sg.git?ref=main"
  project_name = var.project_name
  environment = var.environment
  sg_name = var.sg_names[count.index]
  #sg_name = "mongodb" ila vunte adhi hardcode 
  sg_description = "Created for ${var.sg_names[count.index]}"
  #sg_description = "Created for mongodb"
  vpc_id =  local.vpc_id
}

# Frontend (idi separate refer in varibl.tf lo db,backend laga front kuda oka component)accepting traffic 
#from frontend ALB ( idi different refer in varibkle.tf ) --> this for tight creating  sg 

# resource "aws_security_group_rule" "frontend_frontend_alb" {
#   type              = "ingress"
#   security_group_id = module.sg[9].sg_id             # frontend SG ID   ---- # destination 
#   source_security_group_id = module.sg[11].sg_id     # frontend ALB SG ID ---> # source
#   from_port         = 80
#   protocol          = "tcp"
#   to_port           = 80
# }

# the above is for manula purpose we have written ....after this frnt sg will have frnt_lb check