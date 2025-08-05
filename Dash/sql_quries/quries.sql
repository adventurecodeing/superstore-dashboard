-- 1️⃣ Total Number of Orders
SELECT COUNT(*) AS total_orders
FROM superstore_data;


-- 2️⃣ Total Sales, Profit, and Discount
SELECT 
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND(SUM(Discount), 2) AS total_discount
FROM superstore_data;


-- 3️⃣ Top 5 Sub-Categories by Total Sales
SELECT 
    `Sub-Category`, 
    ROUND(SUM(Sales), 2) AS total_sales
FROM superstore_data
GROUP BY `Sub-Category`
ORDER BY total_sales DESC
LIMIT 5;


-- 4️⃣ Total Sales by Region
SELECT 
    Region, 
    ROUND(SUM(Sales), 2) AS total_sales
FROM superstore_data
GROUP BY Region
ORDER BY total_sales DESC;


-- 5️⃣ Monthly Sales Trend (Text dates handled)
SELECT 
    DATE_FORMAT(STR_TO_DATE(`Order Date`, '%m/%d/%Y'), '%Y-%m') AS month,
    ROUND(SUM(Sales), 2) AS monthly_sales
FROM superstore_data
WHERE `Order Date` IS NOT NULL
GROUP BY month
ORDER BY month;


-- 6️⃣ Monthly Profit Trend (same format as sales)
SELECT 
    DATE_FORMAT(STR_TO_DATE(`Order Date`, '%m/%d/%Y'), '%Y-%m') AS month,
    ROUND(SUM(Profit), 2) AS monthly_profit
FROM superstore_data
WHERE `Order Date` IS NOT NULL
GROUP BY month
ORDER BY month;


-- 7️⃣ Top 3 Profitable Regions
SELECT 
    Region, 
    ROUND(SUM(Profit), 2) AS total_profit
FROM superstore_data
GROUP BY Region
ORDER BY total_profit DESC
LIMIT 3;


-- 8️⃣ Sub-Categories with Negative Profit
SELECT 
    `Sub-Category`, 
    ROUND(SUM(Profit), 2) AS total_profit
FROM superstore_data
GROUP BY `Sub-Category`
HAVING total_profit < 0
ORDER BY total_profit;


-- 9️⃣Average Discount per Category
SELECT 
    Category, 
    ROUND(AVG(Discount), 2) AS avg_discount
FROM superstore_data
GROUP BY Category
ORDER BY avg_discount DESC;


-- 🔟 Most Sold Sub-Category by Quantity
SELECT 
    `Sub-Category`, 
    SUM(Quantity) AS total_quantity
FROM superstore_data
GROUP BY `Sub-Category`
ORDER BY total_quantity DESC
LIMIT 5;
