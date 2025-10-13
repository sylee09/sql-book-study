select 
	language,
	count(distinct case
					when device in ('macbook pro', 'iphone 5s', 'ipad air') then t1.user_id end) as apple_user_count,
	count(distinct t1.user_id) as total_user_count
from (
	select distinct
    user_id,
    device
    from purchase_events
)as t1
join purchase_users as t2
on t1.user_id = t2.user_id
group by language
