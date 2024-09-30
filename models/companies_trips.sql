with trips_cte as(
select 
    m.company, 
    count(id) as trips
from {{ ref(("trips_prep")) }} t
left join {{ ref("models") }} m 
on t.scooter_hw_id = m.hardware_id
group by m.company
)
select  
    company,
    trips,
    scooters,
    trips::float / scooters as trips_per_scooter
from trips_cte
left join {{ ref("companies") }} c 
using (company)