terraform {
  source = "./terraform-aws-emr"
}

inputs = {
  emr_cluster_name   = "my-emr-cluster"
  release_label      = "emr-6.3.0"
  instance_type      = "m5.xlarge"
  instance_count     = 3
  applications       = ["Hadoop", "Hive", "Hue"]
  subnet_id          = "subnet-12345678"
  emr_managed_master_security_group = "sg-12345678"
  emr_managed_slave_security_group  = "sg-12345678"
  additional_master_security_groups = []
  additional_slave_security_groups  = []
  ec2_key_name       = "my-keypair"
  service_access_security_group      = "sg-12345678"
  emr_log_uri        = "s3://my-bucket/emr-logs/"
  emr_release_label  = "emr-6.3.0"
  emr_security_configurations       = {}
  emr_tags           = {
    Terraform   = "true"
    Environment = "dev"
  }
}

