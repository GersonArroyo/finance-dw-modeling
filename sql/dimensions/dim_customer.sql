INSERT INTO dw.dimCustomer (cc_num, first, last, gender, dob, city_pop, job, street, city, state, zip, lat, long)
SELECT DISTINCT
    cc_num,
    first,
    last,
    gender,
    dob::date as dob,
    city_pop::int,
    job,
    street,
    city,
    state,
    zip,
    lat::decimal(10,6),
    long::decimal(10,6)
FROM staging.transactions;
