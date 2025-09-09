terraform {
  backend "gcs" {
    bucket = "tfstate-paysim-fin"
    prefix = "terraform/state"
  }
}
