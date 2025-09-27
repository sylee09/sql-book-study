select player_id, device_id as first_login_device
from activity
where (player_id, event_date) in 
(
	select player_id,min(event_date)
    from activity
    group by player_id
)