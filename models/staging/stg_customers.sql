WITH raw_customers AS (
    SELECT *
    FROM {{ ref('customers_snapshot') }}
)
    SELECT customer_id, age_group, travel_purpose, loyalty_status
    FROM raw_customers
    WHERE dbt_valid_to IS NULL