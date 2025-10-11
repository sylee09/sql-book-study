select candidate as winner
from
(
	select voter, candidate, count(candidate) over (partition by voter) as num
	from voting_results
)t
group by candidate
order by sum(1/num) desc limit 1;
