with source as (
    select * from {{ source('northwind','order_details')}}
)
select *,
        current_timestamp() ingestion_timestamp
 from source
