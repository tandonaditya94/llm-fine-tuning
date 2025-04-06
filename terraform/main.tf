provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "mlflow_bucket" {
  bucket = "llm-finetune-artifacts"
  force_destroy = true
}

resource "aws_db_instance" "rds_postgres" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "postgres"
  engine_version       = "15.3"
  instance_class       = "db.t3.micro"
  name                 = "llmfinetunedb"
  username             = "postgres"
  password             = "llmfinetune"
  skip_final_snapshot  = true

  publicly_accessible  = true
  db_subnet_group_name = "default"
}
