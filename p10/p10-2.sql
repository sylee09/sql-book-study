select buyer_id, join_date, sum(case when order_date like '2025-%' then 1 else 0 end) as orders_in_2025
from users u left join
orders o on u.user_id = o.buyer_id
group by buyer_id, join_date
order by buyer_id;