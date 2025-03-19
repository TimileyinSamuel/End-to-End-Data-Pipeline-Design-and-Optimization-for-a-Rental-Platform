SELECT *
FROM {{ source('rental', 'reviews') }}
WHERE date > CURRENT_DATE