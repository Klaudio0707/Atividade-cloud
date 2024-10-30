provider "aws" {
  region                      = var.region
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  access_key                  = "test"  # Credenciais fictícias para o LocalStack
  secret_key                  = "test"
  s3_force_path_style         = true

  endpoints {
    sqs = "http://sqs.us-east-1.localhost.localstack.cloud:4566"
    sns = "http://sns.us-east-1.localhost.localstack.cloud:4566"
    s3  = "http://s3.us-east-1.localhost.localstack.cloud:4566"
  }
}


# Crie os buckets S3
resource "aws_s3_bucket" "local_files" {
  bucket = "${var.prefix}local-files"
}

resource "aws_s3_bucket" "bronzeclaud" {
  bucket = "${var.prefix}bronze"
}

resource "aws_s3_bucket" "silverclaud" {
  bucket = "${var.prefix}silver"
}

resource "aws_s3_bucket" "goldclaud" {
  bucket = "${var.prefix}gold"
}

# Crie o tópico SNS
resource "aws_sns_topic" "notificacoes" {
  name = "${var.prefix}notificacoes"
}

# Crie a fila SQS
resource "aws_sqs_queue" "fila_notificacoes" {
  name = "meu-projeto-fila-notificacoes"
}

resource "aws_sns_topic_subscription" "bucket_bronze_subscription_v2" {
  topic_arn      = aws_sns_topic.notificacoes.arn
  protocol       = "sqs"
  endpoint       = aws_sqs_queue.fila_notificacoes.arn

}

resource "aws_sns_topic_subscription" "bucket_silver_subscription_v2" {
  topic_arn      = aws_sns_topic.notificacoes.arn
  protocol       = "sqs"
  endpoint       = aws_sqs_queue.fila_notificacoes.arn

}

resource "aws_sns_topic_subscription" "bucket_gold_subscription_v2" {
  topic_arn      = aws_sns_topic.notificacoes.arn
  protocol       = "sqs"
  endpoint       = aws_sqs_queue.fila_notificacoes.arn
 
}

