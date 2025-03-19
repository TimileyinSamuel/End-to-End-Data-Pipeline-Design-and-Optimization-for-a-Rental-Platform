WITH maintenance_summary AS (
    SELECT 
        listing_id,
        issue_type,
        COUNT(issue_type) AS total_issues,
        ROUND(AVG(resolution_time), 0) AS avg_resolution_time,
        ROUND(COUNT(CASE WHEN resolution_time <= 24 THEN 1 END),0) AS issues_resolved_within_24h
    FROM {{ ref('fct_maintenance') }}
    GROUP BY listing_id, issue_type
),

final AS (
    SELECT 
        listing_id,
        issue_type,
        total_issues,
        avg_resolution_time,
        issues_resolved_within_24h,
        ROUND((issues_resolved_within_24h * 1.0 / NULLIF(total_issues, 0)) * 100, 0) AS resolution_within_24h_percentage
    FROM maintenance_summary
)

SELECT *
FROM final