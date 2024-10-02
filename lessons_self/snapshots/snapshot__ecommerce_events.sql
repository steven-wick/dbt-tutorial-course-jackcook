{% snapshot snapshot__ecommerce_events %}

{{
    config(
        target_schema = 'dbt_snapshot',
        unique_key = 'event_id',
        strategy = 'timestamp',
        updated_at = 'created_at'
    )
}}

SELECT 
    event_id,
    created_at
-- FROM {{ source('thelook_ecommerce', 'events') }}
FROM {{ ref('brz_ecommerce__events') }}

{% endsnapshot %}