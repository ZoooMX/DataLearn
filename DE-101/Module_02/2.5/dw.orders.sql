-- ============================= dw


SELECT sum(sales) AS total_sales 
FROM  dw.sales_fact
;
-- total_sales

SELECT sum(profit) AS total_profit 
FROM  dw.sales_fact
;
-- total_profit

SELECT sum(sales)/sum(profit) * 100 AS profit_ratio 
FROM dw.sales_fact
;
-- profit_ratio

SELECT order_id, (sales/quantity) AS profit_per_order 
FROM  dw.sales_fact
;
-- profit_per_order

SELECT cd.customer_id, sum(sf.sales) AS sales_per_customer 
FROM  dw.sales_fact sf
inner join dw.customer_dim cd
on cd.cust_id = sf.cust_id  
group BY customer_id
;
-- sales_per_customer

SELECT AVG(discount) AS avg_discount FROM  dw.sales_fact;
-- avg_discount

SELECT 	cd."month" AS "month", 
		cd."year" AS "year",
		cd.week_day,
		pd.segment,
		SUM(sf.sales) AS monthly_sales_by_segment 
FROM dw.sales_fact sf
inner join dw.calendar_dim cd 
on cd.dateid = sf.order_date_id 
inner join dw.product_dim pd 
on pd.prod_id = sf.prod_id 
GROUP BY cd."month", 
		 cd."year",
		 cd.week_day,
		 pd.segment
; 
-- monthly_sales_by_segment
		
SELECT 	cd."month" AS "month", 
		cd."year" AS "year",
		cd.week_day,
		pd.product_name,
		SUM(sf.sales) AS monthly_sales_by_segment 
FROM dw.sales_fact sf
inner join dw.calendar_dim cd 
on cd.dateid = sf.order_date_id 
inner join dw.product_dim pd 
on pd.prod_id = sf.prod_id 
GROUP BY cd."month", 
		 cd."year",
		 cd.week_day,
		 pd.product_name
; 
-- monthly_sales_by_product 
		
SELECT 	cd."date", 
		pd.category, 
		sf.sales 
FROM dw.sales_fact sf
inner join dw.product_dim pd 
on pd.prod_id = sf.prod_id 
inner join dw.calendar_dim cd 
on cd.dateid = sf.order_date_id 
order by cd."date";	

-- Sales by Product Category over time

SELECT cd.customer_name, 
	   SUM(sf.sales) as sales, 
	   sum(sf.profit) as profit   
FROM dw.sales_fact sf
inner join dw.customer_dim cd 
on cd.cust_id = sf.cust_id 
GROUP BY cd.customer_name
;
-- Sales and Profit by Customer

SELECT ROW_NUMBER() OVER (ORDER BY SUM(sales) DESC) AS Ranking, 
	   cd.customer_name, 
	   SUM(sf.sales) AS Sales 
FROM dw.sales_fact sf
inner join dw.customer_dim cd 
on cd.cust_id = sf.cust_id 
GROUP BY cd.customer_name
; 
-- Customer Ranking

SELECT 	gd.country,
		gd.state,
		gd.city,
		sum(sf.sales) AS sales 
FROM dw.sales_fact sf
inner join dw.geo_dim gd  
on gd.geo_id = sf.geo_id 
GROUP BY gd.country,
		 gd.state,
		 gd.city,
		 sf.sales
ORDER BY gd.country,
		 gd.state,
		 gd.city 
;
-- Sales per region