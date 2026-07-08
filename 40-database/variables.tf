
variable "project_name" {
    default = "roboshop"
}

variable "environment" {
    default = "dev"
}


 # it is not used here
# variable "sg_names" {
#     default = [
#         # databases
#         "mongodb", "redis", "mysql", "rabbitmq",
#         # backend
#         "catalogue", "user", "cart", "shipping", "payment",
#         # frontend
#         "frontend",
#         # bastion
#         "bastion",
#         # frontend load balancer
#         "frontend_alb",
#         # Backend ALB
#         "backend_alb"
#     ]
# }

variable "zone_id" {                # sess-42
    default = "Z04684822ZHOD2IE49OQC"
}

variable "domain_name" {            # sess-42
    default = "dsoaws.fun"
}
