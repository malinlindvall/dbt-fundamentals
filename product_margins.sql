create or replace table dev_malin_test.raw.product_margins as (

select
    product_id,
    product_name,
    product_sales_price - product_buy_in_price as product_margin
from MALIN_TEST.RAW.PRODUCTS

);