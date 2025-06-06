with source as (
    select * from {{ source('northwind','strings')}}
)
select *,
        current_timestamp() ingestion_timestamp
 from source