# module "component" {           #sess-46
#     source = "../../tform-robo-component"
#     component = var.component
#     rule_priority = var.rule_priority 
# }



module "components" {
    for_each = var.components 
    source = "git::https://github.com/SrikanthErugula/tform-robo-component.git?ref=main"
    component = each.key #( each.key lo values are like cata, user, cart...)
    rule_priority = each.value.rule_priority  # ( each.value lo values are cata.10, user.20, cart.30..... )
}

# so ikkada source change chesam give terraform init -reconfigure 