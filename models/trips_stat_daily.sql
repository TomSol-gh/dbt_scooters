select 
	date,
	count(id) as trips,
	max(price_rub) as max_price_rub,
    avg(price_rub) / avg(duration_s) * 60 as avg_price_rub_per_min,
	avg(distance_m) / 1000 as avg_distance_km
from {{ref("trips_prep")}}
group by date
order by date 