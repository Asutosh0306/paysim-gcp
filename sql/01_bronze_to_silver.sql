CREATE OR REPLACE TABLE `{{project}}.silver.paysim_clean` AS
SELECT
  step,
  type,
  amount,
  nameorig,
  oldbalanceorg,
  newbalanceorig,
  namedest,
  oldbalancedest,
  newbalancedest,
  isfraud,
  isflaggedfraud,
  source_object,
  ingest_ts
FROM `{{project}}.bronze.paysim_raw`
WHERE amount > 0;
