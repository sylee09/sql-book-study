select weather_id
from
(
	select weather_id, record_date, temperature, lag(temperature) over (order by record_date asc) as prev_temperature,
    lag(record_date) over (order by record_date asc) as prev_date
	from weather
)t
where t.temperature>prev_temperature and prev_date = date_sub(record_date,interval 1 day);