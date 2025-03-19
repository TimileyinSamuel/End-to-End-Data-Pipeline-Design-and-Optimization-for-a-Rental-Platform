WITH date_series AS (
    SELECT 
        DATEADD(DAY, ROW_NUMBER() OVER (ORDER BY SEQ4()) - 1, '{{ var("earliest_date") }}') AS full_date
    FROM TABLE(GENERATOR(ROWCOUNT => 3650))
)
SELECT 
    TO_CHAR(full_date, 'YYYYMMDD') AS date_id, 
    CAST(full_date AS DATE) AS full_date, 
    CASE WHEN DAYOFWEEK(full_date) IN (1,7) THEN TRUE ELSE FALSE END AS is_weekend,
    MONTH(full_date) AS month,
    TO_CHAR(full_date, 'Mon') AS month_name,
    QUARTER(full_date) AS quarter,
    YEAR(full_date) AS year,
    WEEKOFYEAR(full_date) AS week_of_year,
    CASE 
        WHEN MONTH(full_date) IN (12,1,2) THEN 'Winter'
        WHEN MONTH(full_date) IN (3,4,5) THEN 'Spring'
        WHEN MONTH(full_date) IN (6,7,8) THEN 'Summer'
        ELSE 'Fall'
    END AS season
FROM date_series