terraform {
  source = "../../../../modules//ecr/"  
}
include "root" {
  path = find_in_parent_folders()
}

locals {
  # Load environment-wide variables
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  # Extract needed variables for reuse
  name                  = local.environment_vars.locals.cluster_name
  ecr_repo_name         = local.environment_vars.locals.ecr_repo_name
  
  
}


inputs = {
    ecr_repo_name = local.ecr_repo_name
    
  }
 

  