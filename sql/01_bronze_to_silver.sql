CREATE OR REPLACE TABLE `{{project}}.silver.paysim_clean` AS
SELECT
  step,
  type,
  amount,
  nameOrig,
  oldbalanceOrg,
  newbalanceOrig,
  nameDest,
  oldbalanceDest,
  newbalanceDest,
  isFraud,
  isFlaggedFraud
FROM `{{project}}.bronze.paysim_raw`
WHERE amount > 0;
