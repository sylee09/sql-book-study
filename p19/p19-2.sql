select name
from employee
where id in
(
	select e1.id 
	from employee e1 join employee e2 
	on e1.id = e2.manager_id
	group by e1.id
	having (count(*)>=5)
)