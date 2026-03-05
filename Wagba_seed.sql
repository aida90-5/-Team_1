-- 1. Table: Customer
INSERT INTO Customer (Customer_ID, Name) VALUES 
(1, 'Ahmed Ali'),
(2, 'Sara Hassan'),
(3, 'Omar Khaled'),
(4, 'Mona Zaki'),
(5, 'Youssef Amr'),
(6, 'Laila Ibrahim'),
(7, 'Hassan Mahmoud'),
(8, 'Nour El-Din'),
(9, 'Mariam Fathy'),
(10, 'Ziad Tarek'),
(11, 'Fatma Saeed'),
(12, 'Karim Mostafa'),
(13, 'Hoda Mansour'),
(14, 'Sherif Adel'),
(15, 'Dina Fouad'),
(16, 'Waleed Samy'),
(17, 'Salma Eid'),
(18, 'Mostafa Bakr'),
(19, 'Reem Ahmed'),
(20, 'Tamer Hosny'),
(21, 'Nadine Selim'),
(22, 'Khaled El-Sawy'),
(23, 'Mai Ezz'),
(24, 'Ashraf Abdel'),
(25, 'Hany Ramzy'),
(26, 'Eman El-Bahr'),
(27, 'Samy Magdy'),
(28, 'Rana Yasser'),
(29, 'Farida Nour'),
(30, 'Mostafa Shaban');

-- 2. Table: Restaurants
INSERT INTO Restaurants (Restaurant_ID, Name) VALUES 
(1, 'The Grill House'),
(2, 'Pizza Palace'),
(3, 'Gad Express'),
(4, 'Buffalo Burger'),
(5, 'Fish Market'),
(6, 'Koshary Abou Tarek'),
(7, 'Sushi Stars'),
(8, 'Chicken Tikka'),
(9, 'Desoky & Soda'),
(10, 'Willys Kitchen');

-- 3. Table: Captains
INSERT INTO Captains (Captain_ID, Name, Vehicle_details, Current_Status) VALUES 
(1, 'Capt. Ahmed Galal', 'Honda Motorcycle 2022', 'Available'),
(2, 'Capt. Mohamed Samy', 'Yamaha Scooter 2023', 'Busy'),
(3, 'Capt. Sayed Reda', 'Bicycle - Mountain Bike', 'Available'),
(4, 'Capt. Ali Mansour', 'Toyota Corolla 2015', 'Available'),
(5, 'Capt. Hassan Eid', 'Scooter Bella', 'Offline'),
(6, 'Capt. Ibrahim Fawzy', 'Motorcycle Dayun', 'Available'),
(7, 'Capt. Mahmoud Saad', 'Hyundai Elantra 2018', 'Busy'),
(8, 'Capt. Omar Sherif', 'Honda Motorcycle 2021', 'Available'),
(9, 'Capt. Youssef Zaki', 'Bicycle - Trek', 'Available'),
(10, 'Capt. Mostafa Gamal', 'Scooter SYM 2022', 'Available'),
(11, 'Capt. Kareem Bakr', 'Motorcycle Benelli', 'Busy'),
(12, 'Capt. Hany Adel', 'Scooter Marine', 'Available'),
(13, 'Capt. Wael Gomaa', 'Motorcycle Haojue', 'Offline'),
(14, 'Capt. Sherif Nour', 'Bicycle - Phoenix', 'Available'),
(15, 'Capt. Ashour Samy', 'Motorcycle Boxer', 'Available');

-- 4. Table: Surge_Rules
INSERT INTO Surge_Rules (Rule_ID, Name, Start_Time, End_Time, Multiplier, Is_Active) VALUES 
(1, 'Iftar Peak Hour', '2026-03-01 17:00:00', '2026-03-31 19:00:00', 1.5, TRUE),
(2, 'Late Night Suhour', '2026-03-01 00:00:00', '2026-03-31 04:00:00', 1.2, TRUE);

-- 5. Table: Promocodes
INSERT INTO Promocodes (Promo_ID, Code, Expiration_date, Usage_limit_per_user, Global_Usage_limit, Discount_value, Is_percentage) VALUES 
(1, 'RAMADAN2026', '2026-04-01 00:00:00', 1, 1000, 50.00, FALSE),
(2, 'WELCOME10', '2026-12-31 00:00:00', 1, 5000, 10.00, TRUE),
(3, 'IFTAR_FREE', '2026-03-31 00:00:00', 2, 500, 30.00, FALSE);

