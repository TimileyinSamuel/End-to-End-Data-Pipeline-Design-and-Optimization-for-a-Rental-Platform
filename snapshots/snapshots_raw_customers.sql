{% snapshot customers_snapshot %}

{{
    config(
        target_schema = 'snapshots',
        strategy = 'check',
        unique_key = 'customer_id',
        check_cols = ['age_group', 'travel_purpose']
    )
}}

SELECT *
FROM {{ source('rental', 'customers') }}

{% endsnapshot %}