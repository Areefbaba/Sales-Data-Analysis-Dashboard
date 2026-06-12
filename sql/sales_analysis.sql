USE sales_project;

-- 1. TOTAL SALES

SELECT ROUND(SUM(Sales),2) AS Total_Sales
FROM sales;

-- 2. TOTAL PROFIT


SELECT ROUND(SUM(Profit),2) AS Total_Profit
FROM sales;


-- 3. TOTAL ORDERS


SELECT COUNT(DISTINCT `Order ID`) AS Total_Orders
FROM sales;

-- 4. PROFIT MARGIN

SELECT ROUND(
SUM(Profit)*100/SUM(Sales),2
) AS Profit_Margin
FROM sales;

#5. AVERAGE ORDER VALUE-- 

SELECT ROUND(
SUM(Sales)/COUNT(DISTINCT `Order ID`),2
) AS Average_Order_Value
FROM sales;


-- 6. SALES BY REGION

SELECT Region,
ROUND(SUM(Sales),2) AS Revenue
FROM sales
GROUP BY Region
ORDER BY Revenue DESC;


-- 7. PROFIT BY REGION

SELECT Region,
ROUND(SUM(Profit),2) AS Profit
FROM sales
GROUP BY Region
ORDER BY Profit DESC;

-- 8. CATEGORY PERFORMANCE
SELECT Category,
ROUND(SUM(Sales),2) AS Sales,
ROUND(SUM(Profit),2) AS Profit
FROM sales
GROUP BY Category
ORDER BY Sales DESC;

-- 9. SUB CATEGORY PERFORMANCE

SELECT `Sub-Category`,
ROUND(SUM(Sales),2) AS Revenue
FROM sales
GROUP BY `Sub-Category`
ORDER BY Revenue DESC;

-- 10. TOP 10 PRODUCTS

SELECT `Product Name`,
ROUND(SUM(Sales),2) AS Revenue
FROM sales
GROUP BY `Product Name`
ORDER BY Revenue DESC
LIMIT 10;

-- 11. TOP 10 CUSTOMERS

SELECT `Customer Name`,
ROUND(SUM(Sales),2) AS Revenue
FROM sales
GROUP BY `Customer Name`
ORDER BY Revenue DESC
LIMIT 10;

-- 12. CUSTOMER SEGMENT ANALYSIS

SELECT Segment,
ROUND(SUM(Sales),2) AS Revenue
FROM sales
GROUP BY Segment
ORDER BY Revenue DESC;

-- 13. TOP STATES

SELECT State,
ROUND(SUM(Sales),2) AS Revenue
FROM sales
GROUP BY State
ORDER BY Revenue DESC
LIMIT 10;

-- 14. MOST PROFITABLE PRODUCTS

SELECT `Product Name`,
ROUND(SUM(Profit),2) AS Profit
FROM sales
GROUP BY `Product Name`
ORDER BY Profit DESC
LIMIT 10;

-- 15. DISCOUNT IMPACT

SELECT Discount,
ROUND(AVG(Profit),2) AS Avg_Profit
FROM sales
GROUP BY Discount
ORDER BY Discount;

-- 16. LOSS MAKING ORDERS

SELECT *
FROM sales
WHERE Profit < 0;

-- 17. BEST REGION BY PROFIT

SELECT Region,
ROUND(SUM(Profit),2) AS Profit
FROM sales
GROUP BY Region
ORDER BY Profit DESC
LIMIT 1;

-- 18. HIGHEST REVENUE CUSTOMER

SELECT `Customer Name`,
ROUND(SUM(Sales),2) AS Revenue
FROM sales
GROUP BY `Customer Name`
ORDER BY Revenue DESC
LIMIT 1;

-- 19. MONTHLY SALES TREND

SELECT Year,
Month,
ROUND(SUM(Sales),2) AS Revenue
FROM sales
GROUP BY Year, Month
ORDER BY Year;


-- 20. AVERAGE DISCOUNT BY CATEGORY

SELECT Category,
ROUND(AVG(Discount)*100,2) AS Avg_Discount_Percent
FROM sales
GROUP BY Category;

-- 21. TOP 10 PROFITABLE ORDERS

SELECT `Order ID`,
ROUND(Profit,2) AS Profit
FROM sales
ORDER BY Profit DESC
LIMIT 10;

-- 22. TOP CITIES BY SALES

SELECT City,
ROUND(SUM(Sales),2) AS Revenue
FROM sales
GROUP BY City
ORDER BY Revenue DESC
LIMIT 10;

-- =====================================================
-- 23. SHIP MODE ANALYSIS
-- =====================================================

SELECT `Ship Mode`,
COUNT(*) AS Total_Orders,
ROUND(SUM(Sales),2) AS Revenue
FROM sales
GROUP BY `Ship Mode`
ORDER BY Revenue DESC;

-- =====================================================
-- 24. SALES VS PROFIT BY CATEGORY
-- =====================================================

SELECT Category,
ROUND(SUM(Sales),2) AS Total_Sales,
ROUND(SUM(Profit),2) AS Total_Profit,
ROUND(SUM(Profit)*100/SUM(Sales),2) AS Profit_Margin
FROM sales
GROUP BY Category;

-- =====================================================
-- 25. YEARLY SALES TREND
-- =====================================================

SELECT Year,
ROUND(SUM(Sales),2) AS Revenue,
ROUND(SUM(Profit),2) AS Profit
FROM sales
GROUP BY Year
ORDER BY Year;