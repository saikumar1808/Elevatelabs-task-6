USE new_schema;
CREATE TABLE online_sales (
    order_id INT,
    order_date DATE,
    amount DECIMAL(10, 2),
    product_id INT
);

INSERT INTO online_sales (order_id, order_date, amount, product_id) VALUES
(1, '2023-01-15', 150.00, 101),
(2, '2023-01-20', 200.00, 102),
(3, '2023-02-10', 100.00, 101),
(4, '2023-02-18', 250.00, 103),
(5, '2023-03-05', 300.00, 104),
(6, '2023-03-15', 400.00, 105),
(7, '2023-03-22', 120.00, 101),
(8, '2023-04-01', 500.00, 106),
(9, '2023-04-10', 600.00, 107),
(10, '2023-04-25', 450.00, 108),
(1, '2023-01-10', 100.00, 109),
(2, '2023-01-15', 150.00, 110),
(3, '2023-02-05', 200.00, 111),
(4, '2023-02-20', 250.00, 112),
(5, '2023-03-10', 300.00, 113);

SELECT * FROM online_sales;


-- Monthly Revenue

SELECT 
  MONTH(order_date) AS month,
  SUM(amount) AS total_revenue
FROM online_sales
GROUP BY MONTH(order_date);

-- monthly order volume

SELECT 
  MONTH(order_date) AS month,
  COUNT(DISTINCT order_id) AS total_orders
FROM online_sales
GROUP BY MONTH(order_date)
ORDER BY month;

-- total revenue and total number of orders per month

SELECT 
  MONTH(order_date) AS month,
  SUM(amount) AS total_revenue,
  COUNT(DISTINCT order_id) AS total_orders
FROM online_sales
GROUP BY MONTH(order_date)
ORDER BY month;

SELECT 
  EXTRACT(YEAR FROM order_date) AS order_year,
  EXTRACT(MONTH FROM order_date) AS order_month,
  SUM(amount) AS total_revenue,
  COUNT(DISTINCT order_id) AS total_orders
FROM online_sales
WHERE order_date BETWEEN '2023-01-01' AND '2023-04-30'  -- Limit time period
GROUP BY 
  EXTRACT(YEAR FROM order_date),                        -- Group by year
  EXTRACT(MONTH FROM order_date)                        --  Group by month
ORDER BY 
  order_year, order_month;                              -- Sorting by year and month