-- 6. Table: Charity
INSERT INTO Charity (Charity_ID, Name, Street, Building, GPS_Long, GPS_lat) VALUES 
(1, 'Resala Food Bank', 'Mosaddak St, Dokki', 'Bld 12', 31.20, 30.04),
(2, 'Orman Association', 'Haram St, Giza', 'Bld 44', 31.15, 29.98),
(3, 'Misr El-Kheir', 'Fifth Settlement', 'Head Office 1', 31.45, 30.01);

-- 7. Table: Phone_Cus
INSERT INTO Phone_Cus (Phone_ID, Phone, Cus_ID) VALUES 
(1, '01011112222', 1),
(2, '01222223333', 1),
(3, '01144445555', 2),
(4, '01566667777', 3),
(5, '01099998888', 4),
(6, '01233334444', 5),
(7, '01122221111', 6),
(8, '01512345678', 7),
(9, '01000001111', 8),
(10, '01255556666', 9),
(11, '01188889999', 10),
(12, '01012341234', 11),
(13, '01599990000', 12),
(14, '01122223333', 13),
(15, '01211110000', 14),
(16, '01088887777', 15),
(17, '01544443333', 16),
(18, '01100001111', 17),
(19, '01288889999', 18),
(20, '01033332222', 19);

-- 8. Table: Cus_Addresses
INSERT INTO Cus_Addresses (Add_ID, Home_Work, Street, Building, Floor, GPS_Long, GPS_lat, Cus_ID) VALUES 
(1, 'Home', 'Road 9', 'Bld 15', '3rd', 31.25, 30.04, 1),
(2, 'Work', 'Corniche El-Nile', 'Bld 200', '15th', 31.28, 30.06, 1),
(3, 'Home', 'Abbas El-Akkad', 'Bld 40', 'GF', 31.32, 30.08, 2),
(4, 'Work', 'El-Tahrir St.', 'Bld 5', '4th', 31.23, 30.05, 3),
(5, 'Home', 'Zamalek Bridge St', 'Bld 2', '2nd', 31.21, 30.07, 4),
(6, 'Home', '90th North St', 'Bld 100', '1st', 31.45, 30.02, 5),
(7, 'Work', 'Smart Village', 'Bld B1', '3rd', 31.02, 30.12, 6),
(8, 'Home', 'Heliopolis Court', 'Bld 12', '5th', 31.35, 30.10, 7),
(9, 'Home', 'Dokki Square', 'Bld 3', '9th', 31.20, 30.04, 8),
(10, 'Work', 'Maadi Degla', 'Bld 44', 'GF', 31.27, 30.02, 9),
(11, 'Home', 'Nasr Road', 'Bld 55', '3rd', 31.33, 30.09, 10),
(12, 'Home', 'Sheikh Zayed Zayed Entrance', 'Bld 1', '1st', 30.95, 30.15, 11),
(13, 'Home', 'Rehab City Group 5', 'Bld 10', '2nd', 31.48, 30.05, 12),
(14, 'Work', 'Down Town Mall', 'Bld 30', 'GF', 31.43, 30.01, 13),
(15, 'Home', 'Zamalek Mansour Mohamed', 'Bld 8', '4th', 31.22, 30.06, 14);

-- 9. Table: Branches
INSERT INTO Branches (Branch_ID, Delivery_Zones, Operating_hours, Restaurant_ID) VALUES 
(1, 'Maadi', '10:00-02:00', 1),
(2, 'Zamalek', '11:00-03:00', 1),
(3, 'Tagamoa', '24 Hours', 2),
(4, 'Sheikh Zayed', '10:00-01:00', 2),
(5, 'Heliopolis', '09:00-00:00', 3),
(6, 'Dokki', '08:00-02:00', 3),
(7, 'Nasr City', '11:00-04:00', 4),
(8, 'Maadi', '11:00-04:00', 4),
(9, 'Alexandria - Gleem', '10:00-00:00', 5),
(10, 'Heliopolis', '10:00-00:00', 5),
(11, 'Downtown', '09:00-23:00', 6),
(12, 'Mohandessin', '09:00-23:00', 6),
(13, 'Zamalek', '12:00-01:00', 7),
(14, 'Tagamoa', '12:00-01:00', 7),
(15, 'Obour City', '11:00-02:00', 8),
(16, 'Sheikh Zayed', '11:00-02:00', 8),
(17, 'Maadi', '10:00-03:00', 9),
(18, 'Dokki', '10:00-03:00', 9),
(19, 'Rehab City', '11:00-02:00', 10),
(20, 'Madinaty', '11:00-02:00', 10);

