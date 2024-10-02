WITH source AS (
    SELECT *

    FROM {{ source('thelook_ecommerce', 'order_items') }}
)

SELECT
    id AS order_item_id,
    -- CAST(order_id as STRING) order_id,
    order_id,
    user_id,
    product_id,
    -- inventory_item_id,
    -- status,
    -- created_at,
    -- shipped_at,
    -- delivered_at,
    -- returned_at,
    sale_price  item_sale_price

FROM source