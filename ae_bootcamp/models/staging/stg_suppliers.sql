with source as(
    select * from {{ source('northwind','suppliers')}}
)
select *,
        current_timestamp() ingestion_timestamp
 from source