-- DLL команды 

-- ************************************** order_dim

CREATE TABLE order_dim
(
 "Order ID"   varchar(50) NOT NULL,
 "Order Date" date NOT NULL,
 CONSTRAINT PK_1 PRIMARY KEY ( "Order ID" )
);

-- ************************************** costumer_dim

CREATE TABLE costumer_dim
(
 "Customer ID"   varchar(50) NOT NULL,
 "Customer Name" varchar(50) NOT NULL,
 segment       varchar(50) NOT NULL,
 CONSTRAINT PK_2 PRIMARY KEY ( "Customer ID" )
);

-- ************************************** geo_dim

CREATE TABLE geo_dim
(
 "Geo ID"  int NOT NULL,
 City    varchar(50) NOT NULL,
 "State"   varchar(50) NOT NULL,
 Country varchar(50) NOT NULL,
 CONSTRAINT PK_3 PRIMARY KEY ( "Geo ID" )
);

-- ************************************** product_dim

CREATE TABLE product_dim
(
 "Category ID" int NOT NULL,
 category    varchar(50) NOT NULL,
 CONSTRAINT PK_4 PRIMARY KEY ( "Category ID" )
);

-- ************************************** ship_dim

CREATE TABLE ship_dim
(
 "Ship ID"   int NOT NULL,
 "Ship Date" date NOT NULL,
 "Ship Mode" varchar(50) NOT NULL,
 CONSTRAINT PK_5 PRIMARY KEY ( "Ship ID" )
);

-- ************************************** sales_fact

CREATE TABLE sales_fact
(
 "Row ID"      	int4 NOT NULL,
 "Customer ID" 	varchar(50) NOT NULL,
 "Geo ID"      	int NOT NULL,
 "Order Id"    	varchar(50) NOT NULL,
 profit      	money NOT NULL,
 discount   	 numeric(5,2) NOT NULL,
 sales       	money NOT NULL,
 quantity    	int NOT NULL,
 "Ship ID"    	 int NOT NULL,
 "Category ID"	 int NOT NULL,
 CONSTRAINT PK_6 PRIMARY KEY ( "Row ID" ),
 CONSTRAINT FK_2 FOREIGN KEY ( "Customer ID" ) REFERENCES costumer_dim ( "Customer ID" ),
 CONSTRAINT FK_1 FOREIGN KEY ( "Order Id" ) REFERENCES order_dim ( "Order ID" ),
 CONSTRAINT FK_4 FOREIGN KEY ( "Category ID" ) REFERENCES product_dim ( "Category ID" ),
 CONSTRAINT FK_5 FOREIGN KEY ( "Ship ID" ) REFERENCES ship_dim ( "Ship ID" ),
 CONSTRAINT FK_3 FOREIGN KEY ( "Geo ID" ) REFERENCES geo_dim ( "Geo ID" ));
 
-- Наполнение таблиц

INSERT INTO order_dim
SELECT "Order ID", "Order Date" 
FROM (SELECT DISTINCT "Order ID", "Order Date" FROM orders) a; 



INSERT INTO costumer_dim
SELECT  "Customer ID", "Customer Name",  segment 
FROM (SELECT DISTINCT "Customer ID", "Customer Name", segment FROM orders) a;


INSERT	INTO geo_dim
SELECT ROW_NUMBER() OVER(),  City, "state", Country 
FROM (SELECT DISTINCT City, "state", Country FROM orders) a;



INSERT INTO product_dim
SELECT  ROW_NUMBER () OVER (), category 
FROM (SELECT DISTINCT  category FROM orders) a;



INSERT INTO ship_dim
SELECT ROW_NUMBER () OVER (), "Ship Date", "Ship Mode" 
FROM (SELECT DISTINCT "Ship Date", "Ship Mode" FROM orders) a;



INSERT INTO sales_fact 
SELECT "Row ID",
 		"Customer ID",
 		"Geo ID",
 		"Order ID",
	 	profit,
 		discount,
 		sales,
 		quantity,
 		"Ship ID",
 		"Category ID"
FROM (
	SELECT DISTINCT "Row ID",
 					"Customer ID",
 					"Order ID",
 					profit,
 					discount,
 					sales,
 					quantity,
 					g."Geo ID",
 					p."Category ID",
 					s."Ship ID"
 		FROM orders o 
 		INNER JOIN geo_dim g 
 		ON o.City = g.City AND o."state" = g."State" AND o.Country = g.Country
 	 	INNER JOIN product_dim p 
 		ON o.category = p.category
	 	INNER JOIN ship_dim s 
	 	ON o."Ship Mode" = s."Ship Mode" AND o."Ship Date" = s."Ship Date") a;


SELECT * FROM sales_fact;
	 