
################ MONGODB ###################

#mongodb is accepting traffic or connection from bastion
resource "aws_security_group_rule" "mongodb_bastion" {                #3
  type              = "ingress"
  security_group_id = local.mongodb_sg_id        # destination 
  source_security_group_id = local.bastion_sg_id  # Source 
  from_port         = 22
  protocol          = "tcp"
  to_port           = 22
}

# mongodb accepting connection from catalogue on port 27017
resource "aws_security_group_rule" "mongodb_catalogue" {          #7 sess-42
  type              = "ingress" 
  security_group_id = local.mongodb_sg_id
  source_security_group_id = local.catalogue_sg_id
  from_port         = 27017
  protocol          = "tcp"
  to_port           = 27017
}

# mongodb accepting connection from user on port 27017
resource "aws_security_group_rule" "mongodb_user" {                # sess-46
  type              = "ingress"
  security_group_id = local.mongodb_sg_id
  source_security_group_id = local.user_sg_id
  from_port         = 27017
  protocol          = "tcp"
  to_port           = 27017
}

################ REDIS ###################
# # Redis accepting connections from bastion on port 22
resource "aws_security_group_rule" "redis_bastion" {                    #4
  type              = "ingress"
  security_group_id = local.redis_sg_id
  source_security_group_id = local.bastion_sg_id
  from_port         = 22
  protocol          = "tcp"
  to_port           = 22
}

#Redis accepting connections from user on port 6379
resource "aws_security_group_rule" "redis_user" {                   #sess-46
  type              = "ingress"
  security_group_id = local.redis_sg_id
  source_security_group_id = local.user_sg_id
  from_port         = 6379
  protocol          = "tcp"
  to_port           = 6379
}

#Redis accepting connections from cart on port 6379
resource "aws_security_group_rule" "redis_cart" {                   # sess-46
  type              = "ingress"
  security_group_id = local.redis_sg_id
  source_security_group_id = local.cart_sg_id
  from_port         = 6379
  protocol          = "tcp"
  to_port           = 6379
}

################ MYSQL ###################
# mysql is accepting traffic or connection from bastion on port 22
resource "aws_security_group_rule" "mysql_bastion" {                      #6
  type              = "ingress"
  security_group_id = local.mysql_sg_id
  source_security_group_id = local.bastion_sg_id
  from_port         = 22
  protocol          = "tcp"
  to_port           = 22
}

# mysql is accepting traffic or connection from shipping on port 3306
resource "aws_security_group_rule" "mysql_shipping" {                    #sess-46
  type              = "ingress"
  security_group_id = local.mysql_sg_id
  source_security_group_id = local.shipping_sg_id
  from_port         = 3306
  protocol          = "tcp"
  to_port           = 3306
}

################ RabbitMQ ###################
# RabbitMQ is accepting traffic or connection from bastion on port 22
resource "aws_security_group_rule" "rabbitmq_bastion" {                     #5
  type              = "ingress"
  security_group_id = local.rabbitmq_sg_id
  source_security_group_id = local.bastion_sg_id
  from_port         = 22
  protocol          = "tcp"
  to_port           = 22
}

# RabbitMQ is accepting traffic or connection from payment on port 5672
resource "aws_security_group_rule" "rabbitmq_payment" {                    #sess-46
  type              = "ingress"
  security_group_id = local.rabbitmq_sg_id
  source_security_group_id = local.payment_sg_id
  from_port         = 5672
  protocol          = "tcp"
  to_port           = 5672
}


# ###### Catalogue SG Rules ######
# cata is accepting traffic or connection from bastion on port 22
resource "aws_security_group_rule" "catalogue_bastion" {                 #7 sess-42
  type              = "ingress"
  security_group_id = local.catalogue_sg_id
  source_security_group_id = local.bastion_sg_id
  from_port         = 22
  protocol          = "tcp"
  to_port           = 22
}

# cata is accepting traffic or connection from backaned_alb on port 8080
resource "aws_security_group_rule" "catalogue_backend_alb" {                  # 8 sess-43
  type              = "ingress"
  security_group_id = local.catalogue_sg_id
  source_security_group_id = local.backend_alb_sg_id
  from_port         = 8080
  protocol          = "tcp"
  to_port           = 8080
}


# ##### User SG Rules #####
#user is accepting traffic or connection from bastion on port 22
resource "aws_security_group_rule" "user_bastion" {                                  #sess-46
  type              = "ingress"
  security_group_id = local.user_sg_id
  source_security_group_id = local.bastion_sg_id
  from_port         = 22
  protocol          = "tcp"
  to_port           = 22
}

