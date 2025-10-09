select activity_date as day, count(distinct user_id) as active_user_count
from activity
where activity_date > date_sub("2024-07-27", interval 30 day) and activity_date <= "2024-07-27"
group by activity_date