-- 10. Table: Count_Promo_Usage
INSERT INTO Count_Promo_Usage (Cus_ID, Promo_ID, Count_Usage) VALUES 
(1, 1, 1),
(2, 1, 1),
(3, 2, 1),
(4, 3, 1);

-- 11. Table: Categories
INSERT INTO Categories (Cat_ID, Name, Branch_ID) VALUES 
(1, 'Main Platters', 1),
(2, 'Family Meals', 1),
(3, 'Italian Pizza', 3),
(4, 'Deep Dish Pizza', 4),
(5, 'Oriental Breakfast', 5),
(6, 'Sandwiches', 6),
(7, 'Beef Burgers', 7),
(8, 'Chicken Burgers', 8),
(9, 'Fresh Sea Food', 9),
(10, 'Koshary Bowls', 11),
(11, 'Sushi Rolls', 13),
(12, 'Grilled Chicken', 15);

-- 12. Table: Orders
INSERT INTO Orders (Order_ID, Sch_del_time, Is_donation, Status, Payment_Type, Del_Fees, Rule_ID, Cus_ID, Branch_ID, Captain_ID, Address_ID, Charity_ID) VALUES 
(1, '2026-03-01 14:00:00', FALSE, 'Delivered', 'Cash', 15.00, NULL, 1, 1, 1, 1, NULL),
(2, '2026-03-01 15:30:00', FALSE, 'Delivered', 'Wallet', 15.00, NULL, 2, 3, 2, 3, NULL),
(3, '2026-03-02 13:00:00', FALSE, 'Delivered', 'Credit Card', 20.00, NULL, 3, 5, 3, 4, NULL),
(4, '2026-03-02 16:00:00', FALSE, 'Delivered', 'Cash', 15.00, NULL, 4, 7, 4, 5, NULL),
(5, '2026-03-02 19:00:00', FALSE, 'Delivered', 'Wallet', 15.00, NULL, 5, 9, 5, 6, NULL),
(6, '2026-03-03 12:00:00', FALSE, 'Delivered', 'Cash', 15.00, NULL, 6, 11, 6, 7, NULL),
(7, '2026-03-03 14:30:00', FALSE, 'Delivered', 'Wallet', 15.00, NULL, 7, 13, 7, 8, NULL),
(8, '2026-03-03 18:00:00', FALSE, 'Delivered', 'Credit Card', 20.00, NULL, 8, 15, 8, 9, NULL),
(9, '2026-03-03 21:00:00', FALSE, 'Delivered', 'Cash', 15.00, NULL, 9, 17, 9, 10, NULL),
(10, '2026-03-04 10:00:00', FALSE, 'Delivered', 'Wallet', 15.00, NULL, 10, 19, 10, 11, NULL),
(11, '2026-03-04 11:30:00', FALSE, 'Cancelled', 'Cash', 0.00, NULL, 11, 2, NULL, 12, NULL),
(12, '2026-03-04 12:45:00', FALSE, 'Delivered', 'Cash', 15.00, NULL, 12, 4, 11, 13, NULL),
(13, '2026-03-04 13:00:00', FALSE, 'Delivered', 'Wallet', 15.00, NULL, 13, 6, 12, 14, NULL),
(14, '2026-03-04 13:30:00', FALSE, 'Delivered', 'Credit Card', 20.00, NULL, 14, 8, 13, 15, NULL),
(15, '2026-03-04 14:00:00', FALSE, 'Delivered', 'Cash', 15.00, NULL, 15, 10, 14, 1, NULL),
(16, '2026-03-10 18:05:00', FALSE, 'Delivered', 'Wallet', 25.00, 1, 1, 1, 1, 1, NULL),
(17, '2026-03-10 18:10:00', FALSE, 'Delivered', 'Cash', 25.00, 1, 2, 2, 2, 3, NULL),
(18, '2026-03-11 18:00:00', FALSE, 'Delivered', 'Credit Card', 30.00, 1, 3, 3, 3, 4, NULL),
(19, '2026-03-11 18:15:00', FALSE, 'Delivered', 'Wallet', 25.00, 1, 4, 4, 4, 5, NULL),
(20, '2026-03-12 18:05:00', FALSE, 'Cancelled', 'Cash', 0.00, 1, 5, 5, NULL, 6, NULL),
(21, '2026-03-12 18:10:00', FALSE, 'Delivered', 'Wallet', 25.00, 1, 6, 6, 6, 7, NULL),
(22, '2026-03-13 18:00:00', FALSE, 'Delivered', 'Cash', 25.00, 1, 7, 7, 7, 8, NULL),
(23, '2026-03-13 18:15:00', FALSE, 'Delivered', 'Credit Card', 30.00, 1, 8, 8, 8, 9, NULL),
(24, '2026-03-14 18:05:00', FALSE, 'Delivered', 'Wallet', 25.00, 1, 9, 9, 9, 10, NULL),
(25, '2026-03-14 18:10:00', FALSE, 'Preparing', 'Cash', 25.00, 1, 10, 10, 10, 11, NULL),
(26, '2026-03-15 18:00:00', FALSE, 'Accepted', 'Wallet', 25.00, 1, 11, 12, NULL, 12, NULL),
(27, '2026-03-15 18:15:00', FALSE, 'Delivered', 'Cash', 25.00, 1, 12, 14, 11, 13, NULL),
(28, '2026-03-16 18:05:00', FALSE, 'Delivered', 'Credit Card', 30.00, 1, 13, 16, 12, 14, NULL),
(29, '2026-03-16 18:10:00', FALSE, 'Delivered', 'Wallet', 25.00, 1, 14, 18, 13, 15, NULL),
(30, '2026-03-17 18:00:00', FALSE, 'Delivered', 'Cash', 25.00, 1, 15, 20, 14, 1, NULL),
(36, CURRENT_TIMESTAMP, TRUE, 'Delivered', 'Wallet', 0.00, NULL, 1, 11, 4, NULL, 1),
(37, CURRENT_TIMESTAMP, TRUE, 'Delivered', 'Credit Card', 0.00, NULL, 2, 13, 5, NULL, 2),
(38, CURRENT_TIMESTAMP, TRUE, 'Preparing', 'Wallet', 0.00, NULL, 3, 15, 6, NULL, 3),
(39, CURRENT_TIMESTAMP, TRUE, 'Delivered', 'Wallet', 0.00, NULL, 4, 17, 7, NULL, 1),
(40, CURRENT_TIMESTAMP, TRUE, 'Accepted', 'Credit Card', 0.00, NULL, 5, 19, NULL, NULL, 2),
(41, CURRENT_TIMESTAMP, TRUE, 'Delivered', 'Wallet', 0.00, NULL, 6, 2, 8, NULL, 3),
(42, CURRENT_TIMESTAMP, TRUE, 'Delivered', 'Wallet', 0.00, NULL, 7, 4, 9, NULL, 1),
(43, CURRENT_TIMESTAMP, TRUE, 'Cancelled', 'Credit Card', 0.00, NULL, 8, 6, NULL, NULL, 2),
(44, CURRENT_TIMESTAMP, TRUE, 'Delivered', 'Wallet', 0.00, NULL, 9, 8, 10, NULL, 3),
(45, CURRENT_TIMESTAMP, TRUE, 'Delivered', 'Wallet', 0.00, NULL, 10, 10, 11, NULL, 1),
(46, CURRENT_TIMESTAMP, TRUE, 'Preparing', 'Credit Card', 0.00, NULL, 11, 12, 12, NULL, 2),
(47, CURRENT_TIMESTAMP, TRUE, 'Delivered', 'Wallet', 0.00, NULL, 12, 14, 13, NULL, 3),
(48, CURRENT_TIMESTAMP, TRUE, 'Delivered', 'Wallet', 0.00, NULL, 13, 16, 14, NULL, 1),
(49, CURRENT_TIMESTAMP, TRUE, 'Out for Delivery', 'Credit Card', 0.00, NULL, 14, 18, 15, NULL, 2),
(50, CURRENT_TIMESTAMP, TRUE, 'Delivered', 'Wallet', 0.00, NULL, 15, 20, 1, NULL, 3);

