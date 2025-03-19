SELECT check_in
FROM {{ source('rental', 'bookings') }}
WHERE check_in > check_out