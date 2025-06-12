with source as (

    select
        *
    from {{ source('bronze', 'raw_fire_viirs_archive') }}

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
        bright_ti4,
        type,

        'Archive' as source_type,
        'VIIRS' as satellite_type


    from source

)

select * from renamed
