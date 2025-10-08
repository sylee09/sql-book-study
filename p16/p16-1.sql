select seat_id
from 
(
	select seat_id, free, lead(free) over (order by seat_id asc) as next, lag(free) over (order by seat_id asc) as prev
	from seats
)t
where free = 1 and (next = 1 or prev = 1)
order by seat_id asc;