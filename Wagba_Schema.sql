-- ==========================================================
-- WAGBA DATABASE SYSTEM 
-- ==========================================================

-- 1. Table: Customer
CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL
);

-- 2. Table: Restaurants
CREATE TABLE Restaurants (
    Restaurant_ID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL
);

-- 3. Table: Captains
CREATE TABLE Captains (
    Captain_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Vehicle_details VARCHAR(50),
    Current_Status VARCHAR(50)
);

-- 4. Table: Surge_Rules
CREATE TABLE Surge_Rules (
    Rule_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Start_Time DATETIME,
    End_Time DATETIME,
    Multiplier DECIMAL(5, 2),
    Is_Active BOOLEAN DEFAULT TRUE,
    CONSTRAINT Mul_chk CHECK (Multiplier > 0)
);

-- 5. Table: Promocodes
CREATE TABLE Promocodes (
    Promo_ID INT PRIMARY KEY,
    Code VARCHAR(50) UNIQUE NOT NULL,
    Expiration_date DATETIME,
    Usage_limit_per_user INT,
    Global_Usage_limit INT,
    Discount_value DECIMAL(10, 2) NOT NULL CHECK (Discount_value >= 0),
    Is_percentage BOOLEAN DEFAULT FALSE
);

-- 6. Table: Charity
CREATE TABLE Charity (
    Charity_ID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Street VARCHAR(50),
    Building VARCHAR(50),
    GPS_Long DECIMAL(11, 8),
    GPS_lat DECIMAL(10, 8),
    CONSTRAINT CHK_LONG_CHAR CHECK (GPS_Long BETWEEN 25.0 AND 37.0),
    CONSTRAINT CHK_LAT_CHAR CHECK (GPS_lat BETWEEN 22.0 AND 32.0)
);

-- 7. Table: Phone_Cus
CREATE TABLE Phone_Cus (
    Phone_ID INT PRIMARY KEY,
    Phone VARCHAR(20) NOT NULL,
    Cus_ID INT NOT NULL,
    CONSTRAINT fk_phone_cus FOREIGN KEY (Cus_ID) REFERENCES Customer(Customer_ID) ON DELETE CASCADE
);

-- 8. Table: Cus_Addresses
CREATE TABLE Cus_Addresses (
    Add_ID INT PRIMARY KEY,
    Home_Work VARCHAR(50),
    Street VARCHAR(50),
    Building VARCHAR(50),
    Floor VARCHAR(50),
    GPS_Long DECIMAL(11, 8),
    GPS_lat DECIMAL(10, 8),
    Cus_ID INT NOT NULL,
    CONSTRAINT CHK_LONG CHECK (GPS_Long BETWEEN 25.0 AND 37.0),
    CONSTRAINT CHK_lat CHECK (GPS_lat BETWEEN 22.0 AND 32.0),
    CONSTRAINT fk_addr_cus FOREIGN KEY (Cus_ID) REFERENCES Customer(Customer_ID)
);

-- 9. Table: Branches
CREATE TABLE Branches (
    Branch_ID INT PRIMARY KEY,
    Delivery_Zones VARCHAR(50),
    Operating_hours VARCHAR(50),
    Restaurant_ID INT NOT NULL,
    CONSTRAINT fk_branch_res FOREIGN KEY (Restaurant_ID) REFERENCES Restaurants(Restaurant_ID)
);

-- 10. Table: Count_Promo_Usage
CREATE TABLE Count_Promo_Usage (
    Cus_ID INT NOT NULL,
    Promo_ID INT NOT NULL,
    Count_Usage INT DEFAULT 0,
    PRIMARY KEY (Cus_ID, Promo_ID),
    CONSTRAINT fk_promo_cus FOREIGN KEY (Cus_ID) REFERENCES Customer(Customer_ID),
    CONSTRAINT fk_promo_id FOREIGN KEY (Promo_ID) REFERENCES Promocodes(Promo_ID)
);

-- 11. Table: Categories
CREATE TABLE Categories (
    Cat_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Branch_ID INT NOT NULL,
    CONSTRAINT fk_cat_branch FOREIGN KEY (Branch_ID) REFERENCES Branches(Branch_ID)
);

-- 12. Table: Orders
CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Sch_del_time DATETIME,
    Is_donation BOOLEAN DEFAULT FALSE,
    Status VARCHAR(50) NOT NULL,
    Payment_Type VARCHAR(50) NOT NULL,
    Del_Fees DECIMAL(10, 2) DEFAULT 0 CHECK (Del_Fees >= 0),
    Rule_ID INT,
    Cus_ID INT NOT NULL,
    Branch_ID INT NOT NULL,
    Captain_ID INT,
    Address_ID INT,
    Charity_ID INT,
    CONSTRAINT staut_chk CHECK (Status IN ('Pending', 'Accepted', 'Preparing', 'Out for Delivery', 'Delivered', 'Cancelled')),
    CONSTRAINT pay_chk CHECK (Payment_Type IN ('Cash', 'Credit Card', 'Wallet')),
    CONSTRAINT fk_order_rule FOREIGN KEY (Rule_ID) REFERENCES Surge_Rules(Rule_ID),
    CONSTRAINT fk_order_cus FOREIGN KEY (Cus_ID) REFERENCES Customer(Customer_ID),
    CONSTRAINT fk_order_branch FOREIGN KEY (Branch_ID) REFERENCES Branches(Branch_ID),
    CONSTRAINT fk_order_cap FOREIGN KEY (Captain_ID) REFERENCES Captains(Captain_ID),
    CONSTRAINT fk_order_addr FOREIGN KEY (Address_ID) REFERENCES Cus_Addresses(Add_ID),
    CONSTRAINT fk_order_charity FOREIGN KEY (Charity_ID) REFERENCES Charity(Charity_ID)
);

