select max(num) as max_num
from
(
	select 
		num	
	from my_numbers
    group by num
    having count(*) = 1
)t;