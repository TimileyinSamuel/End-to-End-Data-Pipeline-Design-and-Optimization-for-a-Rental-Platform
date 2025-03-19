WITH raw_maintenance AS (
    SELECT *
    FROM {{ source('rental', 'maintenance') }}
)
    SELECT listing_id, issue_type, resolution_time
    FROM raw_maintenance