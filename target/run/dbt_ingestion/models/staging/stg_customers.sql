
  create or replace   view LOCAL_DBT_INGESTION.PUBLIC.stg_customers
  
   as (
    with source as (
    select * from LOCAL_DBT_INGESTION.PUBLIC.raw_customers
),

renamed2 as (
    select
        id          as customer_id,
        name        as customer_name,
        email,
        created_at
    from source
)

select * from renamed2
  );

