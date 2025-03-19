{{ config(
    materialized = 'incremental',
    unique_key = 'booking_id',
    on_schema_change = 'fail',
    incremental_strategy = 'merge'
) }}

SELECT *,
    check_out - check_in AS length_of_stay,
    ROUND(total_price/ (check_out - check_in) ,2) AS revenue_per_night,
    CASE WHEN check_in IS NULL THEN FALSE
    ELSE TRUE
    END AS is_checked_in
FROM {{ ref('stg_bookings') }}