select max(salary) as second_highest_salary
from
(
	select employee_id,salary, dense_rank() over (order by salary desc) as `rank`
	from employee
)t
where `rank` = 2