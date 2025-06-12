-- How many fire detections happen per day, per source_type, per satellite_type?

select 
acq_date,
source_type,
satellite_type,
count(*) as fire_detection_count,
avg(cast(frp as float)) as avg_frp
from {{ ref('fire_detections_cleaned') }}
group by
    acq_date,
    source_type,
    satellite_type
order by
    acq_date asc,
    source_type,
    satellite_type
