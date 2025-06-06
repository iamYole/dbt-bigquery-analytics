with source as (
    select * from {{ source('northwind','purchase_order_details')}}
)
select *,
        current_timestamp() ingestion_timestamp
 from source
