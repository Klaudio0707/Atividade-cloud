output "local_files_bucket_name" {
  value = aws_s3_bucket.local_files.bucket
}

output "bronze_bucket_name" {
  value = aws_s3_bucket.bronzeclaud.bucket
}

output "silver_bucket_name" {
  value = aws_s3_bucket.silverclaud.bucket
}

output "gold_bucket_name" {
  value = aws_s3_bucket.goldclaud.bucket
}


output "notification_queue_url" {
  value = aws_sqs_queue.fila_notificacoes.url
}