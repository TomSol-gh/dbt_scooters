with
    initial_name_cte as (
        select distinct first_name, sex
        from {{ source("scooters_raw", "users") }}
        where sex in ('F', 'M')
        order by sex, first_name
    ),
    users_sex as (
        select *
        from {{ ref("users_sex") }}
    )
select id, first_name, last_name, phone, birth_date, coalesce(u.sex, ic.sex, us.sex) as sex
from scooters_raw.users u
left join initial_name_cte ic using (first_name)
left join users_sex us using (first_name)
order by id
