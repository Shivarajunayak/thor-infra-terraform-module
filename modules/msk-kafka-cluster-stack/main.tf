module "msk-kafka-cluster" {
 
 source = "./terraform-aws-msk-kafka-cluster"

  cluster_name        = "example-cluster"
  kafka_version       = "2.7.0"
  number_of_broker_nodes = 3

  encryption_info {
    encryption_in_transit {
      client_broker = true
    }
  }

  logging_info {
    broker_logs {
      cloudwatch_logs {
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
