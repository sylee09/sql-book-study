select p.product_name, sum(o.unit) as unit
from products p join orders o on p.product_id = o.product_id
where date_format(o.order_date,'%Y-%m') = '2025-02'
group by p.product_name having unit>=100