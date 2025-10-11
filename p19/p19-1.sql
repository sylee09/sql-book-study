select name, department, salary
from 
(
	select name, department, salary, rank() over (partition by department order by salary desc) as r
	from employee
)t
where r = 1;