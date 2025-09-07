terraform {
  backend "gcs" {
    bucket = "TFSTATE_BUCKET_NAME_REPLACE_ME"
    prefix = "terraform/state"
  }
}
