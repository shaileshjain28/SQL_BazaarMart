# Bazaar Mart Analysis: Q1 Overview and Recommendations

## Project Overview

"From January to March: A Comprehensive Bazaar Mart Analysis" is a data analysis project focused on evaluating the performance of Bazaar Mart during the first quarter. The company, an online retailer, aims to make informed decisions for the upcoming quarters based on insights derived from this analysis.

### Tools Used
- Command Prompt
- MySQL Workbench
- Canva
- ChatGPT

## Getting Started

### Setting up MySQL Server
1. Open Command Prompt.
2. Navigate to the MySQL Server bin directory using the command `cd "<pathfile>"`.
3. Enter MySQL server using `mysql -u <username> -p` and provide the password.
4. Allow the server to accept files from the client by typing `SET Global local_infile=1`.
5. Exit the server with `quit`.

### Additional Setup for File Loading
1. Repeat the above steps with a change in directory: `cd "C:\Program Files\MySQL\MySQL Server 8.0\bin"`.
2. Enter MySQL server with `mysql --local-infile=1 -u <username> -p`.

### Loading Data into Database
1. Select the database to work with using `use <database>`.
2. Load the file into the table with:
    ```sql
    LOAD DATA LOCAL INFILE 'FILE PATH'
    INTO TABLE 'table' FIELDS TERMINATED BY ',' 
    ENCLOSED BY '"' LINES TERMINATED BY '\r\n';
    ```
3. Switch to MySQL Workbench to execute queries.

## Analysis Insights

1. Gender Distribution: Customers are evenly split between males and females.
2. Member vs. Normal Customers: Members generate slightly higher revenue.
3. Preferred Payment Method: Cash is the most common payment method.
4. Top-Selling Category: Food and beverages are the highest-selling products.
5. VAT Analysis: Food and beverages contribute significantly to tax revenue.
6. Customer Ratings: Health and beauty products receive the highest average ratings.
7. Active Sales Hours: Afternoon is the most active time, particularly on Saturday and Wednesday.
8. Revenue by Location: Naypyitaw leads in revenue.
9. Highest Rated Days: Tuesday, Sunday, and Thursday have the highest average ratings.
10. COGS Analysis: January and March have the largest cost of goods sold.

## Recommendations

1. Implement monthly or yearly loyalty programs for top customers in both member and normal customer categories.
2. Offer more attractive gifts and discounts in loyalty programs for member customers.
3. Provide special offers and discounts for customers who choose cash transactions.
4. Create enticing offers on food and beverages during specific weekdays.
5. Increase staff during active sales hours, especially in the afternoon.
6. Optimize costs by managing the average COGS for each product based on popularity.

## Contact

- **Shailesh Jain**
  - GitHub: [shaileshjain28](https://github.com/shaileshjain28)
  - Email: [jainshailesh028@gmail.com](mailto:jainshailesh028@gmail.com)
  - LinkedIn: [Shailesh Jain](https://www.linkedin.com/in/shailesh-jain-1297251ab/)
