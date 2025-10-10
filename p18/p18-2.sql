select 
	sell_date, 
	count(distinct product) as sold_count,
	group_concat(distinct product  order by product separator ',') as products
from activities
group by sell_date;
