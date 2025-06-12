select
    acq_date,
    acq_time,
    daynight,
    latitude,
    longitude,
    brightness,
    scan,
    track,
    satellite,
    instrument,
    cast(confidence as string) as confidence,
    version,
    bright_t31,
    frp,
    type,
    null as bright_ti4,
    source_type,
    satellite_type
from {{ ref('stg_fire_modis_archive') }}

union all

select
    acq_date,
    acq_time,
    daynight,
    latitude,
    longitude,
    brightness,
    scan,
    track,
    satellite,
    instrument,
    cast(confidence as string) as confidence,
    version,
    bright_t31,
    frp,
    null as type,
    null as bright_ti4,
    source_type,
    satellite_type
from {{ ref('stg_fire_modis_nrt') }}

union all

select
    acq_date,
    acq_time,
    null as daynight,
    latitude,
    longitude,
    null as brightness,
    scan,
    track,
    satellite,
    instrument,
    cast(confidence as string) as confidence,
    version,
    bright_t31,
    frp,
    type,
    bright_ti4,
    source_type,
    satellite_type
from {{ ref('stg_fire_viirs_archive') }}

union all

select
    acq_date,
    acq_time,
    daynight,
    latitude,
    longitude,
    brightness,
    scan,
    track,
    satellite,
    instrument,
    cast(confidence as string) as confidence,
    version,
    bright_t31,
    frp,
    null as type,
    null as bright_ti4,
    source_type,
    satellite_type
from {{ ref('stg_fire_viirs_nrt') }}
