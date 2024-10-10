with montly_stat_cte as (
    select
        user_id,
        date_trunc('month', "date") as "month",
        count(*) as trips_per_month
    from
        {{ ref('trips_prep')}}
    group by
        1,
        2
)
/* Классификация пользователей по количеству поездок в месяц:
  rare - редкие/разовые поездки, не более 2 поездок в месяц */
select
    user_id,
    sum(trips_per_month) <= 2 as rare
from 
    montly_stat_cte
group by
    1