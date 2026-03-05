# WAGBA DataBase - Entity Relationship Diagram (ERD) 
## Overview
This document will present the Entity Relationship Diagram (ERD) for the Wagba food delivery platform. The ERD will include all 
- tables 
- attributes
- primary keys
- foreign keys
---

## Complete List of All Tables

### Table 1: Customers
| Attribute | Data Type | Key Type | Constraints | Description |
|-----------|-----------|----------|-------------|-------------|
| Customer_ID | INT | Primary Key | NOT NULL | Unique identifier for each customer |
| Name | VARCHAR(100) | | NOT NULL | Customer's full name |


---

### Table 2: Phone_Cus
| Attribute | Data Type | Key Type | Constraints | Description |
|-----------|-----------|----------|-------------|-------------|
| Phone_ID | INT | Primary Key | UNIQUE , NOT NULL | Unique phone identifier |
| Phone | VARCHAR(20) | |UNIQUE , NOT NULL | Actual phone number |
| Cus_ID | INT | Foreign Key | NOT NULL | References the customer |

---

### Table 3: Wallet Ledger
| Attribute | Data Type | Key Type | Constraints | Description |
|----------|-----|----------|-------------|-------------|
|Ledger_ID | INT | Primary Key |UNIQUE , NOT NULL | Unique transaction identifier |
| Transaction_type | VARCHAR(50) | | NOT NULL | Credit or Debit |
| Amount | DECIMAL(10,2) | | NOT NULL, >0 | Transaction amount |
| Date | DATETIME | | NOT NULL | Transaction timestamp |
| Ref_Order_ID | INT | Foreign Key | NOT NULL | Related order |
| Cus_ID | INT | Foreign Key | NOT NULL | Customer who owns transaction |

---

### Table 4: Captains
| Attribute | Data Type | Key Type | Constraints | Description |
|-----------|-----------|----------|-------------|-------------|
| Captain_ID | INT | Primary Key |UNIQUE , NOT NULL | Unique captain identifier |
| name | VARCHAR(100) | | NOT NULL | Captain's full name |
| Vehicle_details | TEXT | | | Vehicle information |
| Current_Status | VARCHAR(50) | | NOT NULL | Available/Busy/Offline |
| Base_Pay | DECIMAL(10,2) | | NOT NULL, >0 | Base delivery fee |

---

### Table 5: Count_Promo_Usage
| Attribute | Data Type | Key Type | Constraints | Description |
|-----------|-----------|----------|-------------|-------------|
| Cus_ID | INT | Primary Key, Foreign Key |UNIQUE , NOT NULL | Customer reference |
| Promo_ID | INT | Primary Key, Foreign Key |UNIQUE , NOT NULL | Promo reference |
| Count_Usage | INT | | NOT NULL | Times used |

---

### Table 6: Promocodes
| Attribute | Data Type | Key Type | Constraints | Description |
|-----------|-----------|----------|-------------|-------------|
| Promo_ID | INT | Primary Key |UNIQUE , NOT NULL | Unique promo identifier |
| Code | VARCHAR(50) | | UNIQUE, NOT NULL | Promo code text |
| expiration_date | DATETIME | | NOT NULL | When promo expires |
| usage_limit_per_user | INT | | NOT NULL | Max uses per customer |
| global_usage_limit | INT | | NOT NULL | Total max uses |
| discount_value | DECIMAL(10,2) | | NOT NULL | Discount amount |
| is_percentage | BOOLEAN | | NOT NULL | TRUE = %, FALSE = fixed |
| Order_ID | INT | Foreign Key |NOT NULL | References order |
---

### Table 7: Orders
| Attribute | Data Type | Key Type | Constraints | Description |
|-----------|-----------|----------|-------------|-------------|
| Order_ID | INT | Primary Key | UNIQUE ,NOT NULL | Unique order identifier |
| sch_del_time | DATETIME | | | Scheduled delivery time |
| is_donation | BOOLEAN | | DEFAULT FALSE | Charity order flag (Ma2edat Rahman) |
| Status | VARCHAR(50) | | NOT NULL | Order status |
| Payment_Type | VARCHAR(50) | | NOT NULL | Payment method |
| Del_Feeds | DECIMAL(10,2) | | NOT NULL | Delivery fee |
| Rule_ID | INT | Foreign Key |NOT NULL | Surge pricing rule |
| Cus_ID | INT | Foreign Key | NOT NULL | Customer reference |
| Branch_ID | INT | Foreign Key | NOT NULL | Branch reference |
| Captain_ID | INT | Foreign Key |NOT NULL | Captain reference |
| Address_ID | INT | Foreign Key |NOT NULL| Address |
| Charity_ID | INT | Foreign Key| NOT NULL| Charity |

---

### Table 8: Categories (Main)
| Attribute | Data Type | Key Type | Constraints | Description |
|-----------|-----------|----------|-------------|-------------|
| Cat_ID | INT | Primary Key | UNIQUE ,NOT NULL | Unique category ID |
| name | VARCHAR(100) | | NOT NULL | Category name |
| Branch_ID | INT | Foreign Key | NOT NULL | Branch reference |

---


### Table 9: Items
| Attribute | Data Type | Key Type | Constraints | Description |
|-----------|-----------|----------|-------------|-------------|
| Item_ID | INT | Primary Key | UNIQUE ,NOT NULL | Item identifier |
| name | VARCHAR(50) | | NOT NULL | Name of the item |
| Price | DECIMAL(10,2) | | NOT NULL | Base price |
| is_available | BOOLEAN | | NOT NULL | Available flag |
| Cat_ID | INT | Foreign Key | NOT NULL | Category Id |

---

### Table 10: Item_Modifiers
| Attribute | Data Type | Key Type | Constraints | Description |
|-----------|-----------|----------|-------------|-------------|
| Mod_ID | INT | Primary Key | UNIQUE ,NOT NULL | Unique modifier ID |
| Name | VARCHAR(50) | | NOT NULL | Modifier name |
| Price | DECIMAL(10,2) | | NOT NULL | Additional cost |
| is_available | BOOLEAN | | NOT NULL | Availability flag |
| Item_ID | INT | Foreign Key | NOT NULL | Item this modifier belongs to |

---

### Table 11: Order_Items
| Attribute | Data Type | Key Type | Constraints | Description |
|-----------|-----------|----------|-------------|-------------|
| Order_Item_ID | INT | Primary Key | UNIQUE ,NOT NULL | Unique order item ID |
| Order_ID | INT | Foreign Key | NOT NULL | Order reference |
| Item_ID | INT | Foreign Key | NOT NULL | Item reference |
| Quantity | INT | | NOT NULL, >0 | Quantity ordered |
| Solid Price | DECIMAL(10,2) | | NOT NULL | Item price when ordered |

---

### Table 12: Order_Item_Modifiers
| Attribute | Data Type | Key Type | Constraints | Description |
|-----------|-----------|----------|-------------|-------------|
| Order_Item_ID | INT | Primary Key, Foreign Key | UNIQUE ,NOT NULL | Order item reference |
| Mod_ID | INT | Primary Key, Foreign Key | UNIQUE ,NOT NULL | Modifier reference |
| Price_At_Time | DECIMAL(10,2) | | NOT NULL | Modifier price when ordered |

---

### Table 13: Reviews
| Attribute | Data Type | Key Type | Constraints | Description |
|-----------|-----------|----------|-------------|-------------|
| Review_ID | INT | Primary Key | UNIQUE ,NOT NULL | Unique review ID |
| Order_ID | INT | Foreign Key | NOT NULL | Order being reviewed |
| Restaurant_Rev | INT | | CHECK (1-5) | Rating for restaurant |
| Items_Rev | INT | | CHECK (1-5) | Rating for items |
| Captain_Rev | INT | | CHECK (1-5) | Rating for captain |
| Comment_Rev | TEXT | | | Text review |

---

### Table 14: Charity
| Attribute | Data Type | Key Type | Constraints | Description |
|-----------|-----------|----------|-------------|-------------|
| Charity_ID | INT | Primary Key | UNIQUE ,NOT NULL | Unique charity record ID |
| Name | VARCHAR(50) | | NOT NULL | Name of charity organization |
| Street | VARCHAR(50) | | NOT NULL | Charity Street |
| Building | VARCHAR(50) | | | Charity Building |
| GPS_COR | VARCHAR(50) | | | GPS |


---

### Table 15: Cus_Addresses
| Attribute | Data Type | Key Type | Constraints | Description |
|-----------|-----------|----------|-------------|-------------|
| Add_ID | INT | Primary Key | UNIQUE ,NOT NULL | Unique address ID |
| Cus_ID | INT | Foreign Key | NOT NULL | Customer reference |
| Home/Work | VARCHAR(20) | | NOT NULL | Home/Work/Other |
| Street | VARCHAR(50) | | NOT NULL | Street name |
| Building | VARCHAR(50) | | | Building number/name |
| Floor | VARCHAR(50) | | | Floor number |
| Apartment | VARCHAR(20) | | | Apartment number |
| GPS_COR | VARCHAR(50) | | | GPS |

---

### Table 16: Branches
| Attribute | Data Type | Key Type | Constraints | Description |
|-----------|-----------|----------|-------------|-------------|
| Branch_ID | INT | Primary Key | UNIQUE ,NOT NULL | Unique branch ID |
| Restaurant_ID | INT |Forign Key | NOT NULL | Restaurant name |
| Operating_hours | VARCHAR(50) | | | Opening hour |
| Delivery_Zone | VARCHAR(50) | | | Delivery area polygon |

