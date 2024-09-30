select
    ag.group as age_group,
    count(*) as trips, 
    sum(price_rub) as revenue_rub
from {{ ref("trips_users" )}} tu 
left join {{ ref("age_groups") }} ag on tu.age between ag.age_start and ag.age_end
group by ag.group 
order by ag.group 