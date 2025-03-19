{% snapshot listings_snapshot %}

{{
    config(
        target_schema = 'snapshots',
        strategy = 'check',
        unique_key = 'id',
        check_cols = ['property type', 'room_type', 'price', 'availability_365', 'minimum_nights']
    )
}}

SELECT *
FROM {{ source('rental', 'listings') }}

{% endsnapshot %}