output "url" {
  description = "URL of the bucket (e.g. gs://...)."
  value       = google_storage_bucket.sample_bucket.url
}