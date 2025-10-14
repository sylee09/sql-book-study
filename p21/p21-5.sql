select t1.book_id
from books t1 join
(
	select book_id
	from books
	where book_id not in
	(
		select book_id
		from orders
		where delivery_date >= date_sub('2025-06-23', interval 1 year)
		group by book_id
		having sum(quantity)>=10
	)
)t2 on t1.book_id = t2.book_id and t1.published_date < date_sub('2025-06-23', interval 1 month)