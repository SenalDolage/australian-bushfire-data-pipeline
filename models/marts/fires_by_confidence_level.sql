-- How is confidence level distributed across sources/satellites? 
-- Does higher confidence mean higher fire intensity?

select
    acq_date,
    source_type,
    satellite_type,
    confidence,
    count(*) as fire_detections_count,
    avg(cast(frp as float)) as avg_frp
from {{ ref('fire_detections_cleaned') }}
group by
    acq_date,
    source_type,
    satellite_type,
    confidence
order by
    acq_date asc,
    source_type,
    satellite_type,
    confidence


