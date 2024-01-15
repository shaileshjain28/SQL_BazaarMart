-- ------------------------------------------------------------EDA------------------------------------------------------------------------

-- ----------------------------------------------------  1) Generic Question---------------------------------------------------------------

-- 1) How many unique cities does the data have?

SELECT COUNT(DISTINCT(city)) AS total_city
FROM sales;


-- 2) In which city is each branch?

SELECT branch, city
FROM sales
GROUP BY branch, city;


-- ------------------------------------------------------------Product---------------------------------------------------------------
-- 1) How many unique product lines does the data have?

SELECT COUNT(DISTINCT(product_line)) AS total_product_lines
FROM sales;

-- 2) What is the most common payment method?

SELECT payment_method, COUNT(*) / (SELECT COUNT(*) FROM sales) * 100 AS percentage
FROM sales
GROUP BY payment_method
ORDER BY COUNT(*) DESC;

-- 3) What is the most selling product line?

SELECT product_line, SUM(total) AS total_sales
FROM sales
GROUP BY product_line
ORDER BY SUM(total) DESC;

-- 4) What is the total revenue by month?

SELECT month_name, SUM(total) AS total_amount
FROM sales
GROUP BY month_name
ORDER BY FIELD(month_name, 'January', 'February', 'March', 'April',
		  'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December');

-- 5) What month had the largest COGS?

SELECT month_name, SUM(cogs) AS cost_of_goods_sold
FROM sales
GROUP BY month_name
ORDER BY cost_of_goods_sold DESC;

-- 6) What product line had the largest revenue?

SELECT product_line, SUM(total) AS total_revenue
FROM sales
GROUP BY product_line
ORDER BY total_revenue DESC;

-- 7) What is the city with the largest revenue?

SELECT city, SUM(total) AS total_revenue
FROM sales
GROUP BY city
ORDER BY total_revenue DESC;

-- 8) What product line had the largest VAT?

SELECT product_line, SUM(vat) AS total_vat
FROM sales
GROUP BY product_line
ORDER BY total_vat DESC;

-- 9) Fetch each product line and add a column to those product line showing
--  "Good", "Bad". Good if its greater than average sales

WITH cte AS
(
SELECT SUM(total)/(SELECT COUNT(DISTINCT(product_line))
				   FROM sales) AS avg_revenue
FROM sales
)

SELECT product_line, SUM(total) as total_revenue,
	   (CASE
        WHEN SUM(total) > (select avg_revenue FROM cte) THEN 'Good'
        WHEN SUM(total) < (select avg_revenue FROM cte) THEN 'Bad'
        END) AS product_line_segment
FROM sales
GROUP BY product_line;

-- 10) Which branch sold more products than average product sold?

SELECT branch, COUNT(*) AS product_sold
FROM sales
GROUP BY branch
HAVING COUNT(*) > (SELECT COUNT(*)/(SELECT COUNT(DISTINCT(branch))
									FROM sales) 
				   FROM sales);

-- 11) What is the most common product line by gender?

SELECT product_line, Gender, count(*) AS product_sold
FROM sales
GROUP BY product_line, Gender
ORDER BY product_sold DESC;

-- 12) What is the average rating of each product line?

SELECT product_line, AVG(rating) AS avg_rating
FROM sales
GROUP BY product_line
ORDER BY avg_rating DESC;

-- --------------------------------------------------------------------------

-- ------------------------------Customer------------------------------------

-- 1) How many unique customer types does the data have?

SELECT COUNT(DISTINCT(customer_type)) AS unique_customer_type
FROM sales;

-- 2) How many unique payment methods does the data have?

SELECT COUNT(DISTINCT(payment_method)) AS unique_payment_type
FROM sales;

-- 3) What is the most common customer type?

SELECT customer_type, COUNT(*) AS num_of_customer
FROM sales
GROUP BY customer_type
ORDER BY num_of_customer DESC;

-- 4) Which customer type buys the most?

SELECT customer_type, COUNT(*) AS num_of_sales
FROM sales
GROUP BY customer_type
ORDER BY num_of_sales DESC;

-- 5) What is the gender of most of the customers?

SELECT gender, COUNT(*) AS num_of_customer
FROM sales
GROUP BY gender;

-- 6) What is the gender distribution per branch?

SELECT branch, gender, count(*) AS gender_distribution
FROM sales
GROUP BY branch, gender
ORDER BY branch;

-- 7) Which time of the day do customers give most ratings?

SELECT time_segment, SUM(rating) AS ratings 
FROM sales
GROUP BY time_segment
ORDER BY ratings DESC;

-- 8) Which time of the day do customers give most ratings per branch?

SELECT branch, time_segment, SUM(rating) AS ratings
FROM sales
GROUP BY branch, time_segment
ORDER BY ratings DESC;

-- 9) Which day fo the week has the best avg ratings?

SELECT day_name, AVG(rating) AS avg_ratings
FROM sales
GROUP BY date, day_name
ORDER BY avg_ratings DESC;

-- 10) Which day of the week has the best average ratings per branch?

SELECT branch, day_name, AVG(rating) AS avg_rating 
FROM sales
GROUP BY branch, day_name
ORDER BY avg_rating DESC;

-- --------------------------------------------------------------------------

-- -----------------------------Sales----------------------------------------

-- 1) Number of sales made in each time of the day per weekday

SELECT day_name, time_segment, count(*) AS num_of_sales
FROM sales
GROUP BY day_name, time_segment
ORDER BY num_of_sales DESC;

-- 2) Which of the customer types brings the most revenue?

SELECT customer_type, SUM(total) AS revenue
FROM sales
GROUP BY customer_type
ORDER BY revenue DESC;

-- 3) Which city has the largest tax percent/ VAT (Value Added Tax)?

SELECT city, SUM(vat) AS vat
FROM sales
GROUP BY city
ORDER BY vat DESC;

-- 4) Which customer type pays the most in VAT?

SELECT customer_type, SUM(vat) AS vat
FROM sales
GROUP BY customer_type
ORDER BY vat DESC