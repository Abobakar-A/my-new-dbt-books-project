-- models/staging/stg_books.sql

SELECT
    title,
    price,
    rating AS rating_numeric,
    extraction_date AS extracted_at,
    CASE
        WHEN price < 20.00 THEN 'Cheap'
        WHEN price >= 20.00 AND price <= 40.00 THEN 'Decent'
        WHEN price > 40.00 THEN 'Expensive'
        ELSE 'Unknown'
    END AS price_segment
FROM
    {{ source('books_db_source', 'BOOKS_RAW') }}
WHERE
    title IS NOT NULL AND price IS NOT NULL