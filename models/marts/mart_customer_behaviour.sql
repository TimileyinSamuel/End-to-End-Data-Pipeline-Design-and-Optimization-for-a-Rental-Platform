WITH customer_bookings AS (
    SELECT 
        b.customer_id,
        c.age_group,
        c.travel_purpose,
        COUNT(b.booking_id) AS total_bookings,
        SUM(b.total_price) AS total_revenue,
        MIN(b.check_in) AS first_booking_date,
        MAX(b.check_in) AS last_booking_date,
        LAG(b.check_in) OVER (PARTITION BY b.customer_id ORDER BY b.check_in) AS prev_booking_date,
        b.check_in AS current_booking_date
    FROM {{ref('fct_bookings')}} b
    LEFT JOIN {{ref('dim_customers')}} c ON b.customer_id = c.customer_id
    GROUP BY b.customer_id, c.age_group, c.travel_purpose, b.check_in
),
final AS (
    SELECT 
        customer_id,
        age_group,
        travel_purpose,
        total_bookings,
        total_revenue,
        first_booking_date,
        last_booking_date,
        DATEDIFF('day', prev_booking_date, current_booking_date) AS days_between_bookings
    FROM customer_bookings
),
aggregated AS (
    SELECT 
        customer_id,
        age_group,
        travel_purpose,
        total_bookings,
        total_revenue,
        first_booking_date,
        last_booking_date,
        ROUND(AVG(days_between_bookings), 2) AS avg_days_between_bookings,
        CASE 
            WHEN total_bookings = 1 THEN 'New Customer'
            ELSE 'Repeat Customer'
        END AS customer_type
    FROM final
    GROUP BY customer_id, age_group, travel_purpose, total_bookings, total_revenue, first_booking_date, last_booking_date
)
SELECT * 
FROM aggregated
