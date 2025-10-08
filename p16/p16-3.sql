select seat_id, 
case when seat_id % 2 = 1 then ifnull(next_student,student) else prev_student end as student
from
(
	select seat_id, student, lag(student) over (order by seat_id asc) as prev_student, lead(student) over (order by seat_id asc) as next_student
	from seat
)t