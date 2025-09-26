select business_id
from
(
	select event_type, avg(occurrences) as average
	from events
	group by event_type
)t1 join events t2 on t1.event_type = t2.event_type
where occurrences > average
group by business_id
having count(*) >= 2