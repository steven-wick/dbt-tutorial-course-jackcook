{% test value_min(model, column_name, value=0) %}

WITH validation AS (
    SELECT
        {{ column_name }} AS failed_row,

    FROM {{ model }}
    WHERE {{ column_name }} < {{ value }}
)

SELECT * FROM validation

{% endtest %}
