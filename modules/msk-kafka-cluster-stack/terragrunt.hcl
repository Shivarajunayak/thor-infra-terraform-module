terraform {
  source = "./terraform-aws-msk-kafka-cluster"s"
}

inputs = {
  cluster_name       = "example-cluster"
  number_of_broker_nodes = 3
  broker_node_group_type = "default"
  broker_instance_type = "kafka.m5.large"
  broker_ebs_volume_size = 1000
  kafka_version = "2.8.1"
  enhanced_monitoring = "PER_BROKER"
  encryption_in_transit = true
  client_authentication = "TLS"
  monitoring_prometheus_jmx_exporter = true
  tags = {
    Environment = "dev"
    Terraform   = "true"
    Project     = "example-project"
  }
}

