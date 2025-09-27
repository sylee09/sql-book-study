select player_id, min(event_date) as first_login_date
from activity
group by player_id;