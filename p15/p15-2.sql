select from_user, count(*) as total_email_cnt, row_number() over (order by count(*) desc) as unique_rank
from emails
group by from_user