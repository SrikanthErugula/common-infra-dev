variable "vpc_test_cidr" {
    default = "10.0.0.0/16"
}
# defalut ivvakapothe emi anedhi chudali run chesi


variable "project_name" {
    default = "roboshop"
}

variable "environment" {
    default = "dev"
}


variable "vpc_test_tags" {
    default = {
        Purpose = "robo-dev-infra-vpc"
        DontDelete = "true"
    }
}

# ikkada variales y ante user ki chanace ivvali replce chesukovadaniki,

# SUBNETS

variable "public_subnet_cidrs" {
    default= ["10.0.1.0/24","10.0.2.0/24"] # see in notes
}

variable "private_subnet_cidrs" {
    default= ["10.0.11.0/24","10.0.12.0/24"]
}

variable "database_subnet_cidrs" {
    default= ["10.0.21.0/24","10.0.22.0/24"] 
}
# so here ip adress must unique ga vundali same ip lu use cheyakudadhu chste error vastundhi
