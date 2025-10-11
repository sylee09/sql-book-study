select r as id, cnt as frient_count
from
(
	select r, count(*) as cnt, rank() over (order by count(*) desc) as rnk
	from
	(
		select requester_id as r
		from request_accepted 
		union all
		select accepter_id as r
		from request_accepted
	)t1
	group by r
)t2
where rnk = 1;

