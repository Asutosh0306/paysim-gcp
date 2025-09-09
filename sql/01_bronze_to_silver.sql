CREATE OR REPLACE TABLE `paysim-fin.silver.paysim_clean` AS
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
FROM `paysim-fin.bronze.paysim_raw`
WHERE amount > 0;
