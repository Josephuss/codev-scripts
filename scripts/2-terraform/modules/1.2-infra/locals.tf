module "network_outputs" {
  source = "../../modules/1.1-network"
  
}
locals {
  security_group_id = module.network_outputs.security_group_id
  subnet_id         = module.network_outputs.subnet_id
    
}