with source as (
    select * from {{ source('northwind','orders')}}
)
select *,
        current_timestamp() ingestion_timestamp
 from source