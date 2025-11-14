{{config(materialized = 'table', schema = env_var('DBT_STGSCHEMA_NAME','STAGING_DEV'),)}}

select 
get(xmlget(suppliersinfo, 'SupplierID'),'$') as SupplierID,
get(xmlget(suppliersinfo, 'CompanyName'),'$')::varchar as CompanyName,
get(xmlget(suppliersinfo, 'ContactName'),'$')::varchar as ContactName,
get(xmlget(suppliersinfo, 'Address'),'$')::varchar as Address,
get(xmlget(suppliersinfo, 'City'),'$')::varchar as City,
get(xmlget(suppliersinfo, 'PostalCode'),'$')::varchar as PostalCode,
get(xmlget(suppliersinfo, 'Country'),'$')::varchar as Country,
get(xmlget(suppliersinfo, 'Phone'),'$')::varchar as Phone,
get(xmlget(suppliersinfo, 'Fax'),'$')::varchar as Fax
from {{source("qwt_project", "raw_suppliers")}}