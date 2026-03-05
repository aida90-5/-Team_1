--1. view the restaurant kitchen screen of order that has id=15 and its status is in("accepted","preparing") and arranged ascendingly.
SELECT Order_ID, Status, sch_del_time, Payment_Type 
FROM Orders 
WHERE Branch_ID = 15 and Status IN ('Accepted', 'Preparing') 
ORDER BY sch_del_time ASC;
------------------------------------------------------------------------------
--2. calculating the "current_balance" of each user by subtracting its "credit" and "debit" and arrange them by the customer_id. 
SELECT  Cus_ID,
    (NVl((SELECT SUM(Amount) FROM Wallet_Ledger   w1
       WHERE w1.transaction_type = 'Credit' AND w1.Cus_ID = w3.Cus_ID),0) 
      - 
      NVL((SELECT SUM(Amount) FROM Wallet_Ledger w2
       WHERE w2.transaction_type = 'Debit' AND w2.Cus_ID = w3.Cus_ID),0)
    ) AS Current_Balance
FROM Wallet_Ledger w3
GROUP BY Cus_ID
order by Cus_ID;
-- or
select Cus_ID,
sum(case when transaction_type = 'Credit' then Amount else 0 end)-
sum(case when transaction_type = 'Debit' then Amount else 0 end) AS Current_Balance
FROM Wallet_Ledger 
GROUP BY Cus_ID
order by Cus_ID ;
------------------------------------------------------------------------------
--3. find the top 3 most popular menu items across the entire platform during "pre_iftar" timeframe (12 PM - 6 PM).
select * from(
select i.name ,sum(oi.Quantity) as item_number 
from Order_Items oi
join Items i on i.item_ID=oi.item_ID
join Orders o on o.Order_ID=oi.Order_ID 
where TO_CHAR(o.sch_del_time,'HH24:MI:SS')between '12:00:00' and '18:00:00'
group by i.name 
order by item_number desc)
where rownum <= 3 ;
--------------------------------------------------------------------------------
--4. calculate the number of "delivered" orders for each region in the first five rows and ordered descendingly by the number of orders
SELECT* from( 
   select b.Branch_ID,
    b.Delivery_Zones,
    COUNT(o.Order_ID) AS total_delivered_orders
FROM Branches b
JOIN Orders o ON b.Branch_ID = o.Branch_ID
WHERE o.status = 'Delivered'
GROUP BY b.Branch_ID, b.Delivery_Zones
ORDER BY total_delivered_orders DESC
)
where rownum <= 5; 
--------------------------------------------------------------------------------
--5. Calculate a specific captain's total earnings for the week, including base delivery fees and surge bonuses.
select ce.Captain_ID, c.name , sum(ce.Base_Pay+ce.Bonus) as Total_weekly_earnings
from Captains_Earnings ce
join Captains c on ce.Captain_ID=c.Captain_ID
where ce.Time_stamp between TO_DATE('2026-03-01', 'YYYY-MM-DD') AND TO_DATE('2026-03-07', 'YYYY-MM-DD')
group by ce.Captain_ID , c.name;
--------------------------------------------------------------------------------
--6. viewing the ghost(the non sold items) menu items.
SELECT i.item_ID, i.name, i.Price
FROM Items i
LEFT JOIN Order_Items oi ON i.item_ID = oi.item_ID
WHERE oi.item_ID IS NULL;
--------------------------------------------------------------------------------
--7. viewing the most crowded days arranged descendingly by the number of orders.
SELECT TO_CHAR(sch_del_time, 'Day') AS Order_Day, 
       COUNT(Order_ID) AS Total_Orders
FROM Orders
GROUP BY TO_CHAR(sch_del_time, 'Day')
ORDER BY Total_Orders DESC;
--------------------------------------------------------------------------------
--8. calculating the number of orders delivered for each street ordered descendingly by the street and the order_id.
SELECT a.Street, 
       COUNT(o.Order_ID) AS Usage_Count
FROM Cus_Addresses a
JOIN Orders o ON a.Add_ID = o.Address_ID
GROUP BY a.Street
ORDER BY a.Street, Usage_Count DESC;
--------------------------------------------------------------------------------
--9. viewing the most profited hours for each scheduel_delivery ordered by the amount of profit descendingly.
SELECT TO_CHAR(o.sch_del_time, 'HH24') AS Hour, 
       SUM(oi.sold_Price * oi.Quantity) AS Hourly_Profit
FROM Orders o
JOIN Order_Items oi ON o.Order_ID = oi.Order_ID
GROUP BY TO_CHAR(o.sch_del_time, 'HH24')
ORDER BY Hourly_Profit DESC;
--------------------------------------------------------------------------------
--10. calculating and viewing the highest number of choosen modifiers and ordered by  Number_of_choosen_Times.
SELECT im.name , 
       COUNT(oim.Mod_id) AS Number_of_Chosen_Times
FROM Item_Modifiers im
JOIN Order_Item_Modifiers oim ON im.Mod_ID = oim.Mod_id
GROUP BY im.name
ORDER BY  Number_of_Chosen_Times DESC;
--------------------------------------------------------------------------------
--11. calculating and viewing the numbers of "Delivered" orders for each charity ordered descendingly by the number of "Delivered" orders.
SELECT ch.Name, 
       COUNT(o.Order_ID) AS Orders_Received
FROM Charity ch
JOIN Orders o ON ch.Charity_ID = o.Charity_ID
WHERE o.Status = 'Delivered' 
GROUP BY ch.Name
ORDER BY Orders_Received DESC;
--------------------------------------------------------------------------------
--12. viewing the captain with the highest rating.
select c.Name as captain_name ,r.Captain_rev as captain_rating,r.Comment_Rev
from Reviews r
join Orders o on r.Order_ID=o.Order_ID
join Captains c on o.Captain_ID=c.Captain_ID
where r.Captain_rev=(select max(Captain_rev) from Reviews);
--------------------------------------------------------------------------------
--13. viewing the restaurant with the highest rating.
select r.Name as restaurant_name ,re.Restaurant_rev as Restaurant_rating
from Reviews re
join Orders o on re.Order_ID=o.Order_ID
join Branches b on o.Branch_ID=b.Branch_ID
join Restaurants r on b.Restaurant_ID=r.Restaurant_ID
where re.Restaurant_rev=(select max(Restaurant_rev) from Reviews);
--------------------------------------------------------------------------------
--14. viewing the names of customers with the highest donation to the charities.
SELECT * FROM (
    SELECT 
        c.Customer_ID, 
        c.Name AS customer_name, 
        COUNT(o.Order_ID) AS numberOfDonation
    FROM Customer c
    JOIN Orders o ON c.Customer_ID = o.Cus_ID
    WHERE o.is_donation = 1
    GROUP BY c.Customer_ID, c.Name
    ORDER BY numberOfDonation DESC
); 
--------------------------------------------------------------------------------
--15. viewing the customers  who used a promocode ordered descendingly by the number of times they used the promocodes.
select c.Name AS customer_name, p.Code as used_promocode , cp.Count_Usage as number_Of_times_used
from Customer c
join Count_Promo_Usage  cp on c.Customer_ID=cp.Cus_ID
join Promocodes p on p.Promo_ID=cp.Promo_ID
order by  cp.Count_Usage desc; 
--------------------------------------------------------------------------------