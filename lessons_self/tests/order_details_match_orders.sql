-- This config is optional, since it's default setting
{{ config(severity='warn') }}

/* 
    Check that, the numbers of line items in `order_items` table matches
    the num_items_ordered in `orders` table

    We could run multiple checks here
*/

WITH order_details AS (
    SELECT
        order_id,
        COUNT(8) AS num_of_items_in_order
    FROM {{ ref("brz_ecommerce__order_items") }}
    GROUP BY 1
)

SELECT
    o.*, od.*
FROM {{ ref('brz_ecommerce__orders') }} AS o
-- FROM dbt_dev01.brz_ecommerce__orders AS o
FULL OUTER JOIN order_details AS od USING (order_id)
WHERE 1=1
    AND o.order_id IS NULL
    OR od.order_id IS NULL
    OR o.num_items_ordered <> od.num_of_items_in_order