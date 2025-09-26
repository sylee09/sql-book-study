select customer_id
from customer 
group by customer_id
having count(distinct(product_id)) = (select count(*) from product)