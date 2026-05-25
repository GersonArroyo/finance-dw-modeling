
--- staging schema and data loading
CREATE SCHEMA staging;

--- staging.transactions ---
CREATE TABLE staging.transactions (
    row_index text,
    trans_date_trans_time text,
    cc_num text,
    merchant text,
    category text,
    amt	text,
    first text,
    last text,
    gender text,
    street text,
    city text,
    state text,
    zip	text,
    lat	text,
    long text,
    city_pop text,
    job	text,
    dob	text,
    trans_num text,
    unix_time text,
    merch_lat text,
    merch_long text,
    is_fraud text

);
COPY staging.transactions 
FROM '/data/fraudTrain.csv' 
DELIMITER ',' 
CSV HEADER;
