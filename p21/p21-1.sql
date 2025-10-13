select employee_title, gender, round(avg(salary+total_bonus),0) as avg_compensation
from employee e join 
(
	select employee_id, sum(bonus) as total_bonus
    from bonus
    group by employee_id
) b
on e.employee_id = b.employee_id
group by employee_title, gender