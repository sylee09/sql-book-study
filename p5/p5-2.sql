select input, round(sum(rating/position)/count(*),2) as quality,
round(sum(case when rating < 3 then 1 else 0 end)/count(*)*100,2) as poor_rating_percentage
from model
group by input