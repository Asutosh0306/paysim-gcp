CREATE OR REPLACE TABLE `paysim-fin.gold.paysim_features` AS
SELECT
  type,
  amount,
  (oldbalanceorg - newbalanceorig) AS balance_diff,
  (newbalancedest - oldbalancedest) AS inflow,
  CAST(isfraud AS BOOL)            AS label_isfraud
FROM `paysim-fin.silver.paysim_clean`;
