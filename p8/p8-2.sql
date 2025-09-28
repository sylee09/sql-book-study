select person_name
from
(
	select
		turn, 
		person_name,
		sum(weight) over (order by turn) as accumulated_weight
	from queue
	order by turn
)t
where accumulated_weight <= 1000
order by turn desc limit 1;