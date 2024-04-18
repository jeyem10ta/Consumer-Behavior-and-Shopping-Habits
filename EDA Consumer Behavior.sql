USE Consumer_Behavior;

-- Demographic Insights 
-- What is the distribution of customers by age and gender?
SELECT Gender, COUNT(*) AS Count
FROM Customers
GROUP BY Gender; 

-- How does the purchase behavior vary across different age groups and genders?
SELECT c.Age, c.Gender, COUNT(*) AS PurchaseCount, AVG(p.PurchaseAmount) AS AvgPurchaseAmount
FROM Customers c
JOIN Purchases p ON c.`CustomerID` = p.`CustomerID`
GROUP BY c.Age, c.Gender;



-- Purchase Behavior
-- What are the most commonly purchased categories and products?
SELECT Category, ItemPurchased, COUNT(*) AS PurchaseCount
FROM Purchases
GROUP BY Category, ItemPurchased
ORDER BY PurchaseCount DESC;

-- How does the purchase amount vary across different product categories?
SELECT Category, AVG(PurchaseAmount) AS AvgPurchaseAmount
FROM Purchases
GROUP BY Category;

-- Geographical Analysis:
-- How do purchasing behaviors differ across various geographical locations?
SELECT Location, COUNT(*) AS PurchaseCount, AVG(PurchaseAmount) AS AvgPurchaseAmount
FROM Customers
JOIN Purchases ON Customers.`CustomerID` = Purchases.`CustomerID`
GROUP BY Location;

-- Subscription and Loyalty Insights:
-- What percentage of customers are subscribed to a service?
SELECT SubscriptionStatus, COUNT(*) AS Count, (COUNT(*) / (SELECT COUNT(*) FROM Customers)) * 100 AS Percentage
FROM Customers
GROUP BY SubscriptionStatus;

-- Do subscribed customers tend to make more frequent purchases or spend more compared to non-subscribed customers?
SELECT SubscriptionStatus, AVG(FrequencyOfPurchases) AS AvgFrequencyOfPurchases, AVG('PurchaseAmount') AS AvgPurchaseAmount
FROM Customers
GROUP BY SubscriptionStatus;

-- Marketing and Promotional Strategies:
-- How effective are promotional discounts and promo codes in influencing purchase decisions?
SELECT DiscountApplied, PromoCodeUsed, COUNT(*) AS PurchaseCount
FROM Purchases
GROUP BY DiscountApplied, PromoCodeUsed;

-- What types of shipping methods are preferred by customers?
SELECT ShippingType, COUNT(*) AS PurchaseCount
FROM Purchases
GROUP BY ShippingType;

-- Customer Engagement and Retention:
-- How do previous purchase behaviors influence current buying patterns?
SELECT CustomerID, 
       COUNT(*) AS FrequencyOfPurchases
FROM PreviousPurchases
GROUP BY CustomerID;


-- Are there any correlations between customer satisfaction ratings and their likelihood of making repeat purchases?
SELECT ReviewRating, AVG(FrequencyOfPurchases) AS AvgFrequencyOfPurchases
FROM (
    SELECT ReviewRating, CustomerID, COUNT(*) AS FrequencyOfPurchases
    FROM Purchases
    GROUP BY ReviewRating, CustomerID
) AS subquery
GROUP BY ReviewRating;

-- What are the top 5 most purchased items?
SELECT ItemPurchased, COUNT(*) AS PurchaseCount
FROM Purchases
GROUP BY ItemPurchased
ORDER BY PurchaseCount DESC
LIMIT 5;

-- What is the average purchase amount for each category?
SELECT Category, AVG(PurchaseAmount) AS AvgPurchaseAmount
FROM Purchases
GROUP BY Category;

-- Which gender makes the highest average purchase amount?
SELECT Gender, AVG(PurchaseAmount) AS AvgPurchaseAmount
FROM Customers c
JOIN Purchases p ON c.CustomerID = p.CustomerID
GROUP BY Gender
ORDER BY AvgPurchaseAmount DESC
LIMIT 1;

-- How does the average purchase amount vary by age group?
SELECT 
    CASE 
        WHEN Age BETWEEN 18 AND 30 THEN '18-30'
        WHEN Age BETWEEN 31 AND 40 THEN '31-40'
        WHEN Age BETWEEN 41 AND 50 THEN '41-50'
        WHEN Age BETWEEN 51 AND 60 THEN '51-60'
        ELSE 'Above 60'
    END AS AgeGroup,
    AVG(PurchaseAmount) AS AvgPurchaseAmount
FROM Customers c
JOIN Purchases p ON c.CustomerID = p.CustomerID
GROUP BY AgeGroup;


-- What is the distribution of purchase amounts across different payment methods?
SELECT PaymentMethod, 
       COUNT(*) AS PurchaseCount,
       AVG(PurchaseAmount) AS AvgPurchaseAmount,
       MIN(PurchaseAmount) AS MinPurchaseAmount,
       MAX(PurchaseAmount) AS MaxPurchaseAmount
FROM Purchases
GROUP BY PaymentMethod;

-- What is the distribution of purchases across different seasons?
SELECT Season, COUNT(*) AS PurchaseCount
FROM Products
GROUP BY Season;

-- What are the different frequencies of purchases among customers?
SELECT FrequencyOfPurchases, COUNT(*) AS CustomerCount
FROM Customers
GROUP BY FrequencyOfPurchases
ORDER BY CustomerCount DESC ;


-- How does the frequency of purchases vary across different seasons?
SELECT pr.Season, c.FrequencyOfPurchases, COUNT(*) AS PurchaseCount
FROM Purchases p
JOIN Customers c ON p.CustomerID = c.CustomerID
JOIN Products pr ON p.ItemPurchased = pr.ItemPurchased
GROUP BY pr.Season, c.FrequencyOfPurchases;






