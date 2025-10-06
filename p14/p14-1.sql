select score, dense_rank() over (order by score desc) 
from scores