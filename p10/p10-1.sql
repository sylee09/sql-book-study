select u.name, ifnull(sum(r.distance),0) as traveled_distance
from users u left join rides r on u.id = r.user_id
group by u.id, u.name
order by traveled_distance desc;