---

### Table 17: Surge_Rules
| Attribute | Data Type | Key Type | Constraints | Description |
|-----------|-----------|----------|-------------|-------------|
| Rule_ID | INT | Primary Key | UNIQUE ,NOT NULL | Unique rule ID |
| Name | VARCHAR(50) | | NOT NULL | Rule name |
| Start_Time | DATETIME | | NOT NULL | Surge start |
| End_Time | DATETIME | | NOT NULL | Surge end |
| Multiplier | DECIMAL(3,2) | | NOT NULL, >1 | Fee multiplier |
| Is_Active | BOOLEAN | | | Status Active or not |

---

### Table 18: Restaurants
| Attribute | Data Type | Key Type | Constraints | Description |
|-----------|-----------|----------|-------------|-------------|
| Restaurant_ID | INT | Primary Key |UNIQUE , NOT NULL | Unique wallet ID |
| Name | VARCHAR(50) | | NOT NULL | Restaurant name |

---
### Table 19: Captains_Earnings
| Attribute | Data Type | Key Type | Constraints | Description |
|-----------|-----------|----------|-------------|-------------|
| Captain_ID | INT | Primary Key , Forign key  | UNIQUE ,NOT NULL | Unique captain identifier |
| Ref_Order_ID | INT | Primary Key , Forign key | UNIQUE ,NOT NULL | Captain's full name |
| Bouns | Decimal(10,2) | | | Bouns |
| Time_Stamp | DATETIME | |  | Date  |
| Base_Pay | DECIMAL(10,2) | | NOT NULL, >0 | Base delivery fee |

---

## Summary of All 19 Tables

| No. | Table Name | Purpose |
|-----|------------|---------|
| 1 | Customers | Store customer information |
| 2 | Phone_Cus | Manage multiple phone numbers per customer |
| 3 | Wallet Ledger | Track all wallet transactions (immutable) |
| 4 | Captains | Manage delivery personnel |
| 5 | Count_Promo_Usage | Track promo code usage per customer |
| 6 | Promocodes | Store promotional code details |
| 7 | Orders | Main order information |
| 8 | Categories | Menu categories |
| 9 | Category_Items | Link categories to items |
| 10 | Items | Menu items |
| 11 | Item_Modifiers | Item customization options |
| 12 | Order_Items | Items within each order |
| 13 | Order_Item_Modifiers | Modifiers applied to order items |
| 14 | Reviews | Customer ratings and reviews |
| 15 | Charity_Orders | Track charity/donation orders |
| 16 | Addresses | Customer delivery addresses |
| 17 | Branches | Restaurant branch information |
| 18 | Surge_Rules | Dynamic pricing during peak hours |
| 19 | Captains_Earnings | Track captain earnings including base pay and surge bonuses |
---
---
# SQL SCHEMA
## OverView
- This document presents the entire database schema designed for the food delivery platform **Wagba**  which will be launching in Egypt during the coming Ramadan season. 
- The database schema meets all the business needs for the food delivery platform 
     - Customer management 
     - Restaurant management
     - Order management
     - Delivery captain management
     - Use of an immutable wallet ledger system for financial integrity.

The database schema has a total of 19 tables, all working together to manage the complexity of the food delivery business, especially during peak hours like Iftar and Suhour. Below is each table with a brief explanation of the purpose of each table.

## WAGBA Schema SQL
### CREATE 

- The following are the **CREATE** TABLE statements for the complete database schema used by the Wagba food delivery platform.
- The database tables are defined to meet particular business needs for managing Ramadan services such as Iftar pre-orders, Suhour rushes, dynamic pricing, and charity donations.
 ```SQL
 CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY ,
    Name VARCHAR(50) NOT NULL
) 

CREATE TABLE Restaurants (
    Restaurant_ID INT PRIMARY KEY ,
    Name VARCHAR2(50) NOT NULL
) 

CREATE TABLE Captains (
    Captain_ID INT PRIMARY KEY ,
    name VARCHAR2(50),
    Vehicle_details VARCHAR(50),
    Current_Status VARCHAR(50)
)

CREATE TABLE Surge_Rules (
    Rule_ID INT PRIMARY KEY ,
    Name VARCHAR2(50),
    Start_Time date,
    End_Time date,
    Multiplier DECIMAL(5, 2),
    Is_Active NUMBER(1) default 1,
    CONSTRAINT Mul_chk CHECK (Multiplier > 0),
    CONSTRAINT active_chk check(Is_Active IN(0,1))
) 

CREATE TABLE Promocodes (
    Promo_ID INT PRIMARY KEY ,
    Code VARCHAR(50) UNIQUE not null,
    expiration_date date,
    usage_limit_per_user INT,
    global_Usage_limit INT,
    discount_value DECIMAL(10, 2) check(discount_value>=0) not null,
    is_percentage NUMBER(1) default 0,
    CONSTRAINT Perc_chk CHECK (Is_Percentage IN (0, 1))
) 

CREATE TABLE Charity (
    Charity_ID INT PRIMARY KEY ,
    Name VARCHAR2(50) NOT NULL,
    Street VARCHAR2(50),
    Building VARCHAR2(50),
    GPS_Long DECIMAL(11,8),
    GPS_lat DECIMAL(10,8),
    CONSTRAINT CHK_LONG_CHAR CHECK (GPS_Long BETWEEN 25.0 AND 37.0),
    CONSTRAINT CHK_LAT_CHAR CHECK (GPS_lat BETWEEN 22.0 AND 32.0)
)

CREATE TABLE Phone_Cus (
    Phone_ID INT PRIMARY KEY ,
    Phone VARCHAR(20) NOT NULL,
    Cus_ID INT not null,
    CONSTRAINT fk_phone_cus FOREIGN KEY (Cus_ID) REFERENCES Customer(Customer_ID) ON DELETE CASCADE
) 

CREATE TABLE Cus_Addresses (
    Add_ID INT PRIMARY KEY ,
    Home_Work VARCHAR2(50),
    Street VARCHAR2(50),
    Building VARCHAR2(50),
    Floor VARCHAR2(50),
    GPS_Long DECIMAL(11,8),
    GPS_lat DECIMAL(10,8),
    Cus_ID INT not null,
    CONSTRAINT CHK_LONG CHECK (GPS_Long BETWEEN 25.0 AND 37.0),
    CONSTRAINT CHK_lat CHECK (GPS_lat BETWEEN 22.0 AND 32.0),
    CONSTRAINT fk_addr_cus FOREIGN KEY (Cus_ID) REFERENCES Customer(Customer_ID)
) 

CREATE TABLE Branches (
    Branch_ID INT PRIMARY KEY ,
    Delivery_Zones VARCHAR2(50),
    operating_hours VARCHAR2(50),
    restaurant_ID INT not null,
    CONSTRAINT fk_branch_res FOREIGN KEY (restaurant_ID) REFERENCES Restaurants(Restaurant_ID)
)

CREATE TABLE Count_Promo_Usage (
    Cus_ID INT NOT NULL,
    Promo_ID INT NOT NULL,
    Count_Usage INT DEFAULT 0,
    PRIMARY KEY (Cus_ID, Promo_ID),
    CONSTRAINT fk_promo_cus FOREIGN KEY (Cus_ID) REFERENCES Customer(Customer_ID),
    CONSTRAINT fk_promo_id FOREIGN KEY (Promo_ID) REFERENCES Promocodes(Promo_ID)
) 

CREATE TABLE Categories (
    Cat_ID INT PRIMARY KEY ,
    name VARCHAR2(50),
    Branch_ID INT not null,
    CONSTRAINT fk_cat_branch FOREIGN KEY (Branch_ID) REFERENCES Branches(Branch_ID)
) 

CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY ,
    sch_del_time date,
    is_donation NUMBER(1) DEFAULT 0,
    Status VARCHAR2(50) NOT NULL,
    Payment_Type VARCHAR2(50) NOT NULL,
    Del_Fees DECIMAL(10, 2) default 0 check(Del_Fees>=0),
    Rule_ID INT,
    Cus_ID INT NOT NULL,
    Branch_ID INT NOT NULL,
    Captain_ID INT,
    Address_ID INT,
    Charity_ID INT,
    CONSTRAINT staut_chk CHECK (Status IN ('Pending', 'Accepted','Preparing','Out for Delivery','Delivered','Cancelled')),
    CONSTRAINT pay_chk CHECK (Payment_Type IN ('Cash', 'Credit Card', 'Wallet')),
    CONSTRAINT fk_order_rule FOREIGN KEY (Rule_ID) REFERENCES Surge_Rules(Rule_ID),
    CONSTRAINT fk_order_cus FOREIGN KEY (Cus_ID) REFERENCES Customer(Customer_ID),
    CONSTRAINT fk_order_branch FOREIGN KEY (Branch_ID) REFERENCES Branches(Branch_ID),
    CONSTRAINT fk_order_cap FOREIGN KEY (Captain_ID) REFERENCES Captains(Captain_ID),
    CONSTRAINT fk_order_addr FOREIGN KEY (Address_ID) REFERENCES Cus_Addresses(Add_ID),
    CONSTRAINT fk_order_charity FOREIGN KEY (Charity_ID) REFERENCES Charity(Charity_ID),
    CONSTRAINT is_donation_Chk CHECK (is_donation IN (0, 1)),
    CONSTRAINT donation_chk CHECK (
        (is_donation = 1 AND Charity_ID IS NOT NULL AND Address_ID IS NULL)
        OR
        (is_donation = 0 AND Address_ID IS NOT NULL AND Charity_ID IS NULL)
    )
)

CREATE TABLE Items (
    item_ID INT PRIMARY KEY ,
    name VARCHAR2(50) not null,
    is_available NUMBER(1) DEFAULT 1,
    Price DECIMAL(10, 2) check(Price>=0) not null,
    Cat_ID INT not null,
    CONSTRAINT fk_item_cat FOREIGN KEY (Cat_ID) REFERENCES Categories(Cat_ID),
    CONSTRAINT Check_Available CHECK (Is_Available IN (0, 1))
)

CREATE TABLE Order_Items (
    Order_Item_ID INT PRIMARY KEY ,
    sold_Price DECIMAL(10, 2) check(sold_Price>0)  not null ,
    Quantity INT check(Quantity>0) not null,
    item_ID INT not null,
    Order_ID INT not null,
    CONSTRAINT fk_oi_item FOREIGN KEY (item_ID) REFERENCES Items(item_ID),
    CONSTRAINT fk_oi_order FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
) 

CREATE TABLE Wallet_Ledger (
    Ledger_ID INT PRIMARY KEY ,
    Transaction_type VARCHAR2(50) not null,
    Amount DECIMAL(10, 2) check(Amount>0)not null,
    transaction_Date date DEFAULT sysdate,
    Ref_Order_ID INT not null,
    Cus_ID INT not null,
    CONSTRAINT TRA_chk CHECK (Transaction_type IN ('Credit','Debit')),
    CONSTRAINT fk_wallet_order FOREIGN KEY (Ref_Order_ID) REFERENCES Orders(Order_ID),
    CONSTRAINT fk_wallet_cus FOREIGN KEY (Cus_ID) REFERENCES Customer(Customer_ID)
) 

CREATE TABLE Captains_Earnings (
    Captain_ID INT NOT NULL,
    Ref_Order_ID INT NOT NULL,
    Base_Pay DECIMAL(10, 2),
    Bonus DECIMAL(10, 2),
    Time_stamp date DEFAULT sysdate,
    PRIMARY KEY (Captain_ID, Ref_Order_ID),
    CONSTRAINT Base_CHK CHECK (Base_Pay >= 0),
    CONSTRAINT Bon_CHK CHECK (Bonus >= 0),
    CONSTRAINT fk_earn_cap FOREIGN KEY (Captain_ID) REFERENCES Captains(Captain_ID),
    CONSTRAINT fk_earn_order FOREIGN KEY (Ref_Order_ID) REFERENCES Orders(Order_ID)
) 

CREATE TABLE Item_Modifiers (
    Mod_ID INT PRIMARY KEY ,
    name VARCHAR2(50),
    is_available NUMBER(1) DEFAULT 1,
    Price DECIMAL(10, 2) check(Price>=0) not null,
    item_ID INT not null,
    CONSTRAINT fk_mod_item FOREIGN KEY (item_ID) REFERENCES Items(item_ID),
    CONSTRAINT Mod_Available_Chk CHECK (Is_Available IN (0, 1))
)  

CREATE TABLE Reviews (
    review_ID INT PRIMARY KEY ,
    Restaurant_rev INT,
    Items_rev INT,
    Captain_rev INT,
    Comment_Rev varchar2(4000),
    Order_ID INT,
    CONSTRAINT res_rev_chk CHECK (Restaurant_rev BETWEEN 1 AND 5),
    CONSTRAINT itm_rev_chk CHECK (Items_rev BETWEEN 1 AND 5),
    CONSTRAINT cap_rev_chk CHECK (Captain_rev BETWEEN 1 AND 5),
    CONSTRAINT fk_rev_order FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
)

CREATE TABLE Order_Item_Modifiers (
    Order_item_mod_ID INT NOT NULL,
    Mod_id INT NOT NULL,
    Price_At_Time DECIMAL(10,2) check(Price_At_Time>=0) not null,
    PRIMARY KEY (Order_item_mod_ID, Mod_id),
    CONSTRAINT fk_oim_item FOREIGN KEY (Order_item_mod_ID) REFERENCES Order_Items(Order_Item_ID),
    CONSTRAINT fk_oim_mod FOREIGN KEY (Mod_id) REFERENCES Item_Modifiers(Mod_ID)
)
ALTER TABLE Wallet_Ledger MODIFY Ref_Order_ID NULL;
 ```

