CREATE OR REPLACE MODEL `{{project}}.gold.fraud_lr`
OPTIONS(model_type = 'logistic_reg', input_label_cols=['label_isfraud']) AS
SELECT
  amount,
  balance_diff,
  inflow,
  CASE type
    WHEN 'CASH_OUT' THEN 1
    WHEN 'TRANSFER' THEN 2
    WHEN 'PAYMENT'  THEN 3
    WHEN 'CASH_IN'  THEN 4
    WHEN 'DEBIT'    THEN 5
    ELSE 0
  END AS type_code,
  label_isfraud
FROM `{{project}}.gold.paysim_features`;
