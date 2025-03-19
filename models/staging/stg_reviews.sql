WITH raw_reviews AS (
    SELECT *
    FROM {{ source('rental', 'reviews') }}
)
    SELECT id AS review_id, listing_id, CAST(date AS DATE) AS review_date, reviewer_id, reviewer_name, comments
    FROM raw_reviews