variable "component" {          # SESS-46
    default = "catalogue"
}

variable "rule_priority" {  # tform-rob module lo declared 
    default = 10
}

# variable "components" {
#     default = {
#         catalogue = {
#             rule_priority = 10
#         }
#         user = {
#             rule_priority = 20
#         }
#         cart = {
#             rule_priority = 30
#         }
#         shipping = {
#             rule_priority = 40
#         }
#         payment = {
#             rule_priority = 50
#         }
#         frontend = {
#             rule_priority = 10
#         }
#     }
# }
