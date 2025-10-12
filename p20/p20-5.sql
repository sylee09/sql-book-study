select t1.user_id, sum(timestampdiff(second,t1.timestamp,t2.timestamp))/count(t1.user_id) as avg_visit_time
from
(
	select user_id, timestamp, rank() over (partition by user_id, date_format(timestamp, "%Y-%m-%d") order by timestamp desc) as rk_start
	from web_log
	where action = 'page_load'
) t1 join
(
	select user_id, timestamp, rank() over (partition by user_id, date_format(timestamp, "%Y-%m-%d") order by timestamp asc) as rk_end
	from web_log
	where action = 'page_exit'
)t2 on t1.user_id = t2.user_id and date_format(t1.timestamp,"%Y-%m-%d") = date_format(t2.timestamp,"%Y-%m-%d")
where rk_start = 1 and rk_end = 1
group by t1.user_id

