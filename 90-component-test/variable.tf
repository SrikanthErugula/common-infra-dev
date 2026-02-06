 # SESS-46

variable "component" {
    default = "catalogue"
}

variable "rule_priority" {  # tform-rob module lo declared 
    default = 10
}

variable "components" {
    default = {
        catalogue = {
            rule_priority = 10
        }
        user = {
            rule_priority = 20
        }
        cart = {
            rule_priority = 30
        }
        shipping = {
            rule_priority = 40
        }
        payment = {
            rule_priority = 50
        }
        frontend = {
            rule_priority = 10
        }
    }
}

# here rule priority same ga vundakudadhu which evevr connect backend_alb
# so frontend rule priority 10 ichhina no issues bcz dhaniki connnect ayye ALB is different 