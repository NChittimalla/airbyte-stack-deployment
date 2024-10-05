
select master_category_no as category_no, 
master_category as category
from {{ ref('b_categories_hierarchy') }}
where master_category_no <>'99999'
UNION
select main_category_no as category_no, 
main_category as category
from {{ ref('b_categories_hierarchy') }} 
where main_category_no <>'99999'
UNION
select sub_category_no as category_no, 
sub_category as category
from {{ ref('b_categories_hierarchy') }}
where sub_category_no <>'99999'
union
select category_no as category_no, 
category as category
from {{ ref('b_categories_hierarchy') }}
where category_no <>'99999'
