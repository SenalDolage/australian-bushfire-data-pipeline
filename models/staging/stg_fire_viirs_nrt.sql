with source as (

    select
        *
    from {{ source('bronze', 'raw_fire_viirs_nrt') }}

),

renamed as (

    select
        acq_date,
        acq_time,
        latitude,
        longitude,
        scan,
        track,
        satellite,
        instrument,
        confidence,
        version,
        bright_t31,
        frp,
        brightness,
        daynight,

        'NRT' as source_type,
        'VIIRS' as satellite_type


    from source

)

select * from renamed
