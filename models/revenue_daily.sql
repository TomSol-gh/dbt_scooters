select 
    date,
    sum(price_rub) as revenue_rub,
    now() at time zone 'utc' as updated_at
from {{ ref("trips_prep") }}
{% if is_incremental() %}
where
    date > (select max(date) - interval '2' day from {{ this }}) 
{% else %}
{% endif %}
group by date , now() at time zone 'utc'
order by date 