-- 1. view the restaurant kitchen screen of order that has id=15 and its status is in("accepted","preparing") and arranged ascendingly.
SELECT Order_ID, Status, Sch_del_time, Payment_Type 
FROM Orders 
WHERE Branch_ID = 15 AND Status IN ('Accepted', 'Preparing') 
ORDER BY Sch_del_time ASC;
-----------------------------------------------------------------------
-- 2. calculating the "current_balance" of each user by subtracting its "credit" and "debit" and arrange them by the customer_id. 
SELECT Cus_ID,
    (IFNULL((SELECT SUM(Amount) FROM Wallet_Ledger w1
       WHERE w1.transaction_type = 'Credit' AND w1.Cus_ID = w3.Cus_ID), 0) 
      - 
     IFNULL((SELECT SUM(Amount) FROM Wallet_Ledger w2
       WHERE w2.transaction_type = 'Debit' AND w2.Cus_ID = w3.Cus_ID), 0)
    ) AS Current_Balance
FROM Wallet_Ledger w3
GROUP BY Cus_ID
ORDER BY Cus_ID;
--or
SELECT Cus_ID,
    SUM(CASE WHEN Transaction_type = 'Credit' THEN Amount ELSE 0 END) -
    SUM(CASE WHEN Transaction_type = 'Debit' THEN Amount ELSE 0 END) AS Current_Balance
FROM Wallet_Ledger 
GROUP BY Cus_ID
ORDER BY Cus_ID;
-----------------------------------------------------------------------
-- 3. find the top 3 most popular menu items across the entire platform during "pre_iftar" timeframe (12 PM - 6 PM).
SELECT i.Name, SUM(oi.Quantity) AS item_number 
FROM Order_Items oi
JOIN Items i ON i.Item_ID = oi.Item_ID
JOIN Orders o ON o.Order_ID = oi.Order_ID 
WHERE DATE_FORMAT(o.Sch_del_time, '%H:%i:%s') BETWEEN '12:00:00' AND '18:00:00'
GROUP BY i.Name 
ORDER BY item_number DESC
LIMIT 3;
-----------------------------------------------------------------------
-- 4. calculate the number of "delivered" orders for each region in the first five rows and ordered descendingly by the number of orders
SELECT b.Branch_ID, b.Delivery_Zones, COUNT(o.Order_ID) AS total_delivered_orders
FROM Branches b
JOIN Orders o ON b.Branch_ID = o.Branch_ID
WHERE o.Status = 'Delivered'
GROUP BY b.Branch_ID, b.Delivery_Zones
ORDER BY total_delivered_orders DESC
LIMIT 5;
-----------------------------------------------------------------------
-- 5. Calculate a specific captain's total earnings for the week, including base delivery fees and surge bonuses.
SELECT ce.Captain_ID, c.Name, SUM(ce.Base_Pay + ce.Bonus) AS Total_weekly_earnings
FROM Captains_Earnings ce
JOIN Captains c ON ce.Captain_ID = c.Captain_ID
WHERE ce.Time_stamp BETWEEN '2026-03-01' AND '2026-03-07'
GROUP BY ce.Captain_ID, c.Name;
-----------------------------------------------------------------------
-- 6. viewing the ghost(the non sold items) menu items.
SELECT i.Item_ID, i.Name, i.Price
FROM Items i
LEFT JOIN Order_Items oi ON i.Item_ID = oi.Item_ID
WHERE oi.Item_ID IS NULL;
-----------------------------------------------------------------------
-- 7. viewing the most crowded days arranged descendingly by the number of orders.
SELECT DAYNAME(Sch_del_time) AS Order_Day, 
       COUNT(Order_ID) AS Total_Orders
FROM Orders
GROUP BY Order_Day
ORDER BY Total_Orders DESC;
-----------------------------------------------------------------------
-- 8. calculating the number of orders delivered for each street ordered descendingly by the street and the order_id.
SELECT a.Street, COUNT(o.Order_ID) AS Usage_Count
FROM Cus_Addresses a
JOIN Orders o ON a.Add_ID = o.Address_ID
GROUP BY a.Street
ORDER BY a.Street ASC, Usage_Count DESC;
-----------------------------------------------------------------------
-- 9. viewing the most profited hours for each scheduel_delivery ordered by the amount of profit descendingly.
SELECT HOUR(o.Sch_del_time) AS Hour, 
       SUM(oi.Sold_Price * oi.Quantity) AS Hourly_Profit
FROM Orders o
JOIN Order_Items oi ON o.Order_ID = oi.Order_ID
GROUP BY Hour
ORDER BY Hourly_Profit DESC;
-----------------------------------------------------------------------
-- 10. calculating and viewing the highest number of choosen modifiers and ordered by Number_of_choosen_Times.
SELECT im.Name, COUNT(oim.Mod_id) AS Number_of_Chosen_Times
FROM Item_Modifiers im
JOIN Order_Item_Modifiers oim ON im.Mod_ID = oim.Mod_id
GROUP BY im.Name
ORDER BY Number_of_Chosen_Times DESC;
-----------------------------------------------------------------------
-- 11. calculating and viewing the numbers of "Delivered" orders for each charity ordered descendingly by the number of "Delivered" orders.
SELECT ch.Name, COUNT(o.Order_ID) AS Orders_Received
FROM Charity ch
JOIN Orders o ON ch.Charity_ID = o.Charity_ID
WHERE o.Status = 'Delivered' 
GROUP BY ch.Name
ORDER BY Orders_Received DESC;
-----------------------------------------------------------------------
-- 12. viewing the captain with the highest rating.
SELECT c.Name AS captain_name, r.Captain_rev AS captain_rating, r.Comment_Rev
FROM Reviews r
JOIN Orders o ON r.Order_ID = o.Order_ID
JOIN Captains c ON o.Captain_ID = c.Captain_ID
WHERE r.Captain_rev = (SELECT MAX(Captain_rev) FROM Reviews);
-----------------------------------------------------------------------
-- 13. viewing the restaurant with the highest rating.
SELECT res.Name AS restaurant_name, re.Restaurant_rev AS Restaurant_rating
FROM Reviews re
JOIN Orders o ON re.Order_ID = o.Order_ID
JOIN Branches b ON o.Branch_ID = b.Branch_ID
JOIN Restaurants res ON b.Restaurant_ID = res.Restaurant_ID
WHERE re.Restaurant_rev = (SELECT MAX(Restaurant_rev) FROM Reviews);
-----------------------------------------------------------------------
-- 14. viewing the names of customers with the highest donation to the charities.
SELECT c.Customer_ID, c.Name AS customer_name, COUNT(o.Order_ID) AS numberOfDonation
FROM Customer c
JOIN Orders o ON c.Customer_ID = o.Cus_ID
WHERE o.Is_donation = 1
GROUP BY c.Customer_ID, c.Name
ORDER BY numberOfDonation DESC;
-----------------------------------------------------------------------
-- 15. viewing the customers who used a promocode ordered descendingly by the number of times they used the promocodes.
SELECT c.Name AS customer_name, p.Code AS used_promocode, cp.Count_Usage AS number_Of_times_used
FROM Customer c
JOIN Count_Promo_Usage cp ON c.Customer_ID = cp.Cus_ID
JOIN Promocodes p ON p.Promo_ID = cp.Promo_ID
ORDER BY cp.Count_Usage DESC;
-----------------------------------------------------------------------