### INSERT
- The following INSERT statements will be used to insert realistic sample data into the database to test the system's functionality.
- This includes 30 customers, 15 captains, 10 restaurants with 20 branches, 50 orders including regular, Iftar pre-orders, charity donations, etc.
```SQL
-- 1. Table: Restaurants (10 Entities)
INSERT INTO Restaurants (Restaurant_ID, Name) VALUES 
(1, 'The Grill House');
INSERT ALL 
    INTO Restaurants (Restaurant_ID, Name) VALUES (2, 'Pizza Palace')
    INTO Restaurants (Restaurant_ID, Name) VALUES (3, 'Gad Express')
    INTO Restaurants (Restaurant_ID, Name) VALUES (4, 'Buffalo Burger')
    INTO Restaurants (Restaurant_ID, Name) VALUES (5, 'Fish Market')
    INTO Restaurants (Restaurant_ID, Name) VALUES (6, 'Koshary Abou Tarek')
    INTO Restaurants (Restaurant_ID, Name) VALUES (7, 'Sushi Stars')
    INTO Restaurants (Restaurant_ID, Name) VALUES (8, 'Chicken Tikka')
    INTO Restaurants (Restaurant_ID, Name) VALUES (9, 'Desoky & Soda')
    INTO Restaurants (Restaurant_ID, Name) VALUES (10, 'Willys Kitchen')
SELECT * FROM dual;
commit;

-- 2. Table: Customer (30 Entities)
INSERT ALL 
    INTO Customer (Customer_ID, Name) VALUES (1, 'Ahmed Ali')
    INTO Customer (Customer_ID, Name) VALUES (2, 'Sara Hassan')
    INTO Customer (Customer_ID, Name) VALUES (3, 'Omar Khaled')
    INTO Customer (Customer_ID, Name) VALUES (4, 'Mona Zaki')
    INTO Customer (Customer_ID, Name) VALUES (5, 'Youssef Amr')
    INTO Customer (Customer_ID, Name) VALUES (6, 'Laila Ibrahim')
    INTO Customer (Customer_ID, Name) VALUES (7, 'Hassan Mahmoud')
    INTO Customer (Customer_ID, Name) VALUES (8, 'Nour El-Din')
    INTO Customer (Customer_ID, Name) VALUES (9, 'Mariam Fathy')
    INTO Customer (Customer_ID, Name) VALUES (10, 'Ziad Tarek')
    INTO Customer (Customer_ID, Name) VALUES (11, 'Fatma Saeed')
    INTO Customer (Customer_ID, Name) VALUES (12, 'Karim Mostafa')
    INTO Customer (Customer_ID, Name) VALUES (13, 'Hoda Mansour')
    INTO Customer (Customer_ID, Name) VALUES (14, 'Sherif Adel')
    INTO Customer (Customer_ID, Name) VALUES (15, 'Dina Fouad')
    INTO Customer (Customer_ID, Name) VALUES (16, 'Waleed Samy')
    INTO Customer (Customer_ID, Name) VALUES (17, 'Salma Eid')
    INTO Customer (Customer_ID, Name) VALUES (18, 'Mostafa Bakr')
    INTO Customer (Customer_ID, Name) VALUES (19, 'Reem Ahmed')
    INTO Customer (Customer_ID, Name) VALUES (20, 'Tamer Hosny')
    INTO Customer (Customer_ID, Name) VALUES (21, 'Nadine Selim')
    INTO Customer (Customer_ID, Name) VALUES (22, 'Khaled El-Sawy')
    INTO Customer (Customer_ID, Name) VALUES (23, 'Mai Ezz')
    INTO Customer (Customer_ID, Name) VALUES (24, 'Ashraf Abdel')
    INTO Customer (Customer_ID, Name) VALUES (25, 'Hany Ramzy')
    INTO Customer (Customer_ID, Name) VALUES (26, 'Eman El-Bahr')
    INTO Customer (Customer_ID, Name) VALUES (27, 'Samy Magdy')
    INTO Customer (Customer_ID, Name) VALUES (28, 'Rana Yasser')
    INTO Customer (Customer_ID, Name) VALUES (29, 'Farida Nour')
    INTO Customer (Customer_ID, Name) VALUES (30, 'Mostafa Shaban')
SELECT * FROM dual;
COMMIT;

-- 3. Table: Captain (15 Entities)
INSERT ALL 
    INTO Captains (Captain_ID, Name, Vehicle_details, Current_Status) VALUES (1, 'Capt. Ahmed Galal', 'Honda Motorcycle 2022', 'Available')
    INTO Captains (Captain_ID, Name, Vehicle_details, Current_Status) VALUES (2, 'Capt. Mohamed Samy', 'Yamaha Scooter 2023', 'Busy')
    INTO Captains (Captain_ID, Name, Vehicle_details, Current_Status) VALUES (3, 'Capt. Sayed Reda', 'Bicycle - Mountain Bike', 'Available')
    INTO Captains (Captain_ID, Name, Vehicle_details, Current_Status) VALUES (4, 'Capt. Ali Mansour', 'Toyota Corolla 2015', 'Available')
    INTO Captains (Captain_ID, Name, Vehicle_details, Current_Status) VALUES (5, 'Capt. Hassan Eid', 'Scooter Bella', 'Offline')
    INTO Captains (Captain_ID, Name, Vehicle_details, Current_Status) VALUES (6, 'Capt. Ibrahim Fawzy', 'Motorcycle Dayun', 'Available')
    INTO Captains (Captain_ID, Name, Vehicle_details, Current_Status) VALUES (7, 'Capt. Mahmoud Saad', 'Hyundai Elantra 2018', 'Busy')
    INTO Captains (Captain_ID, Name, Vehicle_details, Current_Status) VALUES (8, 'Capt. Omar Sherif', 'Honda Motorcycle 2021', 'Available')
    INTO Captains (Captain_ID, Name, Vehicle_details, Current_Status) VALUES (9, 'Capt. Youssef Zaki', 'Bicycle - Trek', 'Available')
    INTO Captains (Captain_ID, Name, Vehicle_details, Current_Status) VALUES (10, 'Capt. Mostafa Gamal', 'Scooter SYM 2022', 'Available')
    INTO Captains (Captain_ID, Name, Vehicle_details, Current_Status) VALUES (11, 'Capt. Kareem Bakr', 'Motorcycle Benelli', 'Busy')
    INTO Captains (Captain_ID, Name, Vehicle_details, Current_Status) VALUES (12, 'Capt. Hany Adel', 'Scooter Marine', 'Available')
    INTO Captains (Captain_ID, Name, Vehicle_details, Current_Status) VALUES (13, 'Capt. Wael Gomaa', 'Motorcycle Haojue', 'Offline')
    INTO Captains (Captain_ID, Name, Vehicle_details, Current_Status) VALUES (14, 'Capt. Sherif Nour', 'Bicycle - Phoenix', 'Available')
    INTO Captains (Captain_ID, Name, Vehicle_details, Current_Status) VALUES (15, 'Capt. Ashour Samy', 'Motorcycle Boxer', 'Available')
SELECT * FROM dual;
COMMIT;

-- 4. Table: Surge_rules (2 Entities)
INSERT ALL
    INTO Surge_Rules (Rule_ID, Name, Start_Time, End_Time, Multiplier, Is_Active) 
    VALUES (1, 'Iftar Peak Hour', TO_DATE('2026-03-01 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-03-31 19:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1.5, 1)
    INTO Surge_Rules (Rule_ID, Name, Start_Time, End_Time, Multiplier, Is_Active)
    VALUES(2, 'Late Night Suhour', TO_DATE('2026-03-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-03-31 04:00:00', 'YYYY-MM-DD HH24:MI:SS'),  1.2, 1)
SELECT * FROM dual;
commit;

-- 5. Table: promocode
INSERT ALL 
    INTO Promocodes (Promo_ID, Code, expiration_date, usage_limit_per_user, global_Usage_limit, discount_value, is_percentage) 
    VALUES (1, 'RAMADAN2026', TO_DATE('2026-04-01', 'YYYY-MM-DD'), 1, 1000, 50.00, 0)
    
    INTO Promocodes (Promo_ID, Code, expiration_date, usage_limit_per_user, global_Usage_limit, discount_value, is_percentage) 
    VALUES (2, 'WELCOME10', TO_DATE('2026-12-31', 'YYYY-MM-DD'), 1, 5000, 10.00, 1)
    
    INTO Promocodes (Promo_ID, Code, expiration_date, usage_limit_per_user, global_Usage_limit, discount_value, is_percentage) 
    VALUES (3, 'IFTAR_FREE', TO_DATE('2026-03-31', 'YYYY-MM-DD'), 2, 500, 30.00, 0)
SELECT * FROM dual;
COMMIT;

-- 6. Table: Charity (3 Entities)
INSERT ALL 
    INTO Charity (Charity_ID, Name, Street, Building, GPS_Long, GPS_lat) VALUES (1, 'Resala Food Bank', 'Mosaddak St, Dokki', 'Bld 12', 31.20, 30.04)
    INTO Charity (Charity_ID, Name, Street, Building, GPS_Long, GPS_lat) VALUES (2, 'Orman Association', 'Haram St, Giza', 'Bld 44', 31.15, 29.98)
    INTO Charity (Charity_ID, Name, Street, Building, GPS_Long, GPS_lat) VALUES (3, 'Misr El-Kheir', 'Fifth Settlement', 'Head Office 1', 31.45, 30.01)
SELECT * FROM dual;
COMMIT;

-- 7. Table: Phone_Cus
INSERT ALL 
    INTO Phone_Cus (Phone_ID, Phone, Cus_ID) VALUES (1, '01011112222', 1)
    INTO Phone_Cus (Phone_ID, Phone, Cus_ID) VALUES (2, '01222223333', 1)
    INTO Phone_Cus (Phone_ID, Phone, Cus_ID) VALUES (3, '01144445555', 2)
    INTO Phone_Cus (Phone_ID, Phone, Cus_ID) VALUES (4, '01566667777', 3)
    INTO Phone_Cus (Phone_ID, Phone, Cus_ID) VALUES (5, '01099998888', 4)
    INTO Phone_Cus (Phone_ID, Phone, Cus_ID) VALUES (6, '01233334444', 5)
    INTO Phone_Cus (Phone_ID, Phone, Cus_ID) VALUES (7, '01122221111', 6)
    INTO Phone_Cus (Phone_ID, Phone, Cus_ID) VALUES (8, '01512345678', 7)
    INTO Phone_Cus (Phone_ID, Phone, Cus_ID) VALUES (9, '01000001111', 8)
    INTO Phone_Cus (Phone_ID, Phone, Cus_ID) VALUES (10, '01255556666', 9)
    INTO Phone_Cus (Phone_ID, Phone, Cus_ID) VALUES (11, '01188889999', 10)
    INTO Phone_Cus (Phone_ID, Phone, Cus_ID) VALUES (12, '01012341234', 11)
    INTO Phone_Cus (Phone_ID, Phone, Cus_ID) VALUES (13, '01599990000', 12)
    INTO Phone_Cus (Phone_ID, Phone, Cus_ID) VALUES (14, '01122223333', 13)
    INTO Phone_Cus (Phone_ID, Phone, Cus_ID) VALUES (15, '01211110000', 14)
    INTO Phone_Cus (Phone_ID, Phone, Cus_ID) VALUES (16, '01088887777', 15)
    INTO Phone_Cus (Phone_ID, Phone, Cus_ID) VALUES (17, '01544443333', 16)
    INTO Phone_Cus (Phone_ID, Phone, Cus_ID) VALUES (18, '01100001111', 17)
    INTO Phone_Cus (Phone_ID, Phone, Cus_ID) VALUES (19, '01288889999', 18)
    INTO Phone_Cus (Phone_ID, Phone, Cus_ID) VALUES (20, '01033332222', 19)
SELECT * FROM dual;
commit;

-- 8. Table: Cus_Addresses 
INSERT ALL 
    INTO Cus_Addresses (Add_ID, Home_Work, Street, Building, Floor, GPS_Long, GPS_lat, Cus_ID) VALUES (1, 'Home', 'Road 9', 'Bld 15', '3rd', 31.25, 30.04, 1)
    INTO Cus_Addresses (Add_ID, Home_Work, Street, Building, Floor, GPS_Long, GPS_lat, Cus_ID) VALUES (2, 'Work', 'Corniche El-Nile', 'Bld 200', '15th', 31.28, 30.06, 1)
    INTO Cus_Addresses (Add_ID, Home_Work, Street, Building, Floor, GPS_Long, GPS_lat, Cus_ID) VALUES (3, 'Home', 'Abbas El-Akkad', 'Bld 40', 'GF', 31.32, 30.08, 2)
    INTO Cus_Addresses (Add_ID, Home_Work, Street, Building, Floor, GPS_Long, GPS_lat, Cus_ID) VALUES (4, 'Work', 'El-Tahrir St.', 'Bld 5', '4th', 31.23, 30.05, 3)
    INTO Cus_Addresses (Add_ID, Home_Work, Street, Building, Floor, GPS_Long, GPS_lat, Cus_ID) VALUES (5, 'Home', 'Zamalek Bridge St', 'Bld 2', '2nd', 31.21, 30.07, 4)
    INTO Cus_Addresses (Add_ID, Home_Work, Street, Building, Floor, GPS_Long, GPS_lat, Cus_ID) VALUES (6, 'Home', '90th North St', 'Bld 100', '1st', 31.45, 30.02, 5)
    INTO Cus_Addresses (Add_ID, Home_Work, Street, Building, Floor, GPS_Long, GPS_lat, Cus_ID) VALUES (7, 'Work', 'Smart Village', 'Bld B1', '3rd', 31.02, 30.12, 6)
    INTO Cus_Addresses (Add_ID, Home_Work, Street, Building, Floor, GPS_Long, GPS_lat, Cus_ID) VALUES (8, 'Home', 'Heliopolis Court', 'Bld 12', '5th', 31.35, 30.10, 7)
    INTO Cus_Addresses (Add_ID, Home_Work, Street, Building, Floor, GPS_Long, GPS_lat, Cus_ID) VALUES (9, 'Home', 'Dokki Square', 'Bld 3', '9th', 31.20, 30.04, 8)
    INTO Cus_Addresses (Add_ID, Home_Work, Street, Building, Floor, GPS_Long, GPS_lat, Cus_ID) VALUES (10, 'Work', 'Maadi Degla', 'Bld 44', 'GF', 31.27, 30.02, 9)
    INTO Cus_Addresses (Add_ID, Home_Work, Street, Building, Floor, GPS_Long, GPS_lat, Cus_ID) VALUES (11, 'Home', 'Nasr Road', 'Bld 55', '3rd', 31.33, 30.09, 10)
    INTO Cus_Addresses (Add_ID, Home_Work, Street, Building, Floor, GPS_Long, GPS_lat, Cus_ID) VALUES (12, 'Home', 'Sheikh Zayed Zayed Entrance', 'Bld 1', '1st', 30.95, 30.15, 11)
    INTO Cus_Addresses (Add_ID, Home_Work, Street, Building, Floor, GPS_Long, GPS_lat, Cus_ID) VALUES (13, 'Home', 'Rehab City Group 5', 'Bld 10', '2nd', 31.48, 30.05, 12)
    INTO Cus_Addresses (Add_ID, Home_Work, Street, Building, Floor, GPS_Long, GPS_lat, Cus_ID) VALUES (14, 'Work', 'Down Town Mall', 'Bld 30', 'GF', 31.43, 30.01, 13)
    INTO Cus_Addresses (Add_ID, Home_Work, Street, Building, Floor, GPS_Long, GPS_lat, Cus_ID) VALUES (15, 'Home', 'Zamalek Mansour Mohamed', 'Bld 8', '4th', 31.22, 30.06, 14)
SELECT * FROM dual;
commit;

-- 9. Table: Branches 

INSERT ALL 
    INTO Branches (Branch_ID, Delivery_Zones, operating_hours, restaurant_ID) VALUES (1, 'Maadi', '10:00-02:00', 1)
    INTO Branches (Branch_ID, Delivery_Zones, operating_hours, restaurant_ID) VALUES (2, 'Zamalek', '11:00-03:00', 1)
    INTO Branches (Branch_ID, Delivery_Zones, operating_hours, restaurant_ID) VALUES (3, 'Tagamoa', '24 Hours', 2)
    INTO Branches (Branch_ID, Delivery_Zones, operating_hours, restaurant_ID) VALUES (4, 'Sheikh Zayed', '10:00-01:00', 2)
    INTO Branches (Branch_ID, Delivery_Zones, operating_hours, restaurant_ID) VALUES (5, 'Heliopolis', '09:00-00:00', 3)
    INTO Branches (Branch_ID, Delivery_Zones, operating_hours, restaurant_ID) VALUES (6, 'Dokki', '08:00-02:00', 3)
    INTO Branches (Branch_ID, Delivery_Zones, operating_hours, restaurant_ID) VALUES (7, 'Nasr City', '11:00-04:00', 4)
    INTO Branches (Branch_ID, Delivery_Zones, operating_hours, restaurant_ID) VALUES (8, 'Maadi', '11:00-04:00', 4)
    INTO Branches (Branch_ID, Delivery_Zones, operating_hours, restaurant_ID) VALUES (9, 'Alexandria - Gleem', '10:00-00:00', 5)
    INTO Branches (Branch_ID, Delivery_Zones, operating_hours, restaurant_ID) VALUES (10, 'Heliopolis', '10:00-00:00', 5)
    INTO Branches (Branch_ID, Delivery_Zones, operating_hours, restaurant_ID) VALUES (11, 'Downtown', '09:00-23:00', 6)
    INTO Branches (Branch_ID, Delivery_Zones, operating_hours, restaurant_ID) VALUES (12, 'Mohandessin', '09:00-23:00', 6)
    INTO Branches (Branch_ID, Delivery_Zones, operating_hours, restaurant_ID) VALUES (13, 'Zamalek', '12:00-01:00', 7)
    INTO Branches (Branch_ID, Delivery_Zones, operating_hours, restaurant_ID) VALUES (14, 'Tagamoa', '12:00-01:00', 7)
    INTO Branches (Branch_ID, Delivery_Zones, operating_hours, restaurant_ID) VALUES (15, 'Obour City', '11:00-02:00', 8)
    INTO Branches (Branch_ID, Delivery_Zones, operating_hours, restaurant_ID) VALUES (16, 'Sheikh Zayed', '11:00-02:00', 8)
    INTO Branches (Branch_ID, Delivery_Zones, operating_hours, restaurant_ID) VALUES (17, 'Maadi', '10:00-03:00', 9)
    INTO Branches (Branch_ID, Delivery_Zones, operating_hours, restaurant_ID) VALUES (18, 'Dokki', '10:00-03:00', 9)
    INTO Branches (Branch_ID, Delivery_Zones, operating_hours, restaurant_ID) VALUES (19, 'Rehab City', '11:00-02:00', 10)
    INTO Branches (Branch_ID, Delivery_Zones, operating_hours, restaurant_ID) VALUES (20, 'Madinaty', '11:00-02:00', 10)
SELECT * FROM dual;
commit;

--10. Table: Count_Promo_Usage
INSERT ALL 
    INTO Count_Promo_Usage (Cus_ID, Promo_ID, Count_Usage) VALUES (1, 1, 1)
    INTO Count_Promo_Usage (Cus_ID, Promo_ID, Count_Usage) VALUES (2, 1, 1)
    INTO Count_Promo_Usage (Cus_ID, Promo_ID, Count_Usage) VALUES (3, 2, 1)
    INTO Count_Promo_Usage (Cus_ID, Promo_ID, Count_Usage) VALUES (4, 3, 1)
SELECT * FROM dual;
commit;

-- 11. Table: Categories 
INSERT ALL 
    INTO Categories (Cat_ID, name, Branch_ID) VALUES (1, 'Main Platters', 1)
    INTO Categories (Cat_ID, name, Branch_ID) VALUES (2, 'Family Meals', 1)
    INTO Categories (Cat_ID, name, Branch_ID) VALUES (3, 'Italian Pizza', 3)
    INTO Categories (Cat_ID, name, Branch_ID) VALUES (4, 'Deep Dish Pizza', 4)
    INTO Categories (Cat_ID, name, Branch_ID) VALUES (5, 'Oriental Breakfast', 5)
    INTO Categories (Cat_ID, name, Branch_ID) VALUES (6, 'Sandwiches', 6)
    INTO Categories (Cat_ID, name, Branch_ID) VALUES (7, 'Beef Burgers', 7)
    INTO Categories (Cat_ID, name, Branch_ID) VALUES (8, 'Chicken Burgers', 8)
    INTO Categories (Cat_ID, name, Branch_ID) VALUES (9, 'Fresh Sea Food', 9)
    INTO Categories (Cat_ID, name, Branch_ID) VALUES (10, 'Koshary Bowls', 11)
    INTO Categories (Cat_ID, name, Branch_ID) VALUES (11, 'Sushi Rolls', 13)
    INTO Categories (Cat_ID, name, Branch_ID) VALUES (12, 'Grilled Chicken', 15)
SELECT * FROM dual;
commit;

-- 12. Table: Orders 
INSERT ALL
-- [1-15] ASAP Historical Orders (Delivered)
    INTO Orders VALUES (1, TO_DATE('2026-03-01 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 0, 'Delivered', 'Cash', 15.00, NULL, 1, 1, 1, 1, NULL)
    INTO Orders VALUES (2, TO_DATE('2026-03-01 15:30:00', 'YYYY-MM-DD HH24:MI:SS'), 0, 'Delivered', 'Wallet', 15.00, NULL, 2, 3, 2, 3, NULL)
    INTO Orders VALUES (3, TO_DATE('2026-03-02 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), 0, 'Delivered', 'Credit Card', 20.00, NULL, 3, 5, 3, 4, NULL)
    INTO Orders VALUES (4, TO_DATE('2026-03-02 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 0, 'Delivered', 'Cash', 15.00, NULL, 4, 7, 4, 5, NULL)
    INTO Orders VALUES (5, TO_DATE('2026-03-02 19:00:00', 'YYYY-MM-DD HH24:MI:SS'), 0, 'Delivered', 'Wallet', 15.00, NULL, 5, 9, 5, 6, NULL)
    INTO Orders VALUES (6, TO_DATE('2026-03-03 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 0, 'Delivered', 'Cash', 15.00, NULL, 6, 11, 6, 7, NULL)
    INTO Orders VALUES (7, TO_DATE('2026-03-03 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), 0, 'Delivered', 'Wallet', 15.00, NULL, 7, 13, 7, 8, NULL)
    INTO Orders VALUES (8, TO_DATE('2026-03-03 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 0, 'Delivered', 'Credit Card', 20.00, NULL, 8, 15, 8, 9, NULL)
    INTO Orders VALUES (9, TO_DATE('2026-03-03 21:00:00', 'YYYY-MM-DD HH24:MI:SS'), 0, 'Delivered', 'Cash', 15.00, NULL, 9, 17, 9, 10, NULL)
    INTO Orders VALUES (10, TO_DATE('2026-03-04 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 0, 'Delivered', 'Wallet', 15.00, NULL, 10, 19, 10, 11, NULL)
    INTO Orders VALUES (11, TO_DATE('2026-03-04 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), 0, 'Cancelled', 'Cash', 0.00, NULL, 11, 2, NULL, 12, NULL)
    INTO Orders VALUES (12, TO_DATE('2026-03-04 12:45:00', 'YYYY-MM-DD HH24:MI:SS'), 0, 'Delivered', 'Cash', 15.00, NULL, 12, 4, 11, 13, NULL)
    INTO Orders VALUES (13, TO_DATE('2026-03-04 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), 0, 'Delivered', 'Wallet', 15.00, NULL, 13, 6, 12, 14, NULL)
    INTO Orders VALUES (14, TO_DATE('2026-03-04 13:30:00', 'YYYY-MM-DD HH24:MI:SS'), 0, 'Delivered', 'Credit Card', 20.00, NULL, 14, 8, 13, 15, NULL)
    INTO Orders VALUES (15, TO_DATE('2026-03-04 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 0, 'Delivered', 'Cash', 15.00, NULL, 15, 10, 14, 1, NULL)
-- [16-35] Iftar Pre-orders (Surge Pricing)
    INTO Orders VALUES (16, TO_DATE('2026-03-10 18:05:00', 'YYYY-MM-DD HH24:MI:SS'), 0, 'Delivered', 'Wallet', 25.00, 1, 1, 1, 1, 1, NULL)
    INTO Orders VALUES (17, TO_DATE('2026-03-10 18:10:00', 'YYYY-MM-DD HH24:MI:SS'), 0, 'Delivered', 'Cash', 25.00, 1, 2, 2, 2, 3, NULL)
    INTO Orders VALUES (18, TO_DATE('2026-03-11 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 0, 'Delivered', 'Credit Card', 30.00, 1, 3, 3, 3, 4, NULL)
    INTO Orders VALUES (19, TO_DATE('2026-03-11 18:15:00', 'YYYY-MM-DD HH24:MI:SS'), 0, 'Delivered', 'Wallet', 25.00, 1, 4, 4, 4, 5, NULL)
    INTO Orders VALUES (20, TO_DATE('2026-03-12 18:05:00', 'YYYY-MM-DD HH24:MI:SS'), 0, 'Cancelled', 'Cash', 0.00, 1, 5, 5, NULL, 6, NULL)
    INTO Orders VALUES (21, TO_DATE('2026-03-12 18:10:00', 'YYYY-MM-DD HH24:MI:SS'), 0, 'Delivered', 'Wallet', 25.00, 1, 6, 6, 6, 7, NULL)
    INTO Orders VALUES (22, TO_DATE('2026-03-13 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 0, 'Delivered', 'Cash', 25.00, 1, 7, 7, 7, 8, NULL)
    INTO Orders VALUES (23, TO_DATE('2026-03-13 18:15:00', 'YYYY-MM-DD HH24:MI:SS'), 0, 'Delivered', 'Credit Card', 30.00, 1, 8, 8, 8, 9, NULL)
    INTO Orders VALUES (24, TO_DATE('2026-03-14 18:05:00', 'YYYY-MM-DD HH24:MI:SS'), 0, 'Delivered', 'Wallet', 25.00, 1, 9, 9, 9, 10, NULL)
    INTO Orders VALUES (25, TO_DATE('2026-03-14 18:10:00', 'YYYY-MM-DD HH24:MI:SS'), 0, 'Preparing', 'Cash', 25.00, 1, 10, 10, 10, 11, NULL)
    INTO Orders VALUES (26, TO_DATE('2026-03-15 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 0, 'Accepted', 'Wallet', 25.00, 1, 11, 12, NULL, 12, NULL)
    INTO Orders VALUES (27, TO_DATE('2026-03-15 18:15:00', 'YYYY-MM-DD HH24:MI:SS'), 0, 'Delivered', 'Cash', 25.00, 1, 12, 14, 11, 13, NULL)
    INTO Orders VALUES (28, TO_DATE('2026-03-16 18:05:00', 'YYYY-MM-DD HH24:MI:SS'), 0, 'Delivered', 'Credit Card', 30.00, 1, 13, 16, 12, 14, NULL)
    INTO Orders VALUES (29, TO_DATE('2026-03-16 18:10:00', 'YYYY-MM-DD HH24:MI:SS'), 0, 'Delivered', 'Wallet', 25.00, 1, 14, 18, 13, 15, NULL)
    INTO Orders VALUES (30, TO_DATE('2026-03-17 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 0, 'Delivered', 'Cash', 25.00, 1, 15, 20, 14, 1, NULL)
-- [36-50] Charity Donations (is_donation = 1, Address_ID must be NULL for pure donation)
    INTO Orders (Order_ID, sch_del_time, is_donation, Status, Payment_Type, Del_Fees, Rule_ID, Cus_ID, Branch_ID, Captain_ID, Address_ID, Charity_ID) VALUES (36, SYSDATE, 1, 'Delivered', 'Wallet', 0.00, NULL, 1, 11, 4, NULL, 1)
    INTO Orders (Order_ID, sch_del_time, is_donation, Status, Payment_Type, Del_Fees, Rule_ID, Cus_ID, Branch_ID, Captain_ID, Address_ID, Charity_ID) VALUES (37, SYSDATE, 1, 'Delivered', 'Credit Card', 0.00, NULL, 2, 13, 5, NULL, 2)
    INTO Orders (Order_ID, sch_del_time, is_donation, Status, Payment_Type, Del_Fees, Rule_ID, Cus_ID, Branch_ID, Captain_ID, Address_ID, Charity_ID) VALUES (38, SYSDATE, 1, 'Preparing', 'Wallet', 0.00, NULL, 3, 15, 6, NULL, 3)
    INTO Orders (Order_ID, sch_del_time, is_donation, Status, Payment_Type, Del_Fees, Rule_ID, Cus_ID, Branch_ID, Captain_ID, Address_ID, Charity_ID) VALUES (39, SYSDATE, 1, 'Delivered', 'Wallet', 0.00, NULL, 4, 17, 7, NULL, 1)
    INTO Orders (Order_ID, sch_del_time, is_donation, Status, Payment_Type, Del_Fees, Rule_ID, Cus_ID, Branch_ID, Captain_ID, Address_ID, Charity_ID) VALUES (40, SYSDATE, 1, 'Accepted', 'Credit Card', 0.00, NULL, 5, 19, NULL, NULL, 2)
    INTO Orders (Order_ID, sch_del_time, is_donation, Status, Payment_Type, Del_Fees, Rule_ID, Cus_ID, Branch_ID, Captain_ID, Address_ID, Charity_ID) VALUES (41, SYSDATE, 1, 'Delivered', 'Wallet', 0.00, NULL, 6, 2, 8, NULL, 3)
    INTO Orders (Order_ID, sch_del_time, is_donation, Status, Payment_Type, Del_Fees, Rule_ID, Cus_ID, Branch_ID, Captain_ID, Address_ID, Charity_ID) VALUES (42, SYSDATE, 1, 'Delivered', 'Wallet', 0.00, NULL, 7, 4, 9, NULL, 1)
    INTO Orders (Order_ID, sch_del_time, is_donation, Status, Payment_Type, Del_Fees, Rule_ID, Cus_ID, Branch_ID, Captain_ID, Address_ID, Charity_ID) VALUES (43, SYSDATE, 1, 'Cancelled', 'Credit Card', 0.00, NULL, 8, 6, NULL, NULL, 2)
    INTO Orders (Order_ID, sch_del_time, is_donation, Status, Payment_Type, Del_Fees, Rule_ID, Cus_ID, Branch_ID, Captain_ID, Address_ID, Charity_ID) VALUES (44, SYSDATE, 1, 'Delivered', 'Wallet', 0.00, NULL, 9, 8, 10, NULL, 3)
    INTO Orders (Order_ID, sch_del_time, is_donation, Status, Payment_Type, Del_Fees, Rule_ID, Cus_ID, Branch_ID, Captain_ID, Address_ID, Charity_ID) VALUES (45, SYSDATE, 1, 'Delivered', 'Wallet', 0.00, NULL, 10, 10, 11, NULL, 1)
    INTO Orders (Order_ID, sch_del_time, is_donation, Status, Payment_Type, Del_Fees, Rule_ID, Cus_ID, Branch_ID, Captain_ID, Address_ID, Charity_ID) VALUES (46, SYSDATE, 1, 'Preparing', 'Credit Card', 0.00, NULL, 11, 12, 12, NULL, 2)
    INTO Orders (Order_ID, sch_del_time, is_donation, Status, Payment_Type, Del_Fees, Rule_ID, Cus_ID, Branch_ID, Captain_ID, Address_ID, Charity_ID) VALUES (47, SYSDATE, 1, 'Delivered', 'Wallet', 0.00, NULL, 12, 14, 13, NULL, 3)
    INTO Orders (Order_ID, sch_del_time, is_donation, Status, Payment_Type, Del_Fees, Rule_ID, Cus_ID, Branch_ID, Captain_ID, Address_ID, Charity_ID) VALUES (48, SYSDATE, 1, 'Delivered', 'Wallet', 0.00, NULL, 13, 16, 14, NULL, 1)
    INTO Orders (Order_ID, sch_del_time, is_donation, Status, Payment_Type, Del_Fees, Rule_ID, Cus_ID, Branch_ID, Captain_ID, Address_ID, Charity_ID) VALUES (49, SYSDATE, 1, 'Out for Delivery', 'Credit Card', 0.00, NULL, 14, 18, 15, NULL, 2)
    INTO Orders (Order_ID, sch_del_time, is_donation, Status, Payment_Type, Del_Fees, Rule_ID, Cus_ID, Branch_ID, Captain_ID, Address_ID, Charity_ID) VALUES (50, SYSDATE, 1, 'Delivered', 'Wallet', 0.00, NULL, 15, 20, 1, NULL, 3)
SELECT * FROM dual;
commit;

-- 13. Table: Items 
INSERT ALL 
    INTO Items (item_ID, name, is_available, Price, Cat_ID) VALUES (1, 'Mix Grill Platter', 1, 350.00, 1)
    INTO Items (item_ID, name, is_available, Price, Cat_ID) VALUES (2, 'Shish Tawook', 1, 220.00, 1)
    INTO Items (item_ID, name, is_available, Price, Cat_ID) VALUES (3, 'Margherita Pizza', 1, 150.00, 3)
    INTO Items (item_ID, name, is_available, Price, Cat_ID) VALUES (4, 'Pepperoni Pizza', 1, 190.00, 3)
    INTO Items (item_ID, name, is_available, Price, Cat_ID) VALUES (5, 'Foul Box', 1, 45.00, 5)
    INTO Items (item_ID, name, is_available, Price, Cat_ID) VALUES (6, 'Falafel Plate', 1, 35.00, 5)
    INTO Items (item_ID, name, is_available, Price, Cat_ID) VALUES (7, 'Old School Burger', 1, 135.00, 7)
    INTO Items (item_ID, name, is_available, Price, Cat_ID) VALUES (8, 'Bacon Mushroom Burger', 1, 165.00, 7)
    INTO Items (item_ID, name, is_available, Price, Cat_ID) VALUES (9, 'Grilled Shrimp', 1, 450.00, 9)
    INTO Items (item_ID, name, is_available, Price, Cat_ID) VALUES (10, 'Sayadiya Rice', 1, 60.00, 9)
    INTO Items (item_ID, name, is_available, Price, Cat_ID) VALUES (11, 'Koshary Mega Box', 1, 75.00, 10)
    INTO Items (item_ID, name, is_available, Price, Cat_ID) VALUES (12, 'California Roll', 1, 120.00, 11)
    INTO Items (item_ID, name, is_available, Price, Cat_ID) VALUES (13, 'Fried Chicken Bucket', 1, 290.00, 12)
    INTO Items (item_ID, name, is_available, Price, Cat_ID) VALUES (14, 'Kofta Sandwich', 1, 85.00, 6)
SELECT * FROM dual;
commit;

-- 14. Table: Order_Items
INSERT ALL 
    INTO Order_Items (Order_Item_ID, sold_Price, Quantity, item_ID, Order_ID) VALUES (1, 350.00, 1, 1, 1)
    INTO Order_Items (Order_Item_ID, sold_Price, Quantity, item_ID, Order_ID) VALUES (2, 150.00, 2, 3, 2)
    INTO Order_Items (Order_Item_ID, sold_Price, Quantity, item_ID, Order_ID) VALUES (3, 45.00, 5, 5, 3)
    INTO Order_Items (Order_Item_ID, sold_Price, Quantity, item_ID, Order_ID) VALUES (4, 135.00, 1, 7, 4)
    INTO Order_Items (Order_Item_ID, sold_Price, Quantity, item_ID, Order_ID) VALUES (5, 450.00, 1, 9, 5)
    INTO Order_Items (Order_Item_ID, sold_Price, Quantity, item_ID, Order_ID) VALUES (6, 75.00, 3, 11, 6)
    INTO Order_Items (Order_Item_ID, sold_Price, Quantity, item_ID, Order_ID) VALUES (7, 120.00, 4, 12, 16)
    INTO Order_Items (Order_Item_ID, sold_Price, Quantity, item_ID, Order_ID) VALUES (8, 350.00, 2, 1, 17)
    INTO Order_Items (Order_Item_ID, sold_Price, Quantity, item_ID, Order_ID) VALUES (9, 220.00, 1, 2, 36)
SELECT * FROM dual;
commit;

-- 15. Table: wallet_ledger
INSERT ALL
    INTO Wallet_Ledger (Ledger_ID, Transaction_type, Amount, transaction_Date, Ref_Order_ID, Cus_ID) 
        VALUES (1, 'Credit', 1000.00, TO_DATE('2026-03-01 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 1)
    INTO Wallet_Ledger (Ledger_ID, Transaction_type, Amount, transaction_Date, Ref_Order_ID, Cus_ID) 
        VALUES (2, 'Credit', 500.00, TO_DATE('2026-03-01 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 2)
    INTO Wallet_Ledger (Ledger_ID, Transaction_type, Amount, transaction_Date, Ref_Order_ID, Cus_ID) 
        VALUES (3, 'Credit', 2000.00, TO_DATE('2026-03-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 3)
    INTO Wallet_Ledger (Ledger_ID, Transaction_type, Amount, transaction_Date, Ref_Order_ID, Cus_ID) 
        VALUES (4, 'Credit', 1500.00, TO_DATE('2026-03-01 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 4)
    INTO Wallet_Ledger (Ledger_ID, Transaction_type, Amount, transaction_Date, Ref_Order_ID, Cus_ID) 
        VALUES (5, 'Credit', 800.00, TO_DATE('2026-03-01 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 5)
    INTO Wallet_Ledger (Ledger_ID, Transaction_type, Amount, transaction_Date, Ref_Order_ID, Cus_ID) 
        VALUES (6, 'Debit', 365.00, TO_DATE('2026-03-01 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 1)
    INTO Wallet_Ledger (Ledger_ID, Transaction_type, Amount, transaction_Date, Ref_Order_ID, Cus_ID) 
        VALUES (7, 'Debit', 165.00, TO_DATE('2026-03-01 15:45:00', 'YYYY-MM-DD HH24:MI:SS'), 2, 2)
    INTO Wallet_Ledger (Ledger_ID, Transaction_type, Amount, transaction_Date, Ref_Order_ID, Cus_ID) 
        VALUES (8, 'Debit', 50.00, TO_DATE('2026-03-02 13:15:00', 'YYYY-MM-DD HH24:MI:SS'), 3, 3)
    INTO Wallet_Ledger (Ledger_ID, Transaction_type, Amount, transaction_Date, Ref_Order_ID, Cus_ID) 
        VALUES (9, 'Credit', 300.00, TO_DATE('2026-03-02 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 10)
    INTO Wallet_Ledger (Ledger_ID, Transaction_type, Amount, transaction_Date, Ref_Order_ID, Cus_ID) 
        VALUES (10, 'Credit', 450.00, TO_DATE('2026-03-03 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 15)
    INTO Wallet_Ledger (Ledger_ID, Transaction_type, Amount, transaction_Date, Ref_Order_ID, Cus_ID) 
        VALUES (11, 'Debit', 150.00, TO_DATE('2026-03-04 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 5, 5)
SELECT * FROM dual;
commit;

-- 16. Table: Captains_Earnings
INSERT ALL
    INTO Captains_Earnings (Captain_ID, Ref_Order_ID, Base_Pay, Bonus, Time_stamp) 
        VALUES (1, 1, 20.00, 5.00, TO_DATE('2026-03-01 15:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Captains_Earnings (Captain_ID, Ref_Order_ID, Base_Pay, Bonus, Time_stamp) 
        VALUES (2, 2, 18.00, 2.00, TO_DATE('2026-03-01 16:30:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Captains_Earnings (Captain_ID, Ref_Order_ID, Base_Pay, Bonus, Time_stamp) 
        VALUES (3, 3, 15.00, 10.00, TO_DATE('2026-03-02 14:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Captains_Earnings (Captain_ID, Ref_Order_ID, Base_Pay, Bonus, Time_stamp) 
        VALUES (4, 4, 30.00, 0.00, TO_DATE('2026-03-02 17:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Captains_Earnings (Captain_ID, Ref_Order_ID, Base_Pay, Bonus, Time_stamp) 
        VALUES (5, 5, 18.00, 5.00, TO_DATE('2026-03-02 20:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Captains_Earnings (Captain_ID, Ref_Order_ID, Base_Pay, Bonus, Time_stamp) 
        VALUES (1, 16, 20.00, 15.00, TO_DATE('2026-03-10 19:00:00', 'YYYY-MM-DD HH24:MI:SS'))
    INTO Captains_Earnings (Captain_ID, Ref_Order_ID, Base_Pay, Bonus, Time_stamp) 
        VALUES (2, 17, 18.00, 12.00, TO_DATE('2026-03-10 19:15:00', 'YYYY-MM-DD HH24:MI:SS'))
SELECT * FROM dual;
commit;

-- 17. Table: Item_Modifiers
INSERT ALL 
    INTO Item_Modifiers (Mod_ID, name, is_available, Price, item_ID) VALUES (1, 'Extra Garlic Dip', 1, 15.00, 1)
    INTO Item_Modifiers (Mod_ID, name, is_available, Price, item_ID) VALUES (2, 'Spicy Rice Upgrade', 1, 20.00, 1)
    INTO Item_Modifiers (Mod_ID, name, is_available, Price, item_ID) VALUES (3, 'Extra Cheese', 1, 40.00, 3)
    INTO Item_Modifiers (Mod_ID, name, is_available, Price, item_ID) VALUES (4, 'Thick Crust', 1, 30.00, 4)
    INTO Item_Modifiers (Mod_ID, name, is_available, Price, item_ID) VALUES (5, 'Add Caramelized Onion', 1, 25.00, 7)
    INTO Item_Modifiers (Mod_ID, name, is_available, Price, item_ID) VALUES (6, 'Double Patty', 1, 60.00, 7)
    INTO Item_Modifiers (Mod_ID, name, is_available, Price, item_ID) VALUES (7, 'Spicy Mayo', 1, 15.00, 12)
    INTO Item_Modifiers (Mod_ID, name, is_available, Price, item_ID) VALUES (8, 'Extra Sauce', 1, 10.00, 11)
SELECT * FROM dual;
commit;

-- 18. Table:Reviews
INSERT ALL 
    INTO Reviews (review_ID, Restaurant_rev, Items_rev, Captain_rev, Order_ID) 
        VALUES (1, 5, 5, 4, 1)
    INTO Reviews (review_ID, Restaurant_rev, Items_rev, Captain_rev, Order_ID) 
        VALUES (2, 4, 4, 5, 2)
    INTO Reviews (review_ID, Restaurant_rev, Items_rev, Captain_rev, Order_ID) 
        VALUES (3, 3, 5, 2, 3)
    INTO Reviews (review_ID, Restaurant_rev, Items_rev, Captain_rev, Order_ID) 
        VALUES (4, 5, 5, 5, 4)
    INTO Reviews (review_ID, Restaurant_rev, Items_rev, Captain_rev, Order_ID) 
        VALUES (5, 2, 3, 4, 5)
SELECT * FROM dual;
commit;

-- 19. Table: Order_Item_Modifiers
INSERT ALL 
    INTO Order_Item_Modifiers (Order_item_mod_ID, Mod_id, Price_At_Time) VALUES (1, 1, 15.00)
    INTO Order_Item_Modifiers (Order_item_mod_ID, Mod_id, Price_At_Time) VALUES (1, 2, 20.00)
    INTO Order_Item_Modifiers (Order_item_mod_ID, Mod_id, Price_At_Time) VALUES (2, 3, 40.00)
    INTO Order_Item_Modifiers (Order_item_mod_ID, Mod_id, Price_At_Time) VALUES (4, 5, 25.00)
SELECT * FROM dual;
commit;
 
```
### QUERIES
- The following SQL queries define the business logic for the Wagba platform.
- Each of the SQL queries targets a business need or a business feature that the platform requires to run effectively during the Ramadan season.
```SQL
-- 1. To view the restaurant kitchen screen of order that has id=15 and its status is in("accepted","preparing") and arranged ascendingly.
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
```




