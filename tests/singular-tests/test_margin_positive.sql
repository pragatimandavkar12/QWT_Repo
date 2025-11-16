select orderid, margin, sum(margin) as total_margin
from {{ref("fct_orders")}}
group by orderid, margin
having margin < 0
