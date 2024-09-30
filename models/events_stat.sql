select 
    count("type" = 'cansel_search' or null) / cast(count("type" = 'start_search' or null) as float) * 100 as cancel_pct
from {{ ref("events_full") }}