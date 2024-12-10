create database churn;
use churn;

CREATE TABLE Location (
    location_id VARCHAR(50) PRIMARY KEY,
    location_name VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL
);



CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100) NOT NULL,
    customer_surname VARCHAR(100) NOT NULL,
    gender VARCHAR(10),
    age INT,
    location_id VARCHAR(50)
    );

-- Alter the table to add the foreign key
ALTER TABLE Customers
ADD CONSTRAINT fk_location
FOREIGN KEY (location_id) REFERENCES Location(location_id);


CREATE TABLE Products (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    product_category VARCHAR(100) NOT NULL
);


CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    transaction_date DATE,
    transaction_amount DECIMAL(10,2),
    category_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (category_id) REFERENCES Products(category_id)
);

CREATE TABLE PremiumPlans (
    plan_id INT PRIMARY KEY AUTO_INCREMENT,
    plan_name VARCHAR(100) NOT NULL,
    monthly_cost DECIMAL(10,2) NOT NULL,
    annual_cost DECIMAL(10,2) NOT NULL);
    
CREATE TABLE PlanUsers (
    customer_id INT,
    plan_id INT,
    plan_start_date DATE NOT NULL,
    plan_end_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (plan_id) REFERENCES PremiumPlans(plan_id)
); 

INSERT INTO Customers (customer_name, customer_surname, gender, age, location_id) VALUES
('John', 'Doe', 'Male', 34, '1UK'),
('Jane', 'Smith', 'Female', 28, '2UK'),
('Michael', 'Johnson', 'Male', 42, '3UK'),
('Emily', 'Davis', 'Female', 25, '4UK'),
('Chris', 'Brown', 'Male', 30, '1UK'),
('Jessica', 'Wilson', 'Female', 37, '5UK'),
('David', 'Taylor', 'Male', 45, '2UK'),
('Sophia', 'Anderson', 'Female', 29, '9UK'),
('James', 'Thomas', 'Male', 33, '4UK'),
('Linda', 'Martinez', 'Female', 31, '5UK'),
('Robert', 'Hernandez', 'Male', 40, '1UK'),
('Sarah', 'Moore', 'Female', 66, '2UK'),
('Daniel', 'Martin', 'Male', 38, '3UK'),
('Olivia', 'Garcia', 'Female', 27, '4UK'),
('Paul', 'Jackson', 'Male', 32, '5UK');

INSERT INTO Location (location_id, location_name, country, city) VALUES
('1UK', 'Headquarters', 'UK', 'London'),
('2UK', 'Regional Office', 'UK', 'Manchester'),
('3UK', 'Warehouse', 'UK', 'Birmingham'),
('4UK', 'Branch Office', 'UK', 'Liverpool'),
('5UK', 'Customer Support Center', 'UK', 'Leeds'),
('6UK', 'Sales Office', 'UK', 'Sheffield'),
('7UK', 'Manufacturing Plant', 'UK', 'Nottingham'),
('8UK', 'Distribution Center', 'UK', 'Glasgow'),
('9UK', 'Research Lab', 'UK', 'Edinburgh'),
('10UK', 'Marketing Office', 'UK', 'Bristol'),
('11UK', 'Technical Support', 'UK', 'Newcastle'),
('12UK', 'Logistics Hub', 'UK', 'Cardiff'),
('13UK', 'Design Studio', 'UK', 'Belfast'),
('14UK', 'Innovation Center', 'UK', 'Aberdeen'),
('15UK', 'Training Facility', 'UK', 'Southampton');

INSERT INTO Products (product_category) VALUES
('Clothing'),
('Accessories'),
('Footwear');

INSERT INTO PremiumPlans (plan_name, monthly_cost, annual_cost) VALUES
('Free Plan', 0.00, 0.00),
('Standard Plan', 8.99, 89.99),
('Premium Plan', 12.99, 129.99);

INSERT INTO PlanUsers (customer_id, plan_id, plan_start_date, plan_end_date) VALUES
(1, 1, '2024-01-01', NULL),# NULL end_date indicates an ongoing subscription
(2, 2, '2024-06-01', NULL),
(3, 3, '2024-03-15', NULL), 
(4, 1, '2024-02-01', NULL),
(5, 2, '2024-01-11', '2025-06-30'),
(5, 1, '2024-01-11', NULL),
(6, 3, '2024-05-01', NULL),
(7, 1, '2024-01-15', '2024-07-15'),
(7, 3, '2024-01-15', NULL),
(8, 1, '2024-04-01', '2024-06-30'),
(9, 2, '2024-08-01', NULL),
(10, 3, '2024-02-15', NULL),
(11, 1, '2024-05-01', '2024-07-24'),
(12, 1, '2024-01-01', '2024-05-06'),
(13, 2, '2024-03-01', '2024-08-28'),
(14, 3, '2024-06-01', NULL),
(15, 1, '2024-07-01', NULL);


