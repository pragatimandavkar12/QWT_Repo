{{ config(materialized = 'table', schema = env_var('DBT_STGSCHEMA_NAME','AUDITING_DEV')) }}

select *
from {{source("qwt_project","raw_employees")}}