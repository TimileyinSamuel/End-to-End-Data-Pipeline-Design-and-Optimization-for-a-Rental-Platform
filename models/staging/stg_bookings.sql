WITH raw_bookings AS (
    SELECT *
    FROM {{ source('rental', 'bookings') }}
)
    SELECT booking_id, listing_id, customer_id, check_in, check_out, total_price
    FROM raw_bookings