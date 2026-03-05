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
    Amount DECIMAL(10, 2) check(Amount>0) not null,
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