# cata is accepting traffic or connection from backenf_alb on port 8080
resource "aws_security_group_rule" "user_backend_alb" {                        #sess-46
  type              = "ingress"
  security_group_id = local.user_sg_id
  source_security_group_id = local.backend_alb_sg_id
  from_port         = 8080
  protocol          = "tcp"
  to_port           = 8080
}

# ##### Cart SG Rules #####

#cart is accepting traffic or connection from bastion on port 22
resource "aws_security_group_rule" "cart_bastion" {                            #sess-46
  type              = "ingress"
  security_group_id = local.cart_sg_id
  source_security_group_id = local.bastion_sg_id
  from_port         = 22
  protocol          = "tcp"
  to_port           = 22
}

#user is accepting traffic or connection from backenf_alb on port 8080
resource "aws_security_group_rule" "cart_backend_alb" {                     #sess-46
  type              = "ingress"
  security_group_id = local.cart_sg_id
  source_security_group_id = local.backend_alb_sg_id
  from_port         = 8080
  protocol          = "tcp"
  to_port           = 8080
}


##### Shipping SG Rules #####
#shipping is accepting traffic or connection from bastion on port 22
resource "aws_security_group_rule" "shipping_bastion" {                             #sess-46
  type              = "ingress"
  security_group_id = local.shipping_sg_id
  source_security_group_id = local.bastion_sg_id
  from_port         = 22
  protocol          = "tcp"
  to_port           = 22
}

#Shipping is accepting traffic or connection from backenf_alb on port 8080
resource "aws_security_group_rule" "shipping_backend_alb" {                          #sess-46
  type              = "ingress"
  security_group_id = local.shipping_sg_id
  source_security_group_id = local.backend_alb_sg_id
  from_port         = 8080
  protocol          = "tcp"
  to_port           = 8080
}


# ##### Payment SG Rules #####
#Payment is accepting traffic or connection from bastion on port 22
resource "aws_security_group_rule" "payment_bastion" {                      # sess-46
  type              = "ingress"
  security_group_id = local.payment_sg_id
  source_security_group_id = local.bastion_sg_id
  from_port         = 22
  protocol          = "tcp"
  to_port           = 22
}

#Payment is accepting traffic or connection from backenf_alb on port 8080
resource "aws_security_group_rule" "payment_backend_alb" {                       #sess-46 
  type              = "ingress"
  security_group_id = local.payment_sg_id
  source_security_group_id = local.backend_alb_sg_id
  from_port         = 8080
  protocol          = "tcp"
  to_port           = 8080
}

# ##### Backend ALB SG Rules #####

#backend_alb is accepting traffic or connection from bastion  on port 80
resource "aws_security_group_rule" "backend_alb_bastion" {          #1
  type              = "ingress"
  security_group_id = local.backend_alb_sg_id            # frontend SG ID   ---- # destination 
  source_security_group_id = local.bastion_sg_id   # frontend ALB SG ID ---> # source
  from_port         = 80
  protocol          = "tcp"
  to_port           = 80
}

#backend_alb is accepting traffic or connection from frontend on port 80
resource "aws_security_group_rule" "backend_alb_frontend" {                      #sess-46
  type              = "ingress"
  security_group_id = local.backend_alb_sg_id
  source_security_group_id = local.frontend_sg_id
  from_port         = 80
  protocol          = "tcp"
  to_port           = 80
}


#backend_alb is accepting traffic or connection from cart on port 80
resource "aws_security_group_rule" "backend_alb_cart" {
  type              = "ingress"
  security_group_id = local.backend_alb_sg_id
  source_security_group_id = local.cart_sg_id
  from_port         = 80
  protocol          = "tcp"
  to_port           = 80
}

#backend_alb is accepting traffic or connection from shipping on port 80
resource "aws_security_group_rule" "backend_alb_shipping" {
  type              = "ingress"
  security_group_id = local.backend_alb_sg_id
  source_security_group_id = local.shipping_sg_id
  from_port         = 80
  protocol          = "tcp"
  to_port           = 80
}

#backend_alb is accepting traffic or connection from payment on port 80
resource "aws_security_group_rule" "backend_alb_payment" {
  type              = "ingress"
  security_group_id = local.backend_alb_sg_id
  source_security_group_id = local.payment_sg_id
  from_port         = 80
  protocol          = "tcp"
  to_port           = 80
}



##### Frontend SG Rules #####
#frontend is accepting traffic or connection from bastion on port 22
resource "aws_security_group_rule" "frontend_bastion" {                      #ses--46
  type              = "ingress"
  security_group_id = local.frontend_sg_id
  source_security_group_id = local.bastion_sg_id
  from_port         = 22
  protocol          = "tcp"
  to_port           = 22
}

