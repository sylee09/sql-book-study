select emp_id, event_day, sum(out_time)-sum(in_time) as total_time
from employees
group by emp_id, event_day