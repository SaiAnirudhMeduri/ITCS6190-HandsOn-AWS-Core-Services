SELECT
    category,
    COUNT("order id") AS total_orders
FROM raw_data
GROUP BY category
ORDER BY total_orders DESC
LIMIT 10;