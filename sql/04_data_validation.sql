-- Total rows

SELECT COUNT(*) AS total_rows
FROM ecommerce_orders;


-- Total columns

SELECT COUNT(*) AS total_columns
FROM information_schema.columns
WHERE table_name = 'ecommerce_orders';


-- Unique orders

SELECT COUNT(DISTINCT order_id) AS unique_orders
FROM ecommerce_orders;


-- Unique customers

SELECT COUNT(DISTINCT customer_id) AS unique_customers
FROM ecommerce_orders;


-- Unique products

SELECT COUNT(DISTINCT product_id) AS unique_products
FROM ecommerce_orders;


-- Dataset date range

SELECT
    MIN(order_date) AS first_order_date,
    MAX(order_date) AS latest_order_date
FROM ecommerce_orders;