select 
	date(started_at) as date,
	count(id) as trips,
	max(price) as max_price_rub,
	avg(distance) / 1000 as avg_distance_km
from scooters_raw.trips t 
group by date(started_at)