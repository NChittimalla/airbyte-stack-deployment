SELECT 
    product_id, 
    location_name,
    product_name,
    price
    reorder_level,
    quantity_available as quantity
FROM
    {{ ref('s_inv_prod_join') }}