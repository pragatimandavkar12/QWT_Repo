{{config(materialized= 'table', 
    schema = env_var('DBT_STGSCHEMA_NAME','STAGING_DEV'),
    transient = false,
    pre_hook = "use warehouse compute_wh;",
    sql_header = "use role ACCOUNTADMIN;",    
    post_hook = "create or replace table QWT_DEV.STAGING_DEV.STG_PRODUCTS_TEST CLONE QWT_DEV.STAGING_DEV.STG_PRODUCTS;")
}}
  
   select *
   from
   {{source("qwt_project", "raw_products")}}