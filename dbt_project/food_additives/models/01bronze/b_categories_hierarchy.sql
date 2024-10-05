
SELECT DISTINCT
    COALESCE(NULLIF(REGEXP_REPLACE(REGEXP_REPLACE("Master Category", '\n', ''), '[^0-9. ].*$', ''), ''), '99999') AS master_category_no,
    COALESCE(NULLIF(TRIM(REGEXP_REPLACE(REGEXP_REPLACE("Master Category", '\n', ''), '^[0-9. ]+', '')), ''), 'Not Applicable') AS master_category,
    COALESCE(NULLIF(REGEXP_REPLACE(REGEXP_REPLACE("Main Category", '\n', ''), '[^0-9. ].*$', ''), ''), '99999') AS main_category_no,
    COALESCE(NULLIF(TRIM(REGEXP_REPLACE(REGEXP_REPLACE("Main Category", '\n', ''), '^[0-9. ]+', '')), ''), 'Not Applicable') AS main_category,
    COALESCE(NULLIF(REGEXP_REPLACE(REGEXP_REPLACE("Sub Category", '\n', ''), '[^0-9. ].*$', ''), ''), '99999') AS sub_category_no,
    COALESCE(NULLIF(TRIM(REGEXP_REPLACE(REGEXP_REPLACE("Sub Category", '\n', ''), '^[0-9. ]+', '')), ''), 'Not Applicable') AS sub_category,
    COALESCE(NULLIF(REGEXP_REPLACE(REGEXP_REPLACE("Category", '\n', ''), '[^0-9. ].*$', ''), ''), '99999') AS category_no,
    COALESCE(NULLIF(TRIM(REGEXP_REPLACE(REGEXP_REPLACE("Category", '\n', ''), '^[0-9. ]+', '')), ''), 'Not Applicable') AS category
FROM 
    landing.landing."standard_additives"."cagtegories_subcategories.csv"
