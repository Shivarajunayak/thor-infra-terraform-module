terraform {
  source = "./terraform-aws-lambda" // Assuming the lambda functions module is located in the same directory as the current module
}

include {
  path = find_in_parent_folders()
}

inputs = {
  // Define input variables for the lambda_functions module if needed
}

terraform {
  source = "./terraform-aws-opensearch" // Assuming the OpenSearch module is located in the same directory as the current module
}

include {
  path = find_in_parent_folders()
}

inputs = {
  domain_name        = var.domain_name
  engine_version     = var.engine_version
  instance_type      = var.instance_type
  instance_count     = var.instance_count
  volume_size        = var.volume_size
}

