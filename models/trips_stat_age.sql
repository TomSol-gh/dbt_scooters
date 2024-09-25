with trips_users as (
	select 
		*
	from scooters_raw.trips t 
	join scooters_raw.users u 
	on t.user_id = u.id 
),
trips_age as (
	select 
		started_at::date as date, 
		extract(year from age(started_at::date, birth_date)) user_age,
		count(*) as trips
	from trips_users tu
	group by 
		started_at::date, 
		extract(year from age(started_at::date, birth_date)) 
) 
select 
	user_age,
	avg(trips) as avg_trips
from trips_age
group by user_age