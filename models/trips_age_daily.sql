select 
   date, 
    age,
    count(*) as trips,
    sum(price_rub) as revenue_rub
from {{ ref("trips_users") }} 
group by 
    started_at::date, 
    extract(year from age(started_at::date, birth_date)) 
