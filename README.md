Retail Sales Analysis using SQL
📂 Project Overview
Project Title: Retail Sales Analysis

Level: Beginner

Tools Used: PostgreSQL / SQL

Database Name: p1_retail_db

This project demonstrates SQL techniques used by data analysts to explore, clean, and analyze retail sales data. It covers database setup, data cleaning, exploratory analysis, and deriving insights using SQL queries. Ideal for beginners looking to strengthen their SQL skills.

🎯 Objectives
Set up and structure the retail sales database.

Clean the data by identifying and removing nulls.

Perform exploratory data analysis (EDA).

Answer business questions through SQL queries.

🏗️ Database Setup
✅ Step 1: Create Database and Table
sql
Copy
Edit
CREATE DATABASE p1_retail_db;

CREATE TABLE retail_sales (
    transactions_id INT PRIMARY KEY,
    sale_date DATE,	
    sale_time TIME,
    customer_id INT,	
    gender VARCHAR(10),
    age INT,
    category VARCHAR(35),
    quantity INT,
    price_per_unit FLOAT,	
    cogs FLOAT,
    total_sale FLOAT
);
🧹 Data Cleaning & Exploration
🔍 Basic Exploration
sql
Copy
Edit
-- Total records
SELECT COUNT(*) FROM retail_sales;

-- Unique customers
SELECT COUNT(DISTINCT customer_id) FROM retail_sales;

-- Product categories
SELECT DISTINCT category FROM retail_sales;
❌ Null Check & Removal
sql
Copy
Edit
-- Check for nulls
SELECT * FROM retail_sales
WHERE sale_date IS NULL OR sale_time IS NULL 
   OR customer_id IS NULL OR gender IS NULL 
   OR age IS NULL OR category IS NULL 
   OR quantity IS NULL OR price_per_unit IS NULL 
   OR cogs IS NULL;

-- Remove rows with nulls
DELETE FROM retail_sales
WHERE sale_date IS NULL OR sale_time IS NULL 
   OR customer_id IS NULL OR gender IS NULL 
   OR age IS NULL OR category IS NULL 
   OR quantity IS NULL OR price_per_unit IS NULL 
   OR cogs IS NULL;
📊 Business Questions & SQL Queries
1. Sales on a Specific Date
sql
Copy
Edit
SELECT * 
FROM retail_sales 
WHERE sale_date = '2022-11-05';
2. Clothing Sales (>4 units) in Nov 2022
sql
Copy
Edit
SELECT * 
FROM retail_sales 
WHERE category = 'Clothing' 
  AND TO_CHAR(sale_date, 'YYYY-MM') = '2022-11' 
  AND quantity >= 4;
3. Total Sales per Category
sql
Copy
Edit
SELECT 
  category, 
  SUM(total_sale) AS net_sale, 
  COUNT(*) AS total_orders 
FROM retail_sales 
GROUP BY category;
4. Average Age of Beauty Category Buyers
sql
Copy
Edit
SELECT 
  ROUND(AVG(age), 2) AS avg_age 
FROM retail_sales 
WHERE category = 'Beauty';
5. High-Value Transactions (> ₹1000)
sql
Copy
Edit
SELECT * 
FROM retail_sales 
WHERE total_sale > 1000;
6. Number of Transactions by Gender per Category
sql
Copy
Edit
SELECT 
  category, 
  gender, 
  COUNT(*) AS total_trans 
FROM retail_sales 
GROUP BY category, gender 
ORDER BY category;
7. Best-Selling Month by Year (Based on Avg Sale)
sql
Copy
Edit
SELECT year, month, avg_sale
FROM (
    SELECT 
        EXTRACT(YEAR FROM sale_date) AS year,
        EXTRACT(MONTH FROM sale_date) AS month,
        AVG(total_sale) AS avg_sale,
        RANK() OVER (
            PARTITION BY EXTRACT(YEAR FROM sale_date)
            ORDER BY AVG(total_sale) DESC
        ) AS rank
    FROM retail_sales
    GROUP BY 1, 2
) AS t
WHERE rank = 1;
8. Top 5 Customers by Total Sales
sql
Copy
Edit
SELECT 
  customer_id, 
  SUM(total_sale) AS total_sales 
FROM retail_sales 
GROUP BY customer_id 
ORDER BY total_sales DESC 
LIMIT 5;
9. Unique Customers per Category
sql
Copy
Edit
SELECT 
  category, 
  COUNT(DISTINCT customer_id) AS cnt_unique_cs 
FROM retail_sales 
GROUP BY category;
10. Orders by Shift (Morning, Afternoon, Evening)
sql
Copy
Edit
WITH hourly_sale AS (
    SELECT *, 
        CASE 
            WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
            WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
            ELSE 'Evening'
        END AS shift
    FROM retail_sales
)
SELECT 
  shift, 
  COUNT(*) AS total_orders 
FROM hourly_sale 
GROUP BY shift;
📈 Insights & Findings
Customer Demographics: A broad age range of customers shop across diverse categories.

Premium Purchases: Multiple transactions crossed ₹1000 in value.

Monthly Trends: Sales performance varies by month and can indicate seasonality.

Top Performers: Clothing and Beauty are leading categories in both sales and customer base.

Time-Based Insights: Most purchases occur during afternoon and evening shifts.

📋 Summary Reports
Sales Summary: Category-wise revenue and order count.

Trend Report: Monthly and shift-based patterns.

Customer Insights: Unique customers and top spenders.

✅ Conclusion
This project provides a complete introduction to SQL from database creation to real-world business analysis. It demonstrates how structured queries can drive decision-making by uncovering patterns in sales, customer behavior, and performance trends.