-- 13. Table: Items
INSERT INTO Items (Item_ID, Name, Is_available, Price, Cat_ID) VALUES 
(1, 'Mix Grill Platter', TRUE, 350.00, 1),
(2, 'Shish Tawook', TRUE, 220.00, 1),
(3, 'Margherita Pizza', TRUE, 150.00, 3),
(4, 'Pepperoni Pizza', TRUE, 190.00, 3),
(5, 'Foul Box', TRUE, 45.00, 5),
(6, 'Falafel Plate', TRUE, 35.00, 5),
(7, 'Old School Burger', TRUE, 135.00, 7),
(8, 'Bacon Mushroom Burger', TRUE, 165.00, 7),
(9, 'Grilled Shrimp', TRUE, 450.00, 9),
(10, 'Sayadiya Rice', TRUE, 60.00, 9),
(11, 'Koshary Mega Box', TRUE, 75.00, 10),
(12, 'California Roll', TRUE, 120.00, 11),
(13, 'Fried Chicken Bucket', TRUE, 290.00, 12),
(14, 'Kofta Sandwich', TRUE, 85.00, 6);

-- 14. Table: Order_Items
INSERT INTO Order_Items (Order_Item_ID, Sold_Price, Quantity, Item_ID, Order_ID) VALUES 
(1, 350.00, 1, 1, 1),
(2, 150.00, 2, 3, 2),
(3, 45.00, 5, 5, 3),
(4, 135.00, 1, 7, 4),
(5, 450.00, 1, 9, 5),
(6, 75.00, 3, 11, 6),
(7, 120.00, 4, 12, 16),
(8, 350.00, 2, 1, 17),
(9, 220.00, 1, 2, 36);

