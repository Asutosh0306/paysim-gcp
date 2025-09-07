CREATE OR REPLACE TABLE `{{project}}.gold.paysim_features` AS
SELECT
  type,
  amount,
  (oldbalanceorg - newbalanceorig) AS balance_diff,
  (newbalancedest - oldbalancedest) AS inflow,
  CAST(isfraud AS BOOL)            AS label_isfraud
FROM `{{project}}.silver.paysim_clean`;
