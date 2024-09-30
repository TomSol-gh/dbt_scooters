select 
    company,
    count(distinct model) as models,
    sum(scooters) as scooters
from {{ ref("models") }}
group by company 