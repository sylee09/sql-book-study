select username
from
(
	select  distinct concat(uploader_firstname,' ', uploader_lastname) as username, count(*) as cnt,
	rank() over (order by count(*) desc) as rk
	from user_videos uv join reviews r 
	on uv.review_id = r.review_id
	where r.reviewed_outcome = 'approved'
	group by uploader_firstname, uploader_lastname	
)t 
where rk=1;