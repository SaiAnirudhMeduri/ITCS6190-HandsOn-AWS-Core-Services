SELECT
    fulfilment,
    COUNT("order id") AS total_orders,
    SUM(qty) AS total_units_sold,
    SUM(amount) AS total_revenue
FROM raw_data
WHERE status NOT LIKE '%Cancelled%'
  AND status NOT LIKE '%Pending%'
GROUP BY fulfilment
ORDER BY total_revenue DESC
LIMIT 10;