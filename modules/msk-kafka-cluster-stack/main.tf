module "msk_kafka_cluster" {
  source  = "terraform-aws-modules/msk/aws"
  version = "2.0.0"

  cluster_name        = "example-cluster"
  kafka_version       = "2.7.0"
  number_of_broker_nodes = 3

  encryption_info = {
    encryption_in_transit = {
      client_broker = true
    }
  }

  logging_info = {
    broker_logs = {
      cloudwatch_logs = {
        enabled = true
        log_group = "/aws/msk/example-cluster"
      }
    }
  }

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}