---
---
## The Investigation
### Step 1: Find the Crime Scene Report

**Objective** Locate the report about the stolen Fanoos from Al-Muizz Street around the time of the power outage.

**SQL Query**
```SQL
SELECT *
FROM crime_scene_reports 
WHERE location LIKE '%Muizz%' 
AND time BETWEEN '23:15' AND '23:20';
```
**Result**

| id | date | time | location | description |
|----|------|------|----------|-------------|
| 19 | 2026-02-16 | 23:15:00 | Al-Muizz Street | Theft occurred between 11:15 PM and 11:20 PM. Witness A saw a man carrying a large bag drop a receipt from "Sobia King" for 2 Sobia and 1 Kharoub before jumping into a White Hyundai Verna that sped away towards Salah Salem road. |

**Evidence Gathered**
-  Crime window: 11:15 PM - 11:20 PM
-  Receipt: From "Sobia King" for "2 Sobia and 1 Kharoub"
-  Vehicle: White Hyundai Verna
-  Escape route: Towards Salah Salem road

---

### Step 2: Find the Customer Phone from Sobia King Receipt

**Objective** Identify who purchased the specific order (2 Sobia, 1 Kharoub) mentioned by the witness.

**SQL Query**
```SQL
SELECT customer_phone
FROM sobia_king_sales 
WHERE order_details LIKE '%2 Sobia, 1 Kharoub%';
```
**Result**

