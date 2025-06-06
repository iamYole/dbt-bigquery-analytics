with source as (
    select * from  {{ source('northwind','employees') }}
)
select *,
        current_timestamp() ingestion_timestamp
 from source