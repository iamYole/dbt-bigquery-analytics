with source as (
    select * from {{ source('northwind', 'privileges')}}
)
select *,
        current_timestamp() ingestion_timestamp
 from source