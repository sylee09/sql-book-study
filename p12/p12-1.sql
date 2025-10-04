select name
from customer
where customer_id not in 
(
	select customer_id
    from customer
    where referee_id = 2
)