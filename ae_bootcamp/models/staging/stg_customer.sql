with source as (
    select * from {{ source('northwind','customer')}}
)
select *,
        current_timestamp() ingestion_timestamp
 from source
