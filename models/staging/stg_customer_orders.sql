with customers as (
    select * from {{ ref('stg_customers') }}
),

orders as (
    select * from {{ ref('stg_orders') }}
),

aggregated as (
    select
        c.customer_id,
        c.customer_name,
        c.email,
        count(o.order_id)                                           as total_orders,
        sum(o.quantity)                                             as total_items_ordered,
        round(sum(o.total_price), 2)                               as total_spend,
        round(avg(o.total_price), 2)                               as avg_order_value,
        count(case when o.status = 'completed' then 1 end)         as completed_orders,
        count(case when o.status = 'pending' then 1 end)           as pending_orders,
        count(case when o.status = 'cancelled' then 1 end)         as cancelled_orders,
        min(o.ordered_at)                                          as first_order_at,
        max(o.ordered_at)                                          as last_order_at
    from customers c
    left join orders o on c.customer_id = o.customer_id
    group by c.customer_id, c.customer_name, c.email
)

select * from aggregated