-- 13. Table: Items
CREATE TABLE Items (
    Item_ID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Is_available BOOLEAN DEFAULT TRUE,
    Price DECIMAL(10, 2) NOT NULL CHECK (Price >= 0),
    Cat_ID INT NOT NULL,
    CONSTRAINT fk_item_cat FOREIGN KEY (Cat_ID) REFERENCES Categories(Cat_ID)
);

-- 14. Table: Order_Items
CREATE TABLE Order_Items (
    Order_Item_ID INT PRIMARY KEY,
    Sold_Price DECIMAL(10, 2) NOT NULL CHECK (Sold_Price > 0),
    Quantity INT NOT NULL CHECK (Quantity > 0),
    Item_ID INT NOT NULL,
    Order_ID INT NOT NULL,
    CONSTRAINT fk_oi_item FOREIGN KEY (Item_ID) REFERENCES Items(Item_ID),
    CONSTRAINT fk_oi_order FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
);

-- 15. Table: Wallet_Ledger
CREATE TABLE Wallet_Ledger (
    Ledger_ID INT PRIMARY KEY,
    Transaction_type VARCHAR(50) NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL CHECK (Amount > 0),
    Transaction_Date DATETIME DEFAULT CURRENT_TIMESTAMP,
    Ref_Order_ID INT NULL,
    Cus_ID INT NOT NULL,
    CONSTRAINT TRA_chk CHECK (Transaction_type IN ('Credit', 'Debit')),
    CONSTRAINT fk_wallet_order FOREIGN KEY (Ref_Order_ID) REFERENCES Orders(Order_ID),
    CONSTRAINT fk_wallet_cus FOREIGN KEY (Cus_ID) REFERENCES Customer(Customer_ID)
);

-- 16. Table: Captains_Earnings
CREATE TABLE Captains_Earnings (
    Captain_ID INT NOT NULL,
    Ref_Order_ID INT NOT NULL,
    Base_Pay DECIMAL(10, 2),
    Bonus DECIMAL(10, 2),
    Time_stamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (Captain_ID, Ref_Order_ID),
    CONSTRAINT Base_CHK CHECK (Base_Pay >= 0),
    CONSTRAINT Bon_CHK CHECK (Bonus >= 0),
    CONSTRAINT fk_earn_cap FOREIGN KEY (Captain_ID) REFERENCES Captains(Captain_ID),
    CONSTRAINT fk_earn_order FOREIGN KEY (Ref_Order_ID) REFERENCES Orders(Order_ID)
);

-- 17. Table: Item_Modifiers
CREATE TABLE Item_Modifiers (
    Mod_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Is_available BOOLEAN DEFAULT TRUE,
    Price DECIMAL(10, 2) NOT NULL CHECK (Price >= 0),
    Item_ID INT NOT NULL,
    CONSTRAINT fk_mod_item FOREIGN KEY (Item_ID) REFERENCES Items(Item_ID)
);

-- 18. Table: Reviews
CREATE TABLE Reviews (
    Review_ID INT PRIMARY KEY,
    Restaurant_rev INT,
    Items_rev INT,
    Captain_rev INT,
    Comment_Rev TEXT,
    Order_ID INT,
    CONSTRAINT res_rev_chk CHECK (Restaurant_rev BETWEEN 1 AND 5),
    CONSTRAINT itm_rev_chk CHECK (Items_rev BETWEEN 1 AND 5),
    CONSTRAINT cap_rev_chk CHECK (Captain_rev BETWEEN 1 AND 5),
    CONSTRAINT fk_rev_order FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
);

-- 19. Table: Order_Item_Modifiers
CREATE TABLE Order_Item_Modifiers (
    Order_item_mod_ID INT NOT NULL,
    Mod_id INT NOT NULL,
    Price_At_Time DECIMAL(10, 2) NOT NULL CHECK (Price_At_Time >= 0),
    PRIMARY KEY (Order_item_mod_ID, Mod_id),
    CONSTRAINT fk_oim_item FOREIGN KEY (Order_item_mod_ID) REFERENCES Order_Items(Order_Item_ID),
    CONSTRAINT fk_oim_mod FOREIGN KEY (Mod_id) REFERENCES Item_Modifiers(Mod_ID)
);