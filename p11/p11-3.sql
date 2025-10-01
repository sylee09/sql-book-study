select name
from candidate c join vote v on c.candidate_id = v.candidate_id
group by c.candidate_id, name
order by count(*) desc limit 1