WITH raw_events AS (
    SELECT *
    FROM {{ source('rental', 'events') }}
)
    SELECT booking_id, event_type, event_impact
    FROM raw_events