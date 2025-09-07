# PaySim GCP Data Engineering Project

This project demonstrates:
- Terraform IaC for bucket and BigQuery datasets
- Event driven ingestion with Cloud Functions (Gen2) to BigQuery bronze
- SQL ELT to silver and gold
- BigQuery ML logistic regression
- Cloud Build CI on each push

Prerequisites
- GCP project with billing linked
- Region europe-west2
- Cloud SDK and Terraform 1.6+

First time
- Do not run Terraform yet. We will set up the Terraform state bucket in Section 3.

CI
- Connect this repo to Cloud Build with a trigger on branch main using cloudbuild.yaml.

Load data later
- Upload PaySim CSV to gs://YOUR_PROJECT_ID-raw to trigger ingestion.