| customer_phone |
|----------------|
| 010-9999-8888 |

**Evidence Gathered**
- Suspect's phone number: 010-9999-8888

---

### Step 3: Trace Phone Calls from the Suspect Number

**Objective** Find who the suspect called after the theft - likely an accomplice.

**SQL Query**
```SQL
SELECT * 
FROM phone_calls 
WHERE caller_number LIKE '%010-9999-8888%';
```
**Result**
| id | caller_number | receiver_number | duration_seconds | timestamp |
|----|---------------|-----------------|-------------------|-----------|
| 876 | 010-9999-8888 | 011-7777-6666 | 45 | 2026-02-16 23:18:00 |
**Evidence Gathered**
-  Accomplice's phone number: 011-7777-6666
-  Call duration: 45 seconds
-  Call time: 11:18 PM (3 minutes after the theft)

---

### Step 4: Find Vehicle Owner by Phone Number

**Objective** The accomplice likely owns or has access to the getaway vehicle. Find the license plate associated with the accomplice's phone.

**SQL Query**
```SQL
SELECT license_plate 
FROM vehicle_owners 
WHERE phone_number LIKE '%011-7777-6666%';
```
**Result**

| license_plate |
|---------------|
| أ ج د - 1234 |

**Evidence Gathered**
-  Vehicle license plate: أ ج د - 1234

