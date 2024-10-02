{% snapshot snapshot__distribution_centers %}

-- Tell dbt what to do for the changes
{{
    config(
        target_schema = 'dbt_snapshot',
        unique_key = 'id',
        strategy = 'check',
        check_cols = ['name','latitude','longitude']
    )
}}

SELECT * FROM {{ source('thelook_ecommerce', 'distribution_centers') }}

{% endsnapshot %}