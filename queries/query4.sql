SELECT
    date_format(date_parse(date, '%m-%d-%y'), '%Y-%m') AS month,
    COUNT("order id") AS total_orders,
    SUM(amount) AS total_revenue
FROM raw_data
WHERE status NOT LIKE '%Cancelled%'
  AND status NOT LIKE '%Pending%'
GROUP BY date_format(date_parse(date, '%m-%d-%y'), '%Y-%m')
ORDER BY month
LIMIT 10;