select date_format(trans_date,'%Y-%m') as month, country,
count(*) as trans_count, sum(amount) as trans_amount, 
sum(case when state = 'approved' then 1 else 0 end) as approved_count,
sum(case when state = 'approved' then amount else 0 end) as approved_amount
from transactions
group by month, country
