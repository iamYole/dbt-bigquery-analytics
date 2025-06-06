with source as (
    select * from {{ source('northwind','shippers')}}
)
select *,
        current_timestamp() ingestion_timestamp
 from source