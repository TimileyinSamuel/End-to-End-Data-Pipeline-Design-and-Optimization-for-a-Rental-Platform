WITH bookings AS (
    SELECT 
        d.month_name,
        b.listing_id,
        c.travel_purpose,
        c.age_group,
        SUM(b.total_price) AS total_revenue,
        ROUND(AVG(b.total_price), 2) AS avg_booking_value,    
    FROM {{ref('fct_bookings')}} b
    LEFT JOIN {{ref('dim_dates')}} d ON b.check_in = d.full_date
    LEFT JOIN {{ref('dim_customers')}} c ON b.customer_id = c.customer_id
    GROUP BY d.month_name, b.listing_id, c.travel_purpose, c.age_group
),

final AS (
      SELECT
        *,
        SUM(total_revenue) OVER(PARTITION BY listing_id) AS revenue_per_listing,
        SUM(total_revenue) OVER(PARTITION BY travel_purpose) AS revenue_per_travel_purpose,
        SUM(total_revenue) OVER(PARTITION BY age_group) AS revenue_per_age_group
      FROM bookings
    )

SELECT *
FROM final