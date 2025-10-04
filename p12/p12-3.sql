select customer_id, count(*) as no_trans_count
from visits
where visit_id not in
(
	select visit_id
    from transactions
)
group by customer_id;