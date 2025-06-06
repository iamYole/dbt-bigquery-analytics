with source as(
    select * from {{ source('northwind','purchase_orders')}}
)
select *,
        current_timestamp() ingestion_timestamp
 from source