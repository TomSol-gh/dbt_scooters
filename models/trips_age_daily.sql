with trips_users as (
	select 
		*
	from {{ref("trips_prep")}} t
	join {{source("scooters_raw", "users")}} u
	on t.user_id = u.id 
)
	select 
		started_at::date as date, 
		extract(year from age(started_at::date, birth_date)) user_age,
		count(*) as trips,
        sum(price_rub) as revenue_rub
	from trips_users 
	group by 
		started_at::date, 
		extract(year from age(started_at::date, birth_date)) 
