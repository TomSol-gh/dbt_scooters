select 
	user_age,
	avg(trips) as avg_trips,
    avg(revenue_rub) as avg_revenue_rub
from {{ref("trips_age_daily")}}
group by user_age