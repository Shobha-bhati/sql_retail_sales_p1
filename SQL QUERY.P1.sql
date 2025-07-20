SELECT COUNT(*)
FROM retail_sales
SELECT * FROM retail_sales
LIMIT 100

SELECT * FROM retail_sales
where 

      quantiy is null
	  or
	  category is null
	  or
	  gender is null
	  or
	  price_per_unit is null
	  or
	  cogs is null
	  or
	  total_sale is null
	  or
	  cogs is null

DELETE FROM retail_sales
where 

      quantiy is null
	  or
	  category is null
	  or
	  gender is null
	  or
	  price_per_unit is null
	  or
	  cogs is null
	  or
	  total_sale is null
	  or
	  cogs is null

SELECT COUNT(transactions_id) as total_sale from retail_sales

SELECT DISTINCT category as category_total from retail_sales

SELECT * FROM retail_sales
WHERE sale_date ='2022-11-05';


SELECT * FROM retail_sales
where 
         category = 'Clothing'
         and
		 TO_CHAR(sale_date,'YYYY-MM')= '2022-11'
		 and
		 quantiy >= 4

SELECT 
    Category,
    SUM(total_sale) as net_sale,
	COUNT(*) as total_orders

From retail_sales
Group by 1

SELECT 
Round(Avg(age),2 )
From retail_sales
Where category = 'Beauty'

Select 
transactions_id
From retail_sales
Where total_sale >= 1000

SELECT 
category,
gender,
COUNT(*) AS total_trans
From retail_sales
GROUP BY
category,
gender
ORDER BY 1


SELECT 
customer_id,
SUM(total_sale) as total_sales
from retail_sales
GROUP by 1
order by 2 desc
limit 5


 SELECT 
 category,
 count(distinct customer_id)
 FROM retail_sales
 group by 1


 
With hourly_sale 
as (
 SELECT *,
  CASE
   WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
   WHEN EXTRACT(HOUR FROM sale_time) between 12 and 17 THEN 'Afternoon'
   ELSE 'Evening'
   End as Shift
FROM retail_sales
 )
select 
shift,
count(*) as total_orders
from hourly_sale
group by shift

 

