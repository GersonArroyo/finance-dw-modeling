INSERT INTO dw.factTransaction 
SELECT DISTINCT
    st.trans_num,
    st.amt::decimal(10,2),
    st.is_fraud::boolean,
    st.cc_num,
    dm.merchant_id,
    TO_CHAR(st.trans_date_trans_time::timestamp, 'YYYYMMDD')::int AS date_key
FROM staging.transactions st
JOIN dw.dimMerchant dm ON dm.merchant_name = st.merchant;
