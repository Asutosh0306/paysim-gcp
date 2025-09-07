resource "google_storage_bucket" "raw" {
  name                        = "${var.project_id}-raw"
  location                    = var.location
  uniform_bucket_level_access = true
  force_destroy               = true
}