-- 15. Table: Wallet_Ledger
INSERT INTO Wallet_Ledger (Ledger_ID, Transaction_type, Amount, Transaction_Date, Ref_Order_ID, Cus_ID) VALUES 
(1, 'Credit', 1000.00, '2026-03-01 10:00:00', NULL, 1),
(2, 'Credit', 500.00, '2026-03-01 11:00:00', NULL, 2),
(3, 'Credit', 2000.00, '2026-03-01 12:00:00', NULL, 3),
(4, 'Credit', 1500.00, '2026-03-01 13:00:00', NULL, 4),
(5, 'Credit', 800.00, '2026-03-01 14:00:00', NULL, 5),
(6, 'Debit', 365.00, '2026-03-01 14:30:00', 1, 1),
(7, 'Debit', 165.00, '2026-03-01 15:45:00', 2, 2),
(8, 'Debit', 50.00, '2026-03-02 13:15:00', 3, 3),
(9, 'Credit', 300.00, '2026-03-02 14:00:00', NULL, 10),
(10, 'Credit', 450.00, '2026-03-03 09:00:00', NULL, 15),
(11, 'Debit', 150.00, '2026-03-04 12:00:00', 5, 5);

-- 16. Table: Captains_Earnings
INSERT INTO Captains_Earnings (Captain_ID, Ref_Order_ID, Base_Pay, Bonus, Time_stamp) VALUES 
(1, 1, 20.00, 5.00, '2026-03-01 15:00:00'),
(2, 2, 18.00, 2.00, '2026-03-01 16:30:00'),
(3, 3, 15.00, 10.00, '2026-03-02 14:00:00'),
(4, 4, 30.00, 0.00, '2026-03-02 17:00:00'),
(5, 5, 18.00, 5.00, '2026-03-02 20:00:00'),
(1, 16, 20.00, 15.00, '2026-03-10 19:00:00'),
(2, 17, 18.00, 12.00, '2026-03-10 19:15:00');

-- 17. Table: Item_Modifiers
INSERT INTO Item_Modifiers (Mod_ID, Name, Is_available, Price, Item_ID) VALUES 
(1, 'Extra Garlic Dip', TRUE, 15.00, 1),
(2, 'Spicy Rice Upgrade', TRUE, 20.00, 1),
(3, 'Extra Cheese', TRUE, 40.00, 3),
(4, 'Thick Crust', TRUE, 30.00, 4),
(5, 'Add Caramelized Onion', TRUE, 25.00, 7),
(6, 'Double Patty', TRUE, 60.00, 7),
(7, 'Spicy Mayo', TRUE, 15.00, 12),
(8, 'Extra Sauce', TRUE, 10.00, 11);

-- 18. Table: Reviews
INSERT INTO Reviews (Review_ID, Restaurant_rev, Items_rev, Captain_rev, Order_ID) VALUES 
(1, 5, 5, 4, 1),
(2, 4, 4, 5, 2),
(3, 3, 5, 2, 3),
(4, 5, 5, 5, 4),
(5, 2, 3, 4, 5);

-- 19. Table: Order_Item_Modifiers
INSERT INTO Order_Item_Modifiers (Order_item_mod_ID, Mod_id, Price_At_Time) VALUES 
(1, 1, 15.00),
(1, 2, 20.00),
(2, 3, 40.00),
(4, 5, 25.00);