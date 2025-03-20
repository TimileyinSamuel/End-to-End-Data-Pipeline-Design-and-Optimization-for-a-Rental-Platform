{{ 
    config(
        materialized = 'incremental',
        unique_key = 'event_id',
        incremental_strategy = 'append'
    ) }}

    SELECT event_id, booking_id, event_type, event_impact
    FROM {{ref ('stg_events') }}