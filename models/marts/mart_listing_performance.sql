WITH listing_revenue AS (
    SELECT 
        b.listing_id,
        l.host_id,
        COUNT(b.booking_id) AS total_bookings,
        SUM(b.total_price) AS total_revenue,
        ROUND(AVG(b.total_price), 2) AS avg_booking_value,
        ROUND(COUNT(b.booking_id) / 365.0, 2) AS occupancy_rate
    FROM {{ ref('fct_bookings') }} b
    LEFT JOIN {{ ref('dim_listings') }} l ON b.listing_id = l.listing_id
    GROUP BY b.listing_id, l.host_id
),

maintenance_issues AS (
    SELECT 
        m.listing_id,
        COUNT(m.issue_type) AS total_maintenance_issues,
        ROUND(AVG(m.resolution_time), 2) AS avg_resolution_time
    FROM {{ ref('fct_maintenance') }} m
    GROUP BY m.listing_id
),

final AS (
    SELECT 
        lr.listing_id,
        lr.host_id,
        lr.total_bookings,
        lr.total_revenue,
        lr.avg_booking_value,
        lr.occupancy_rate,
        COALESCE(mi.total_maintenance_issues, 0) AS total_maintenance_issues,
        COALESCE(mi.avg_resolution_time, 0) AS avg_resolution_time
    FROM listing_revenue lr
    LEFT JOIN maintenance_issues mi ON lr.listing_id = mi.listing_id
)

SELECT * 
FROM final