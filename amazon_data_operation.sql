
#total sales
SELECT SUM(amount) AS total_sales
FROM amazon_orders
WHERE status LIKE '%Shipped%';

#monthly sales report

SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(amount) AS monthly_sales
FROM amazon_orders
WHERE status LIKE '%Shipped%'
GROUP BY month
ORDER BY month;
#top selling product (sku)

SELECT sku, COUNT(*) AS total_orders, SUM(amount) AS revenue
FROM amazon_orders
WHERE status LIKE '%Shipped%'
GROUP BY sku
ORDER BY revenue DESC
LIMIT 10;
# order by state
SELECT ship_state, COUNT(*) AS total_orders
FROM amazon_orders
GROUP BY ship_state
ORDER BY total_orders DESC;

#cancellation order
SELECT 
    COUNT(*) AS cancelled_orders,
    SUM(amount) AS cancelled_value
FROM amazon_orders
WHERE status = 'Cancelled';
#delivery speed comparision
SELECT ship_service_level, COUNT(*) AS total_orders
FROM amazon_orders
GROUP BY ship_service_level;
#b2b and b2c sales breakdown
SELECT 
    b2b,
    COUNT(*) AS orders,
    SUM(amount) AS revenue
FROM amazon_orders
GROUP BY b2b;

#revenue by category
SELECT category, SUM(amount) AS revenue
FROM amazon_orders
WHERE status LIKE '%Shipped%'
GROUP BY category
ORDER BY revenue DESC;





