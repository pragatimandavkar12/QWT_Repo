{{ config(materialized = 'table') }}

select 
  OrderID ,
  LineNo ,
  ShipperID ,
  CustomerID ,
  ProductID ,
  EmployeeID ,
  to_date(split_part(ShipmentDate , ' ', 1)) as ShipmentDate,
  Status
from {{source("qwt_project","raw_shipments")}}