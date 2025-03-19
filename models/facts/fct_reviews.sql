{{ 
    config(
    materialized = 'incremental',
    unique_key = 'review_id',
    on_schema_change = 'fail'
) 
}}

SELECT *
FROM {{ ref('stg_reviews') }}
WHERE comments IS NOT NULL

{% if is_incremental() %}
AND review_date > (SELECT MAX(review_date) FROM {{ this }})
{% endif %}