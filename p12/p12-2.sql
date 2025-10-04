select sales_name
from sales_person
where sales_id not in 
(
	select
		sales_id
	from orders
    where com_id in (
		select
			com_id
		from company
        where com_name = 'Red'
	)
)