  module "emr" {

  source = "./terraform-aws-emr"

  name          = "example-emr-cluster"
  release_label = "emr-6.5.0"
  applications  = ["Hadoop", "Hive", "Spark"]
  instance_type = "m5.xlarge"
  instance_count = 3

  ec2_attributes {
    key_name                 = "your_key_pair_name"
    subnet_id                = "your_subnet_id"
    emr_managed_master_security_group = "your_security_group_id"
    emr_managed_slave_security_group  = "your_security_group_id"
    service_access_security_group     = "your_security_group_id"
  }

  log_uri = "s3://your-bucket/logs/"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
