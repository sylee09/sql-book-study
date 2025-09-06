select e1.name
from employee e1 join employee e2 on e1.manager_id = e2.emp_id
where e1.salary>e2.salary;