---

### Step 5: Verify Vehicle on Traffic Cameras

**Objective** Confirm that this vehicle was seen on the escape route (Salah Salem road) around the time of the crime.

**SQL Query**
```SQL
SELECT * 
FROM traffic_cameras 
WHERE location LIKE '%Salah Salem%' 
  AND car_make LIKE '%Hyundai%' 
  AND car_color = 'White';
```
**Result**

 | license_plate | 
|---------------|
| هـ هـ د - 2551|
| أ ج د - 1234 |
| ن ج ن - 2562 |
| هـ ج ب - 6097 |
| د س ن - 2577 |
**Evidence Gathered:**
- Suspect vehicle confirmed on Salah Salem road at 11:22 PM
- Matches escape route and timeline (7 minutes after crime)

---

### Step 6: Identify the Vehicle Owner

**Objective** Get the name and national ID of the person who owns the getaway vehicle.

**SQL Query**
```SQL
SELECT owner_name,
national_id 
FROM vehicle_owners 
WHERE license_plate = 'أ ج د - 1234';
```
**Result**

| owner_name | national_id |
|------------|-------------|
| Sayed El-Tayer | 29011122233344 |

**Evidence Gathered**
-  Suspect name: Sayed El-Tayer
-  National ID: 29011122233344

---

