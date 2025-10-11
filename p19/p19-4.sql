select login_date, count(*) as user_count
from
(
	select user_id, min(activity_date) as login_date
	from traffic
	where activity = 'login'
	group by user_id
)t
where login_date >= date_sub('2025-06-30',interval 90 day)
group by login_date;