select t.project_id, t.employee_id as longest_employee_id
from
(	select p.project_id, p.employee_id, rank() over (partition by project_id order by experience_years desc) as rk
	from project p join employee e
	on p.employee_id = e.employee_id
)t
where rk = 1