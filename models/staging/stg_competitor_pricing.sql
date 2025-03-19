WITH raw_competitor_pricing AS (
    SELECT *
    FROM {{ source('rental', 'competitor_pricing') }}
)
    SELECT listing_id, competitor_price
    FROM raw_competitor_pricing