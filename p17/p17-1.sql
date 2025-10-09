select user_id, max(time_stamp) as last_stamp
from logins
where date_format(time_stamp, "%y") = 24
group by user_id