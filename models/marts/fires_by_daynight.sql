-- Are more fires detected during day or night? Does fire intensity differ?

select
    acq_date,
    daynight,
    count(*) as fire_detections_count,
    avg(cast(frp as float)) as avg_frp
from {{ ref('fire_detections_cleaned') }}
group by
    acq_date,
    daynight
order by
    acq_date asc,
    daynight
