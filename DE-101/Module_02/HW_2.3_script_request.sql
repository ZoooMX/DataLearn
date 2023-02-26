/*
Cоздания запросов:
- Total Profit;
- Profit Ratio;
- Profit per Order;
- Sales per Customer;
- Avg. Discount;
- Monthly Sales by Segment;
- Monthly Sales by Product Category;
- Sales by Product Category over time;
- Sales and Profit by Customer;
- Customer Ranking;
- Sales per region
*/


SELECT SUM(sales) AS total_sales
FROM orders;
-- Total Sales;


SELECT SUM(profit) AS total_profit 
FROM orders;
-- Total Profit;


SELECT SUM(profit)/SUM(sales)*100 AS profit_ratio 
FROM orders; 
-- Profit Ratio


SELECT "Order ID", 
	   (sales/quantity) AS profit_per_order 
FROM orders; 
-- Profit per ORDER


SELECT "Customer ID", 
	   SUM(sales) FROM orders o
GROUP BY "Customer ID"; 
-- Sales per Customer


SELECT AVG(discount) AS avg_discount FROM orders; 
-- Avg. Discount


SELECT 	EXTRACT(MONTH FROM "Order Date") AS "month", 
		EXTRACT(YEAR FROM "Order Date") AS "year", 
		segment,
		SUM(sales) AS monthly_sales_by_segment 
FROM orders
GROUP BY EXTRACT(YEAR FROM "Order Date"), 
		 EXTRACT(MONTH FROM "Order Date"), 
		 segment
ORDER BY EXTRACT(YEAR FROM "Order Date"), 
		 EXTRACT(MONTH FROM "Order Date"); 
-- Monthly Sales by Segment

		
SELECT 	EXTRACT(MONTH FROM "Order Date") AS "month", 
		EXTRACT(YEAR FROM "Order Date") AS "year", 
		"Product Name",
		SUM(sales) AS monthly_sales_by_product 
FROM orders
GROUP BY EXTRACT(YEAR FROM "Order Date"), 
		 EXTRACT(MONTH FROM "Order Date"), 
		 "Product Name"
ORDER BY EXTRACT(YEAR FROM "Order Date"), 
		 EXTRACT(MONTH FROM "Order Date"); 	
-- Monthly Sales by	Product
		

SELECT "Order Date", category, sales FROM orders
ORDER BY "Order Date";	
-- Sales by Product Category over time
		

SELECT "Customer Name", 
		SUM(sales) AS Sales, 
		sum(profit) AS Profit  FROM orders
GROUP BY "Customer Name";
-- Sales and Profit by Customer


SELECT ROW_NUMBER() OVER (ORDER BY SUM(sales) DESC) AS Ranking, 
	   "Customer Name", 
	   SUM(sales) AS Sales 
FROM orders o 
GROUP BY "Customer Name"; 
-- Customer Ranking


SELECT region, sum(sales) AS sales FROM orders
GROUP BY region
ORDER BY sales DESC;
-- Sales per region


/*
Замена символов для Excel таблицы
SELECT *  FROM orders o
LIMIT 10;

UPDATE public.orders
SET sales = REPLACE (sales, ',','.');

UPDATE public.orders
SET profit = REPLACE (profit, ',','.');

UPDATE public.orders
SET discount = REPLACE (discount, ',','.');
*/




