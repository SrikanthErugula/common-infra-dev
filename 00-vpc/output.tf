output "vpc_sri_id" {
    value = module.vpc_test.vpc_sri_id
} 



output "public_subnet_ids" {
  value = module.vpc_test.public_subnet_ids
}

output "private_subnet_ids" {
    value = module.vpc_test.private_subnet_ids
}

output "database_subnet_ids" {
    value = module.vpc_test.database_subnet_ids
}