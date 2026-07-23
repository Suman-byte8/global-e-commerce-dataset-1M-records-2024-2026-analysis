-- overall KPIs (Key Performance Indicators)

SELECT
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT customer_id) AS total_customers,
    COUNT(DISTINCT product_id) AS total_products,
    ROUND(SUM(total_price_usd)::numeric, 2) AS total_revenue,
    ROUND(SUM(profit_usd)::numeric, 2) AS total_profit,
    ROUND(AVG(total_price_usd)::numeric, 2) AS average_order_value,
    ROUND(
        (
            SUM(profit_usd) /
            NULLIF(SUM(total_price_usd), 0)
        )::numeric * 100
    , 2) AS profit_margin_percentage
FROM ecommerce_orders 
WHERE order_status = 'Completed';

-- revenue over time (monthly)

SELECT
    category,
    ROUND(SUM(total_price_usd)::numeric, 2) AS revenue
FROM ecommerce_orders 
WHERE order_status = 'Completed'
GROUP BY category
ORDER BY revenue DESC;

-- profit by category

SELECT
    category,
    ROUND(SUM(profit_usd)::numeric, 2) AS profit
FROM ecommerce_orders 
WHERE order_status = 'Completed'
GROUP BY category
ORDER BY profit DESC;

-- top 10 products by revenue

SELECT
    product_name,
    ROUND(SUM(total_price_usd)::numeric, 2) AS revenue
FROM ecommerce_orders 
WHERE order_status = 'Completed'
GROUP BY product_name
ORDER BY revenue DESC
LIMIT 10;


-- monthly sales trend

SELECT
    DATE_TRUNC('month', order_date) AS order_month,
    ROUND(SUM(total_price_usd)::numeric, 2) AS revenue,
    ROUND(SUM(profit_usd)::numeric, 2) AS profit,
    COUNT(DISTINCT order_id) AS orders
FROM ecommerce_orders
WHERE order_status = 'Completed'
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY order_month;