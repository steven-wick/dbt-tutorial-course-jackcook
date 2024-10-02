{{
    config(
        materialized = 'view'
        , group = 'sales'
    )
}}
-- , group = 'marketing'

SELECT * FROM {{ ref('fact_orders') }}
ORDER BY order_created_at
LIMIT 10