-- Create database and use it
CREATE DATABASE food_delivery_system;
USE food_delivery_system;

-- Create tables
CREATE TABLE restaurants (
    restaurant_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(200),
    phone_number VARCHAR(15),
    cuisine_type VARCHAR(50),
    rating DECIMAL(2, 1) DEFAULT 0.0
);

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone_number VARCHAR(15),
    address VARCHAR(200),
    registration_date DATE DEFAULT CURRENT_DATE
);

CREATE TABLE delivery_persons (
    delivery_person_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    vehicle_type VARCHAR(50),
    available_status ENUM('Available', 'Busy') DEFAULT 'Available',
    rating DECIMAL(2, 1) DEFAULT 0.0
);

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    restaurant_id INT NOT NULL,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2) NOT NULL,
    delivery_status ENUM('Pending', 'Preparing', 'On the Way', 'Delivered', 'Cancelled') DEFAULT 'Pending',
    delivery_person_id INT,
    FOREIGN KEY (customer_id

INSERT INTO restaurants (name, address, phone_number, cuisine_type, rating) VALUES
('Spicy Villa', 'MG Road, Bangalore', '080-1234567', 'Indian', 4.6),
('Pizza Hub', 'Andheri, Mumbai', '022-2345678', 'Italian', 4.8),
('Dragon Wok', 'Sector 18, Noida', '0120-3456789', 'Chinese', 4.5),
('The Biryani Palace', 'Banjara Hills, Hyderabad', '040-4567890', 'Indian', 4.7),
('Ocean Bites', 'Marine Drive, Mumbai', '022-5678901', 'Seafood', 4.3),
('Taco Corner', 'Connaught Place, Delhi', '011-6789012', 'Mexican', 4.4),
('Curry Kingdom', 'Park Street, Kolkata', '033-7890123', 'Indian', 4.8),
('Green Bowl', 'Adyar, Chennai', '044-8901234', 'Vegan', 4.5),
('Grill Master', 'MG Road, Pune', '020-9012345', 'Barbecue', 4.7),
('Fusion Fiesta', 'Baga Beach, Goa', '0832-0123456', 'Fusion', 4.6);

INSERT INTO customers (name, email, phone_number, address, registration_date) VALUES
('Rahul Sharma', 'rahul.sharma@example.com', '9876543210', 'Koramangala, Bangalore', '2024-01-01'),
('Anjali Gupta', 'anjali.gupta@example.com', '9876543211', 'Powai, Mumbai', '2024-01-02'),
('Ravi Kumar', 'ravi.kumar@example.com', '9876543212', 'Sector 62, Noida', '2024-01-03'),
('Sita Patel', 'sita.patel@example.com', '9876543213', 'Banjara Hills, Hyderabad', '2024-01-04'),
('Arjun Nair', 'arjun.nair@example.com', '9876543214', 'Marine Drive, Mumbai', '2024-01-05'),
('Priya Das', 'priya.das@example.com', '9876543215', 'Connaught Place, Delhi', '2024-01-06'),
('Kunal Roy', 'kunal.roy@example.com', '9876543216', 'Park Street, Kolkata', '2024-01-07'),
('Meera Iyer', 'meera.iyer@example.com', '9876543217', 'Adyar, Chennai', '2024-01-08'),
('Amit Singh', 'amit.singh@example.com', '9876543218', 'MG Road, Pune', '2024-01-09'),
('Sneha Kaur', 'sneha.kaur@example.com', '9876543219', 'Baga Beach, Goa', '2024-01-10');

INSERT INTO delivery_persons (name, phone_number, vehicle_type, available_status, rating) VALUES
('Ramesh Kumar', '9871234560', 'Bike', 'Available', 4.5),
('Sita Reddy', '9871234561', 'Scooter', 'Busy', 4.6),
('Vijay Rao', '9871234562', 'Car', 'Available', 4.8),
('Sunita Gupta', '9871234563', 'Bike', 'Busy', 4.4),
('Ajay Verma', '9871234564', 'Scooter', 'Available', 4.7),
('Meena Das', '9871234565', 'Car', 'Busy', 4.5),
('Kunal Nair', '9871234566', 'Bike', 'Available', 4.8),
('Anita Roy', '9871234567', 'Scooter', 'Busy', 4.6),
('Rahul Bhatia', '9871234568', 'Car', 'Available', 4.7),
('Sneha Iyer', '9871234569', 'Bike', 'Busy', 4.5);

INSERT INTO orders (customer_id, restaurant_id, order_date, total_amount, delivery_status, delivery_person_id) VALUES
(1, 2, '2024-01-01 12:30:00', 500.00, 'Delivered', 1),
(2, 3, '2024-01-02 13:15:00', 750.00, 'On the Way', 2),
(3, 1, '2024-01-03 18:45:00', 300.00, 'Preparing', 3),
(4, 4, '2024-01-04 19:30:00', 600.00, 'Cancelled', NULL),
(5, 5, '2024-01-05 20:00:00', 850.00, 'Delivered', 4),
(6, 6, '2024-01-06 21:15:00', 450.00, 'On the Way', 5),
(7, 7, '2024-01-07 11:30:00', 700.00, 'Preparing', 6),
(8, 8, '2024-01-08 14:45:00', 550.

-- ALTER TABLE: Add a new column
ALTER TABLE customers ADD COLUMN loyalty_points INT DEFAULT 0;

-- DROP TABLE
DROP TABLE orders;

-- TRUNCATE TABLE
TRUNCATE TABLE restaurants;

-- GRANT: Grant permissions to a user
GRANT SELECT, INSERT ON food_delivery_system.* TO 'user'@'localhost';

-- REVOKE: Revoke permissions from a user
REVOKE INSERT ON food_delivery_system.* FROM 'user'@'localhost';

-- COMMIT & ROLLBACK
START TRANSACTION;
INSERT INTO customers (name, email, phone_number) VALUES ('Test User', 'test@example.com', '555-1234');
ROLLBACK;

-- RENAME TABLE
RENAME TABLE delivery_persons TO delivery_agents;

-- INSERT
INSERT INTO restaurants (name, address, cuisine_type) VALUES ('Test Restaurant', 'Test Address', 'Indian');

-- UPDATE
UPDATE customers SET loyalty_points = 100 WHERE customer_id = 1;

-- DELETE
DELETE FROM restaurants WHERE restaurant_id = 5;

-- SELECT
SELECT * FROM restaurants;

-- WHERE clause
SELECT * FROM restaurants WHERE rating > 4.5;

-- GROUP BY and HAVING
SELECT cuisine_type, COUNT(*) AS total_restaurants
FROM restaurants
GROUP BY cuisine_type
HAVING total_restaurants > 2;

-- ORDER BY
SELECT * FROM customers ORDER BY registration_date DESC;

-- AND, OR
SELECT * FROM orders WHERE total_amount > 500 AND delivery_status = 'Delivered';

-- LIKE, NOT LIKE
SELECT * FROM customers WHERE name LIKE 'A%';
SELECT * FROM customers WHERE name NOT LIKE 'B%';

-- IN, NOT IN
SELECT * FROM restaurants WHERE cuisine_type IN ('Indian', 'Chinese');
SELECT * FROM restaurants WHERE cuisine_type NOT IN ('Mexican');

-- BETWEEN
SELECT * FROM orders WHERE total_amount BETWEEN 200 AND 800;

-- EXISTS
SELECT * FROM customers WHERE EXISTS (
    SELECT 1 FROM orders WHERE orders.customer_id = customers.customer_id
);

-- INNER JOIN
SELECT o.order_id, c.name AS customer_name, r.name AS restaurant_name
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
INNER JOIN restaurants r ON o.restaurant_id = r.restaurant_id;

-- LEFT JOIN
SELECT c.name, o.total_amount
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;

-- RIGHT JOIN
SELECT r.name, o.total_amount
FROM restaurants r
RIGHT JOIN orders o ON r.restaurant_id = o.restaurant_id;

-- CROSS JOIN
SELECT c.name, r.name
FROM customers c
CROSS JOIN restaurants r;

-- SUM
SELECT SUM(total_amount) AS total_revenue FROM orders;

-- AVG
SELECT AVG(rating) AS average_rating FROM restaurants;

-- MIN, MAX
SELECT MIN(total_amount) AS smallest_order, MAX(total_amount) AS largest_order FROM orders;

-- COUNT
SELECT COUNT(*) AS total_customers FROM customers;

-- Uppercase and Lowercase
SELECT UPPER(name), LOWER(name) FROM customers;

-- LTRIM, RTRIM
SELECT LTRIM(name), RTRIM(name) FROM customers;

-- DATE and CURDATE
SELECT order_date, CURDATE() AS current_date FROM orders;

-- LENGTH
SELECT LENGTH(name) AS name_length FROM customers;

-- INSERT Trigger (Before Insert)
DELIMITER //
CREATE TRIGGER before_order_insert
BEFORE INSERT ON orders
FOR EACH ROW
BEGIN
    IF NEW.total_amount < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Total amount cannot be negative';
    END IF;
END;
//
DELIMITER ;

-- DELETE Trigger (After Delete)
DELIMITER //
CREATE TRIGGER after_customer_delete
AFTER DELETE ON customers
FOR EACH ROW
BEGIN
    INSERT INTO deleted_customers_log (customer_id, deleted_at)
    VALUES (OLD.customer_id, NOW());
END;
//
DELIMITER ;

-- UPDATE Trigger (Before Update)
DELIMITER //
CREATE TRIGGER before_order_update
BEFORE UPDATE ON orders
FOR EACH ROW
BEGIN
    IF NEW.delivery_status = 'Cancelled' THEN
        SET NEW.total_amount = 0;
    END IF;
END;
//
DELIMITER ;
