with source as (
    select * from {{ source('northwind','invoices')}}
)
select *,
        current_timestamp() ingestion_timestamp
 from source
