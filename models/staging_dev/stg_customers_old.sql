{{ config(materialized = 'table') }}

select *
from {{source("qwt_project","raw_customers")}}