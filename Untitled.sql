create schema malin_test.raw;

create table malin_test.raw.products 
(product_id  string,
product_name  string,
product_created_at_date  date,
product_buy_in_price  decimal,
product_sales_price  decimal);


insert into malin_test.raw.products values(
'3', 'napkins', '2025-10-22', 10, 15
);

select * from malin_test.raw.products; 


create or replace transient database dev_malin_test clone MALIN_TEST data_retention_time_in_days = 1;


create role prod_role;
grant usage on database malin_test to role prod_role;
grant usage on all schemas in database malin_test to role prod_role;
grant usage on future schemas in database malin_test to role prod_role;
grant all on all tables in schema malin_test.raw to role prod_role;
grant all on future tables in schema malin_test.raw to role prod_role;


grant all PRIVILEGES on all schemas in database dev_malin_test to role dev_role;

grant role dev_role to user MALINLINDVALLDBT;

use role dev_role;

select * from MALIN_TEST.RAW.PRODUCTS;

show grants to role dev_role;


create 
