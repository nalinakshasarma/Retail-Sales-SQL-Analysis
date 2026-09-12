-- Create and use a Database
CREATE DATABASE sql_project_1
USE sql_project_1;

-- Create a Table 
CREATE TABLE retail_sales_1
		( transactions_id INT PRIMARY KEY,
		sale_date DATE, 
		sale_time TIME, 
		customer_id INT,
		gender VARCHAR(15),
		age INT, 
		category VARCHAR(20),
		quantiy INT, 
		price_per_unit FLOAT, 
		cogs FLOAT, 
		total_sale FLOAT );
SELECT * FROM retail_sales_1
SELECT * FROM retail_sales_1 LIMIT 10;
SELECT COUNT(*) FROM retail_sales_1;
SELECT * FROM retail_sales_1 WHERE 
	transactions_id  IS NULL OR  sale_date IS NULL OR  sale_time IS NULL
    OR customer_id IS NULL OR gender IS NULL OR  age IS NULL OR category IS NULL  
    OR quantiy IS NULL OR price_per_unit IS NULL OR cogs IS NULL 
    OR total_sale IS NULL;

-- Data Exploration . 
-- How many sales we have?
SELECT COUNT(*) as total_sales FROM retail_sales_1;

-- How many unique customers we have? 
SELECT COUNT(DISTINCT(customer_id)) FROM retail_sales_1;

-- How many unique category we have? 
SELECT COUNT(DISTINCT(category)) as total_category FROM retail_sales_1;
SELECT DISTINCT(category) as category FROM retail_sales_1;

-- Data Analysis & Business Key problems & Answers. 
-- Q1. Write a SQL query to retrieve all columns for sales made on '2022-11-05'. 
SELECT * FROM retail_sales_1 WHERE sale_date= '2022-11-05'; 

/* Q2. Write a SQL query to retrieve all transactions where the category is 'Clothing' and 
	the quantity sold is more than 4 in the month of Nov-2022. */   
SELECT * FROM retail_sales_1 WHERE category = 'Clothing' AND quantiy >= 4
AND DATE_FORMAT(sale_date, '%Y-%m') = '2022-11'

-- Q3. Write a SQL query to calculate the total sales for each category. 
SELECT category, SUM(total_sale) as net_sale, COUNT(*) AS total_orders
FROM retail_sales_1 GROUP BY category;

-- Q4. Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category. 
SELECT category,round(AVG(age)) FROM retail_sales_1 WHERE category = 'Beauty';

-- Q5. Write a SQL query to find all transactions where the total_sale is greater than 1000. 
SELECT * FROM retail_sales_1 WHERE total_sale>1000;

/* Q6. Write a SQL query to find the total number of transactions (transaction_id) 
 made by each gender in each category. */
SELECT category, gender, count(transactions_id) as total_transactions FROM retail_sales_1 
GROUP BY category, gender ORDER BY category

/* Q7. Write a SQL query to calculate the average sale for each month. Find out best selling
month in each year. */
SELECT YEAR(sale_date) as year, MONTH(sale_date) as month, round(avg(total_sale),2) as avg_sale
FROM retail_sales_1 GROUP BY year, month ORDER BY year, month
-- We can use rank for it. 
SELECT year, month, avg_sale 
FROM (
	SELECT YEAR(sale_date) as year, MONTH(sale_date) as month,
	round(avg(total_sale),2) as avg_sale, 
	RANK() OVER(PARTITION BY YEAR(sale_date) ORDER BY avg(total_sale) DESC) AS sales_rank
	FROM retail_sales_1 GROUP BY YEAR(sale_date), MONTH(sale_date) 
	) as t1 WHERE sales_rank = 1;

-- Q8. Write a SQL query to find the top 5 customers based on the highest toatal sales. 
SELECT customer_id, SUM(total_sale) AS total_sales FROM retail_sales_1 
GROUP BY customer_id ORDER BY total_sales DESC LIMIT 5;

-- Q9. Write a SQL query to find the number of unique customers who purchased items from each category. 
SELECT category, COUNT(DISTINCT(customer_id)) AS unique_customers FROM retail_sales_1 
GROUP BY category

/* Q10. Write a SQL query to create each shift and number of orders 
(Eg. Morning <=12, Afternoon Between 12 & 17, Evening >17)*/
SELECT 
CASE 
	WHEN sale_time < '06:00:00' THEN 'Midnight'
    WHEN sale_time < '12:00:00' THEN 'Morning'
    WHEN sale_time < '17:00:00' THEN 'Afternoon'
    ELSE 'Evening'
END AS shift , COUNT(*) AS total_orders 
FROM retail_sales_1 GROUP BY shift;


-------------------------- END OF PROJECT ------------------------------------

