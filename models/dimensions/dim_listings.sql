WITH stg_listings AS (
    SELECT *
    FROM {{ ref("stg_listings") }}
)
    SELECT listing_id, host_id, property_type, room_type, price, availability_365, minimum_nights, maximum_nights, competitor_price
    FROM stg_listings