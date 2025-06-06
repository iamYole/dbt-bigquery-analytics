with source as (
    select * from {{ source('northwind','orders_tax_status')}}
)
select *,
        current_timestamp() ingestion_timestamp
 from source
