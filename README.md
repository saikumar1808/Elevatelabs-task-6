# ELEVATE-LABS-TASK-5
# 🧾 Online Sales Monthly Summary (SQL Practice)

This project demonstrates simple SQL queries for analyzing online sales data. It includes table creation, sample data insertion, and monthly aggregation of sales revenue and order volume.

---

## 📁 Table: `online_sales`

The table contains sample online order data with the following columns:

| Column Name | Data Type  | Description                      |
|-------------|------------|----------------------------------|
| order_id    | INT        | Unique ID of the order           |
| order_date  | DATE       | Date the order was placed        |
| amount      | DECIMAL    | Order amount (in currency)       |
| product_id  | INT        | Product identifier               |

---

## 📥 Sample Data Inserted

15 rows of sample data are inserted manually. They simulate orders from January to April 2023.

---

## 📊 Query: Monthly Revenue and Order Volume

This SQL query extracts monthly total revenue and number of unique orders:

```sql
SELECT 
  EXTRACT(YEAR FROM order_date) AS order_year,
  EXTRACT(MONTH FROM order_date) AS order_month,
  SUM(amount) AS total_revenue,
  COUNT(DISTINCT order_id) AS total_orders
FROM online_sales
WHERE order_date BETWEEN '2023-01-01' AND '2023-04-30'
GROUP BY 
  EXTRACT(YEAR FROM order_date), 
  EXTRACT(MONTH FROM order_date)
ORDER BY 
  order_year, order_month;
