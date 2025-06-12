with source as (

    select
        *
    from {{ source('bronze', 'raw_fire_modis_nrt') }}

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
        
        -- Add metadata columns:
        'NRT' as source_type,
        'MODIS' as satellite_type

    from source

)

select * from renamed
