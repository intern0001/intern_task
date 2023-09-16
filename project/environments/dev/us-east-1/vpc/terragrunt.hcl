terraform {
  source = "../../../../modules//vpc/"  
}

include "root" {
  path = find_in_parent_folders()
}

locals {
  # Load environment-wide variables
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  # Extract needed variables for reuse
  vpc_cidr                  = local.environment_vars.locals.vpc_cidr
  vpc_name                  = local.environment_vars.locals.vpc_name
  
  
}

inputs = {
  vpc_cidr=local.vpc_cidr
  vpc_name=local.vpc_name
}
dependencies {
    paths = ["../ecr/"]
}
