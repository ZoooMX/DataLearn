-- ============================= stg

SELECT sum(sales) AS total_sales 
FROM  stg.orders;
-- total_sales

SELECT sum(profit) AS total_profit 
FROM  stg.orders;
-- total_profit

SELECT sum(sales)/sum(profit) * 100 AS profit_ratio 
FROM stg.orders;
-- profit_ratio

SELECT order_id, (sales/quantity) AS profit_per_order 
FROM  stg.orders;
-- profit_per_order

SELECT customer_id, sum(sales) AS sales_per_customer 
FROM  stg.orders
group by customer_id;
-- sales_per_customer

SELECT AVG(discount) AS avg_discount FROM  stg.orders;
-- avg_discount

SELECT 	EXTRACT(MONTH FROM order_date) AS "month", 
		EXTRACT(YEAR FROM order_date) AS "year", 
		segment,
		SUM(sales) AS monthly_sales_by_segment 
FROM stg.orders
GROUP BY EXTRACT(YEAR FROM order_date), 
		 EXTRACT(MONTH FROM order_date), 
		 segment
ORDER BY EXTRACT(YEAR FROM order_date), 
		 EXTRACT(MONTH FROM order_date); 
-- monthly_sales_by_segment
		
SELECT 	EXTRACT(MONTH FROM order_date) AS "month", 
		EXTRACT(YEAR FROM order_date) AS "year", 
		product_name,
		SUM(sales) AS monthly_sales_by_product 
FROM stg.orders
GROUP BY EXTRACT(YEAR FROM order_date), 
		 EXTRACT(MONTH FROM order_date), 
		 product_name
ORDER BY EXTRACT(YEAR FROM order_date), 
		 EXTRACT(MONTH FROM order_date); 
-- monthly_sales_by_product 
		
SELECT order_date, category, sales FROM stg.orders
ORDER BY order_date;	
-- Sales by Product Category over time

SELECT customer_name, 
		SUM(sales) AS Sales, 
		sum(profit) AS Profit  FROM stg.orders
GROUP BY customer_name;
-- Sales and Profit by Customer

SELECT ROW_NUMBER() OVER (ORDER BY SUM(sales) DESC) AS Ranking, 
	   customer_name, 
	   SUM(sales) AS Sales 
FROM stg.orders o 
GROUP BY customer_name; 
-- Customer Ranking

SELECT region, sum(sales) AS sales FROM stg.orders
GROUP BY region
ORDER BY sales DESC;
-- Sales per region

