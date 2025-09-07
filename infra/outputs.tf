output "raw_bucket" {
  value       = google_storage_bucket.raw.name
  description = "GCS bucket for raw files"
}
