{{ config(materialized = 'view', schema = 'reporting_dev')}}

select
c.companyname,
c.contactname,
c.city,
c.country,
c.divisionname,
count(distinct o.orderid) as totalorders,
sum(o.quantity) as totalquantity,
sum(o.linesalesamount) as totalsales,
avg(o.margin) as avgmargin
from {{ref('dmt_customers')}} as c
inner join {{ref('fct_orders')}} as  o
on c.customerid = o.customerid
where c.divisionname = '{{var('v_division', 'Europe')}}'
group by c.companyname, c.contactname, c.city, c.country, c.divisionname