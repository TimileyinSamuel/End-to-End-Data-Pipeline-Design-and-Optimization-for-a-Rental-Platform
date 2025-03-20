WITH raw_events AS (
    SELECT *
    FROM {{ source('rental', 'events') }}
)
    SELECT 
        MD5(CONCAT(booking_id, event_type, event_impact)) AS event_id, 
        booking_id, 
        event_type, 
        event_impact
    FROM raw_events