{{config (materialized = 'table', schema = 'transforming_dev')}}

select 
o.orderid,
od.lineno,
o.customerid,
o.employeeid,
o.shipperid,
od.productid,
o.freight,
od.unitprice,
od.quantity,
od.discount,
o.orderdate,
round((od.unitprice * od.quantity) * (1 - od.discount)) as linesalesamount,
p.unitcost * od.quantity as costofgoodsold,
((od.unitprice * od.quantity) * (1 - od.discount) - (p.unitcost * od.quantity)) as margin
from
{{ref('stg_orders')}} as o
inner join 
{{ref('stg_orderdetails')}} as od 
on o.orderid = od.orderid
inner join
{{ref('stg_products')}} as p
on od.productid = p.productid