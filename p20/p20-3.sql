select name as results
from
(
	select name, rank() over (order by cnt desc, name asc) as rk
	from
	(
		select distinct u.user_id, name, count(*) over (partition by u.user_id) as cnt
		from users u join movie_score ms 
		on u.user_id = ms.user_id
	)t
)t
where rk = 1
union all
select title as results
from
(
	select title, rank() over (order by sc desc, title asc) as rk
	from
	(
		select m.movie_id, title, avg(score) as sc
		from movies m join movie_score ms
		on m.movie_id = ms.movie_id
		where year(ms.created_at) = 2025 and month(ms.created_at) = 2
		group by movie_id
	)t
)t
where rk = 1;