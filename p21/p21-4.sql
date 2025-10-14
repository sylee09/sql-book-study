select round(count(case when rk = 1 and date_sub(next_event_date, interval 1 day) = event_date then player_id end) / count(distinct player_id),2) as login_again_rate
from
(
	select player_id, event_date, lead(event_date) over (partition by player_id order by event_date) as next_event_date, 
	rank() over (partition by player_id order by event_date) as rk
	from activity
)t