--- dimCustomer ---
--- not in use columns: trans_date_trans_time, unix_time
create schema dw;
create table dw.dimCustomer (
    cc_num varchar(255) primary key,
    first varchar(255),
    last varchar(255),
    gender varchar(50),
    dob date,
    city_pop int,
    job varchar(255),
    street varchar(255),
    city varchar(255),
    state varchar(255),
    zip varchar(20),
    lat decimal(10, 6),
    long decimal(10, 6)
);

--- dimDate ---
create table dw.dimDate (
    dateKey int primary key,
    hour int,
    dayOfWeek varchar(20),
    date date not null,
    day int,
    month int,
    year int,
    quarter int
);

--- dimMerchant ---
create table dw.dimMerchant (
    merchant_id serial primary key,
    merchant_name varchar(255) not null,
    category varchar(255),
    merch_lat decimal(10, 6),
    merch_long decimal(10, 6)
);

--- factTransaction ---
create table dw.factTransaction (
    trans_num varchar(255) primary key, 
    amt decimal(10, 2),
    is_fraud boolean,
    cc_num varchar(255) references dw.dimCustomer(cc_num),
    merchant_id int references dw.dimMerchant(merchant_id),
    date_key int references dw.dimDate(dateKey)
);
