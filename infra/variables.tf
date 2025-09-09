variable "project_id" {
  description = "paysim-fin"
  type        = string
}

variable "region" {
  description = "europe-west2"
  type        = string
  default     = "europe-west2"
}

variable "location" {
  description = "Location for BigQuery and GCS"
  type        = string
  default     = "europe-west2"
}
