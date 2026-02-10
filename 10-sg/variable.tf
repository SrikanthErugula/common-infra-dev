variable "project_name" {
    default = "roboshop"
}

variable "environment" {
    default = "dev"
}

variable "sg_names" {
    default = [
        # for databases
        "mongodb", "redis", "mysql", "rabbitmq",
        #  for backend
        "catalogue", "user", "cart", "shipping", "payment",
        # frontend 
        "frontend",
        # bastion  #sess -38 
        "bastion",
        # frontend load balancer  #sess-39
        "frontend_alb",
        # Backend ALB        #sess -39
        "backend_alb",
        # "open_vpn"              #sess-48
    ]
}