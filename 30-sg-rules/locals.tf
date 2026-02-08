locals {
    backend_alb_sg_id = data.aws_ssm_parameter.backend_alb_sg_id.value     #1
    frontend_alb_sg_id = data.aws_ssm_parameter.frontend_alb_sg_id.value  # 9 sess-45
    bastion_sg_id = data.aws_ssm_parameter.bastion_sg_id.value              #2
    mongodb_sg_id = data.aws_ssm_parameter.mongodb_sg_id.value             #3
    redis_sg_id = data.aws_ssm_parameter.redis_sg_id.value                  #4
    rabbitmq_sg_id = data.aws_ssm_parameter.rabbitmq_sg_id.value           #5
    mysql_sg_id = data.aws_ssm_parameter.mysql_sg_id.value                 #6
    catalogue_sg_id = data.aws_ssm_parameter.catalogue_sg_id.value         #7 sess-42

    #ses-46 upto fornt-sg
    user_sg_id = data.aws_ssm_parameter.user_sg_id.value
    cart_sg_id = data.aws_ssm_parameter.cart_sg_id.value
    shipping_sg_id = data.aws_ssm_parameter.shipping_sg_id.value
    payment_sg_id = data.aws_ssm_parameter.payment_sg_id.value
    frontend_sg_id = data.aws_ssm_parameter.frontend_sg_id.value

    open_vpn_sg_id = data.aws_ssm_parameter.open_vpn_sg_id.value # sess- 48 

    vpn_ingress_rules = {               # sess- 48 
        mysql_22 = {
            sg_id = local.mysql_sg_id
            port = 22
        }
        mysql_3306 = {
            sg_id = local.mysql_sg_id
            port = 3306
        }
        redis = {
            sg_id = local.redis_sg_id
            port = 22
        }
        mongodb = {
            sg_id = local.mongodb_sg_id
            port = 22
        }
        rabbitmq = {
            sg_id = local.rabbitmq_sg_id
            port = 22
        }
        catalogue = {
            sg_id = local.catalogue_sg_id
            port = 22
        }
        catalogue_8080 = {
            sg_id = local.catalogue_sg_id
            port = 8080
        }
        user = {
            sg_id = local.user_sg_id
            port = 22
        }
        cart = {
            sg_id = local.cart_sg_id
            port = 22
        }
        shipping = {
            sg_id = local.shipping_sg_id
            port = 22
        }
        payment = {
            sg_id = local.payment_sg_id
            port = 22
        }
        frontend = {
            sg_id = local.frontend_sg_id
            port = 22
        }
        backend_alb = {
            sg_id = local.backend_alb_sg_id
            port = 80
        }
    }
}