WITH stg_listings AS (
    SELECT *
    FROM {{ ref("stg_listings") }}
)
    SELECT host_id, 
           MAX(host_name) AS host_name,
           MAX(host_since) AS host_since, 
           COUNT(listing_id) AS host_listings_count
    FROM stg_listings
    GROUP BY host_id