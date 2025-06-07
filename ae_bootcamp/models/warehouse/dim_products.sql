with source as(
    select 
        p.id as product_id,
        p.product_code,
        p.product_name,
        p.description,
        s.company as supplier_company,
        p.standard_cost,
        p.list_price,
        p.reorder_level,
        p.target_level,
        p.quantity_per_unit,
        p.discontinued,
        p.minimum_reorder_quantity,
        p.category,
        p.attachments,
        current_timestamp() as insertion_timestamp
    from {{ ref('stg_products')}} p
            left join {{ ref('stg_suppliers')}} s
            on s.id = p.supplier_id
),
unique_source as (
    select *,
            row_number() over(PARTITION BY product_id) as row_num
    from source
)
select *
    except(row_num)
from unique_source
where row_num = 1