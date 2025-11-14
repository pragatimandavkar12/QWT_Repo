{{config(materialized = 'table',schema = 'transforming_dev')}}

select
p.productid,
p.productname,
c.categoryname,
s.CompanyName as supplierCompany,
s.ContactName as supplierContact,
s.City as supplierCity,
s.Country as supplierCountry,
p.quantityperunit,
p.unitcost,
p.unitprice,
p.unitsinstock,
p.unitsonorder,
iff(p.unitsinstock > p.unitsonorder, 'ProductAvailable', 'ProductNotAvailable') as ProductAvailability


from {{ref('stg_products')}} as p
inner join {{ref('stg_suppliers')}} as s
on p.SupplierID = s.SupplierID
inner join {{ref('lkp_categories')}} as c
on c.categoryid = p.categoryid