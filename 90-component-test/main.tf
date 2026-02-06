# module "component" {           #sess-46
#     source = "../../tform-robo-component"
#     component = var.component
#     rule_priority = var.rule_priority 
# }



module "components" {
    for_each = var.components 
    source = "git::https://github.com/SrikanthErugula/tform-robo-component.git?ref=main"
    component = each.key
    rule_priority = each.value.rule_priority
}

# so ikkada source change chesam give terraform init -reconfigure 