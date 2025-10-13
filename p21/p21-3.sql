select
	sent_date,
    sum(accepted) / count(*) as accepted_rate
from (
	select
		sender_user,
        receiver_user,
        min(case when action = 'sent' then date end) as sent_date,
        sum(case when action = 'accepted' then 1 else 0 end) as accepted
	from friend_requests
    group by sender_user, receiver_user
) as a
group by sent_date
order by sent_date;