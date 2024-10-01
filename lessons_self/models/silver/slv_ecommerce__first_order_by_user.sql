{{
    config(
        materialized = 'ephemeral'
    )
}}

SELECT
    user_id,
    MIN(created_at) first_order_created_at
FROM {{ ref('brz_ecommerce__orders') }}
GROUP BY 1