INSERT INTO Transactions (customer_id, transaction_date, transaction_amount, category_id) VALUES
(1, '2024-07-05', 49.99, 1), 
(1, '2024-07-20', 19.99, 1), 
(2, '2024-06-15', 59.99, 1), 
(2, '2024-07-05', 79.99, 2), 
(2, '2024-08-10', 25.99, 1), 
(3, '2024-06-20', 79.99, 2), 
(3, '2024-06-25', 49.99, 3), 
(3, '2024-07-10', 34.99, 3),
(3, '2024-08-02', 59.99, 3), 
(4, '2024-05-10', 25.99, 1),
(4, '2024-05-25', 44.99, 3), 
(4, '2024-06-10', 19.99, 3), 
(4, '2024-07-15', 34.99, 3), 
(5, '2024-04-25', 69.99, 1), 
(6, '2024-05-15', 19.99, 1),
(6, '2024-06-05', 55.99, 1),
(6, '2024-07-10', 34.99, 1),
(7, '2024-07-25', 39.99, 1), 
(7, '2024-06-10', 59.99, 1),
(8, '2024-06-10', 34.99, 2),
(8, '2024-07-20', 19.99, 2), 
(8, '2024-08-01', 29.99, 2), 
(9, '2024-05-18', 29.99, 2),
(9, '2024-07-05', 79.99, 1), 
(10, '2024-07-01', 89.99, 2), 
(10, '2024-08-15', 34.99, 2), 
(10, '2024-09-01', 49.99, 2), 
(10, '2024-04-01', 199.99, 2), 
(11, '2024-06-05', 39.99, 2), 
(11, '2024-07-05', 69.99, 2), 
(12, '2024-05-22', 55.99, 1), 
(12, '2024-06-10', 49.99, 1), 
(13, '2024-04-10', 44.99, 1), 
(13, '2024-05-15', 19.99, 1), 
(13, '2024-06-25', 69.99, 1), 
(14, '2024-07-10', 59.99, 1),
(14, '2024-08-05', 19.99, 2), 
(14, '2024-09-10', 29.99, 2), 
(15, '2024-06-20', 99.99, 1), 
(15, '2024-07-01', 25.99, 1), 
(15, '2024-08-15', 49.99, 2);


-- 1. Create a view to check customers who made purchases more then 60 days ago

CREATE OR REPLACE VIEW vw_purchases_older_than_60_days AS
SELECT 
    T.customer_id, 
    MAX(T.transaction_date) AS last_transaction_date, 
    C.location_id, 
    L.city
FROM 
    Transactions T
JOIN 
    Customers C ON T.customer_id = C.customer_id
JOIN 
    Location L ON C.location_id = L.location_id
GROUP BY 
    T.customer_id
HAVING 
    MAX(T.transaction_date) < CURDATE() - INTERVAL 60 DAY
ORDER BY 
    T.customer_id;
    
-- Call vw_purchases_older_than_60_days
SELECT * FROM vw_purchases_older_than_60_days;

-- 2a. Calculate Customer Churn Percentage
SELECT 
    (COUNT(DISTINCT vw.customer_id) / (SELECT COUNT(DISTINCT customer_id) FROM Customers)) * 100 AS churned_percentage
FROM  
    vw_purchases_older_than_60_days vw;
    
    
-- 2.b Show cities with the count of customers who have not made a purchase in the last 60 days

SELECT 
    L.city,
    COUNT(DISTINCT vw.customer_id) AS customer_count
FROM 
    vw_purchases_older_than_60_days vw
JOIN 
    Location L ON vw.location_id = L.location_id
GROUP BY 
    L.city
ORDER BY customer_count DESC;

    
-- 3. Classify transaction amounts into 'High', 'Medium', or 'Low'.
SELECT 
    CASE 
        WHEN transaction_amount > 100 THEN 'High'
        WHEN transaction_amount BETWEEN 50 AND 100 THEN 'Medium'
        ELSE 'Low'
    END AS amount_category,
    COUNT(*) AS number_of_transactions -- Counts the number of transactions in each category.
FROM 
    Transactions
GROUP BY 
    amount_category
ORDER BY 
    amount_category;

    
-- 4. Check all customers with Specific Purchase Category
DELIMITER //

CREATE PROCEDURE GetCustomersByPurchaseCategory(
    IN p_category_id INT
)
BEGIN
    SELECT 
        DISTINCT c.customer_id,
        c.customer_name,
        c.customer_surname
    FROM 
        Customers c
    JOIN 
        Transactions t ON c.customer_id = t.customer_id
    WHERE 
        t.category_id = p_category_id;
END //

DELIMITER ;

-- call GetCustomersByPurchaseCategory

CALL GetCustomersByPurchaseCategory(2);


-- 5. Create a function to calculate the total spend for a customer:
#DROP FUNCTION IF EXISTS GetTotalSpend;

DELIMITER //

CREATE FUNCTION GetTotalSpend(p_customer_id INT)
RETURNS DECIMAL(10, 2)
DETERMINISTIC -- Function depends only on the input and not on the database state
READS SQL DATA -- Specifies that this function reads data from tables but doesn’t modify them
BEGIN
    DECLARE total DECIMAL(10, 2) DEFAULT 0;
       
    SELECT COALESCE(SUM(transaction_amount), 0) # returning 0 if no transactions exist
    INTO total
    FROM Transactions
    WHERE customer_id = p_customer_id;
    
    RETURN total;
END //

DELIMITER ;

-- Call GetTotalSpend
SELECT GetTotalSpend(1) ;


-- 















