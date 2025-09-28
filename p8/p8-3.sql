select player_id, event_date, sum(games_played) over (partition by player_id order by event_date)
from activity
group by player_id, event_date
order by player_id asc;