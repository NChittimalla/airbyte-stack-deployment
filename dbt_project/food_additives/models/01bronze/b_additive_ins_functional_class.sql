SELECT 
    TRIM(REGEXP_REPLACE(REGEXP_REPLACE(REGEXP_REPLACE(REGEXP_REPLACE("Combined Output", ' - INS.*$', ''), ',\s*XS[^, ]+', ''), '^XS[^, ]+,?', ''), ',?\s*XS[^, ]+$', '')) AS additive,
    TRIM(REGEXP_EXTRACT("Combined Output", '(INS[0-9]+\([^)]*\)|INS[0-9]+\s+[^A-Z]*)', 1)) AS ins_no,
    TRIM(REGEXP_REPLACE(SUBSTRING("Combined Output", POSITION('Functional Class' IN "Combined Output")), '^Functional Class: ', '')) AS functional_class,
    TRIM("Combined Output") AS full_text
FROM 
    landing.landing."standard_additives"."additive_ins_functional_class.parquet"
WHERE 
    "Combined Output" NOT LIKE ' - INS%' 
    --AND "Combined Output" NOT LIKE 'PHOSPHATES%'