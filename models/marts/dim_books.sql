SELECT
    title,
    price,
    rating_numeric,
    price_segment,
    extracted_at
FROM
    {{ ref('stg_books') }}
WHERE
    rating_numeric > 0
ORDER BY
    extracted_at DESC, title ASC