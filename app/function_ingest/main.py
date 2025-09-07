import os
from google.cloud import bigquery, storage
import pandas as pd

PROJECT    = os.environ.get("GCP_PROJECT") or os.environ.get("PROJECT_ID")
DATASET_BZ = os.environ.get("DATASET_BZ", "bronze")
TABLE_BZ   = os.environ.get("TABLE_BZ", "paysim_raw")

bq = bigquery.Client()
gcs = storage.Client()

def gcs_ingest(event, context=None):
    bucket = event["bucket"]; name = event["name"]
    if not name.lower().endswith(".csv"):
        print(f"Skip non-CSV: {name}")
        return

    blob = gcs.bucket(bucket).blob(name)
    data = blob.download_as_text()
    df = pd.read_csv(pd.io.common.StringIO(data))

    df.columns = [c.strip().replace(" ", "_").replace("-", "_").lower() for c in df.columns]
    df["source_object"] = name
    df["ingest_ts"] = pd.Timestamp.utcnow()

    table_id = f"{PROJECT}.{DATASET_BZ}.{TABLE_BZ}"
    job = bq.load_table_from_dataframe(df, table_id)
    job.result()
    print(f"Ingested {len(df)} rows to {table_id}")
