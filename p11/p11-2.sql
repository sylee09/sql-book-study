select game, count(*) as athletes_count
from olympics_athletes
group by game
order by athletes_count desc limit 1;