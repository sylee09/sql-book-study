select seller_id
from
(
	select seller_id,  rank() over (order by sum(price) desc) as r
	from sales
	group by seller_id
)t
where r = 1