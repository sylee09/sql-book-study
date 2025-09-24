select t2.name, t1.department, t2.salary, t1.avg_salary
from 
( select department, round(avg(salary),2) as avg_salary
from employee
group by department ) t1 inner join employee t2 on t1.department = t2.department
order by department asc