with source as (

    select
        *
    from {{ source('bronze', 'raw_fire_modis_archive') }}

),

renamed as (

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
        confidence,
        version,
        bright_t31,
        frp,
        type,
        
        -- Add metadata columns:
        'Archive' as source_type,
        'MODIS' as satellite_type

    from source

)

select * from renamed
