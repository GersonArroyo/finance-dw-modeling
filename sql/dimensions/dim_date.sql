INSERT INTO dw.dimDate (dateKey, date, day, month, year, quarter)
SELECT DISTINCT
    TO_CHAR(trans_date_trans_time::timestamp, 'YYYYMMDD')::int as dateKey,
    trans_date_trans_time::timestamp::date as date,
    EXTRACT(DAY FROM trans_date_trans_time::timestamp) as day,
    EXTRACT(MONTH FROM trans_date_trans_time::timestamp) as month,
    EXTRACT(YEAR FROM trans_date_trans_time::timestamp) as year,
    EXTRACT(QUARTER FROM trans_date_trans_time::timestamp) as quarter
FROM staging.transactions;