with source as (
    select * from {{ source('raw', 'raw_orders') }}
),

renamed as (
    select
        order_id,
        customer_id,
        product_name,
        quantity,
        unit_price,
        quantity * unit_price   as total_price,
        status,
        ordered_at::timestamp   as ordered_at
    from source
)

select * from renamed
