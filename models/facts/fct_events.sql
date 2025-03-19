{{ 
    config(
        materialized = 'incremental',
        unique_key = 'booking_id',
        incremental_strategy = 'merge'
    ) }}

    SELECT *
    FROM {{ ref('stg_events') }}