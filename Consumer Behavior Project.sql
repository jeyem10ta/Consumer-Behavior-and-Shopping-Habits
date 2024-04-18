-- Create the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS Consumer_Behavior;

-- Use the database
USE Consumer_Behavior;

-- Customers Table
CREATE TABLE IF NOT EXISTS Customers (
    CustomerID INT NOT NULL AUTO_INCREMENT,
    Age INT,
    Gender VARCHAR(10),
    Location VARCHAR(100),
    SubscriptionStatus VARCHAR(20),
    FrequencyOfPurchases VARCHAR(20),
    PRIMARY KEY (CustomerID)
);

-- Purchases Table
CREATE TABLE IF NOT EXISTS Purchases (
    PurchaseID INT NOT NULL AUTO_INCREMENT,
    CustomerID INT,
    ItemPurchased VARCHAR(100),
    Category VARCHAR(50),
    PurchaseAmount DECIMAL(10,2),
    ReviewRating DECIMAL(3,1),
    ShippingType VARCHAR(20),
    DiscountApplied VARCHAR(10),
    PromoCodeUsed VARCHAR(20),
    PaymentMethod VARCHAR(20),
    DateOfPurchase DATE,
    PRIMARY KEY (PurchaseID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Products Table
CREATE TABLE IF NOT EXISTS Products (
    ProductID INT NOT NULL AUTO_INCREMENT,
    ItemPurchased VARCHAR(100),
    Category VARCHAR(50),
    Size VARCHAR(20),
    Color VARCHAR(20),
    Season VARCHAR(20),
    PRIMARY KEY (ProductID)
);

-- Previous Purchases Table
CREATE TABLE IF NOT EXISTS PreviousPurchases (
    PreviousPurchaseID INT NOT NULL AUTO_INCREMENT,
    CustomerID INT,
    ItemPurchased VARCHAR(100),
    DateOfPurchase DATE,
    PRIMARY KEY (PreviousPurchaseID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
