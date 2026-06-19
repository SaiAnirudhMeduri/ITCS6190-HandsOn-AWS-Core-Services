WITH ranked_skus AS (
    SELECT
        category,
        sku,
        SUM(amount) AS total_revenue,
        SUM(qty) AS total_units_sold,
        ROW_NUMBER() OVER (
            PARTITION BY category
            ORDER BY SUM(amount) DESC
        ) AS rank
    FROM raw_data
    WHERE status NOT LIKE '%Cancelled%'
      AND status NOT LIKE '%Pending%'
      AND qty > 0
    GROUP BY category, sku
)
SELECT
    category,
    sku,
    total_revenue,
    total_units_sold,
    rank
FROM ranked_skus
WHERE rank <= 5
ORDER BY category, rank
LIMIT 10;