### Step 7: Find the Train Ticket

**Objective** The suspects are trying to escape Cairo by train. Find Sayed El-Tayer's ticket information.

**SQL Query**
``` SQL
SELECT seat_number 
FROM ramses_station_tickets 
WHERE national_id = '29011122233344' 
AND passenger_name = 'Sayed El-Tayer';
```
**Result**

| seat_number |
|-------------|
| 14B | 

**Evidence Gathered**
-  Seat Number: 14B
-  Destination: Aswan
-  Departure Time: 6:30 AM
-  Train Number: 990

---

## Case Summary

| Evidence | Value |
|----------|-------|
| Crime Time | 11:15 PM - 11:20 PM |
| Receipt | 2 Sobia, 1 Kharoub from Sobia King |
| Suspect Phone | 010-9999-8888 |
| Accomplice Phone | 011-7777-6666 |
| License Plate | أ ج د - 1234 |
| Vehicle | White Hyundai Verna |
| Traffic Camera | Confirmed on Salah Salem at 11:22 PM |
| Suspect Name | Sayed El-Tayer |
| National ID | 29011122233344 |
| Train Number | 990 |
| Destination | Aswan |
| Departure | 6:30 AM |
| Seat Number | 14B |

---

## Final Answer
- THE THIEF IS: **Sayed El-Tayer**
- HE IS ESCAPING ON: **Train 990, Seat 14B**

---

## Complete SQL Code

 Al-Muizz Mystery Code
--- 

```SQL
SELECT * 
FROM crime_scene_reports 
WHERE location LIKE '%Muizz%' 
AND time BETWEEN '23:15' AND '23:20';

SELECT customer_phone 
FROM sobia_king_sales 
WHERE order_details LIKE '%2 Sobia, 1 Kharoub%';

SELECT * 
FROM phone_calls 
WHERE caller_number LIKE '%010-9999-8888%';

SELECT license_plate 
FROM vehicle_owners 
WHERE phone_number LIKE '%011-7777-6666%';


SELECT *
FROM traffic_cameras 
WHERE location LIKE '%Salah Salem%' 
AND car_make LIKE '%Hyundai%' 
AND car_color = 'White';


SELECT owner_name, national_id 
FROM vehicle_owners 
WHERE license_plate = 'أ ج د - 1234';


SELECT seat_number
FROM ramses_station_tickets 
WHERE national_id = '29011122233344' 
AND passenger_name = 'Sayed El-Tayer';
-- CASE STATUS : SOLVED 
```
---

