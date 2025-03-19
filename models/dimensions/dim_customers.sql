WITH stg_customers AS (
    SELECT *
    FROM {{ ref("stg_customers") }}
)
    SELECT customer_id, age_group, travel_purpose, loyalty_status
    FROM stg_customers