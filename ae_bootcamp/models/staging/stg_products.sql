with source as (
    select * from {{ source('northwind','products')}}
)
select *,
        current_timestamp() ingestion_timestamp
 from source