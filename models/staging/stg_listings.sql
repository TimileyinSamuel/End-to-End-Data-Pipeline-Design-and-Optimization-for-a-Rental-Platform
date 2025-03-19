WITH raw_listings AS (
    SELECT *
    FROM {{ ref('listings_snapshot') }}
)
    SELECT id AS listing_id, listing_url, name AS listing_name, source, description, property_type,
        room_type, accommodates, availability_365, minimum_nights, maximum_nights, price, competitor_price,
        host_id, host_name, host_since, host_url
    FROM raw_listings
    WHERE dbt_valid_to IS NULL