select t1.follower, sum(case when t2.followee is null then 0 else 1 end) as follower_count
from sns_follow_log t1
left join sns_follow_log t2 on t1.follower = t2.followee
group by t1.follower
order by follower_count desc