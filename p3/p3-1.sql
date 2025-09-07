select contest_id, round(registered_users/cnt*100,2) as percentage
from 
(
	select count(*) as cnt
    from users
) t1 cross join
(
	select contest_id, count(*) as registered_users
    from register r left join users u on r.user_id = u.user_id
    group by contest_id
)t2
order by percentage desc, contest_id asc;