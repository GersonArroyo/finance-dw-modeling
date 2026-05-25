INSERT INTO dw.dimMerchant (merchant_name, category, merch_lat, merch_long)
SELECT DISTINCT
    merchant as merchant_name,
    category,
    merch_lat::decimal(10,6),
    merch_long::decimal(10,6)
FROM staging.transactions;