#frontend is accepting traffic or connection from frontend_alb on port 80
resource "aws_security_group_rule" "frontend_frontend_alb" {                          #sess-46
  type              = "ingress"
  security_group_id = local.frontend_sg_id
  source_security_group_id = local.frontend_alb_sg_id
  from_port         = 80
  protocol          = "tcp"
  to_port           = 80
}

# ##### Frontend ALB SG RUles #####
# frnt-alb should accept traffic or connecction from public or laptop on port 443
resource "aws_security_group_rule" "frontend_alb_public" {                           # 9 sess-45
  type              = "ingress"   
  security_group_id = local.frontend_alb_sg_id
  cidr_blocks = ["0.0.0.0/0"]
  from_port         = 443
  protocol          = "tcp"
  to_port           = 443
}


##### Bastion SG Rules #####
# Bastion should accept traffic or connecction from public or laptop on port 22
resource "aws_security_group_rule" "bastion_laptop" {
  type              = "ingress"
  security_group_id = local.bastion_sg_id
  cidr_blocks = ["0.0.0.0/0"]
  from_port         = 22
  protocol          = "tcp"
  to_port           = 22
}




######## VPN ##########33     sess-48

resource "aws_security_group_rule" "open_vpn_public" {
  type              = "ingress"
  security_group_id = local.open_vpn_sg_id
  cidr_blocks = ["0.0.0.0/0"]
  from_port         = 22
  protocol          = "tcp"
  to_port           = 22
}

resource "aws_security_group_rule" "open_vpn_943" {
  type              = "ingress"
  security_group_id = local.open_vpn_sg_id
  cidr_blocks = ["0.0.0.0/0"]
  from_port         = 943
  protocol          = "tcp"
  to_port           = 943
}

resource "aws_security_group_rule" "open_vpn_443" {
  type              = "ingress"
  security_group_id = local.open_vpn_sg_id
  cidr_blocks = ["0.0.0.0/0"]
  from_port         = 443
  protocol          = "tcp"
  to_port           = 443
}

resource "aws_security_group_rule" "open_vpn_1194" {
  type              = "ingress"
  security_group_id = local.open_vpn_sg_id
  cidr_blocks = ["0.0.0.0/0"]
  from_port         = 1194
  protocol          = "tcp"
  to_port           = 1194
}






############ VPN through CATA ############3

resource "aws_security_group_rule" "catalogue_vpn" {          #sess-48 
  type              = "ingress"
  security_group_id = local.catalogue_sg_id
  source_security_group_id = local.open_vpn_sg_id
  from_port         = 22
  protocol          = "tcp"
  to_port           = 22
}

## for developers access puprpose enable 8080 port

resource "aws_security_group_rule" "catalogue_vpn_8080" {
  type              = "ingress"
  security_group_id = local.catalogue_sg_id
  source_security_group_id = local.open_vpn_sg_id
  from_port         = 8080
  protocol          = "tcp"
  to_port           = 8080
}

# resource "aws_security_group_rule" "components_vpn" {
#   for_each = local.vpn_ingress_rules
#   type              = "ingress"
#   security_group_id = each.value.sg_id
#   source_security_group_id = local.open_vpn_sg_id
#   from_port         = each.value.port
#   protocol          = "tcp"
#   to_port           = each.value.port
# }




#This is the mistake we did, cart can't access components directly from one component to another component. they should be communicated through backend ALB

/* resource "aws_security_group_rule" "cart_shipping" {
  type              = "ingress"
  security_group_id = local.cart_sg_id
  source_security_group_id = local.shipping_sg_id
  from_port         = 8080
  protocol          = "tcp"
  to_port           = 8080
}

resource "aws_security_group_rule" "user_payment" {
  type              = "ingress"
  security_group_id = local.user_sg_id
  source_security_group_id = local.payment_sg_id
  from_port         = 8080
  protocol          = "tcp"
  to_port           = 8080
}

resource "aws_security_group_rule" "cart_payment" {
  type              = "ingress"
  security_group_id = local.cart_sg_id
  source_security_group_id = local.payment_sg_id
  from_port         = 8080
  protocol          = "tcp"
  to_port           = 8080
} */

# This is the mistake we did, cart can't access catalogue directly, it should be through backend ALB
/* resource "aws_security_group_rule" "catalogue_cart" {
  type              = "ingress"
  security_group_id = local.catalogue_sg_id
  source_security_group_id = local.cart_sg_id
  from_port         = 8080
  protocol          = "tcp"
  to_port           = 8080
} */


# resource "aws_security_group_rule" "payment_shipping" {
#   type              = "ingress"
#   security_group_id = local.payment_sg_id
#   source_security_group_id = local.shipping_sg_id
#   from_port         = 8080
#   protocol          = "tcp"
#   to_port           = 8080
# }