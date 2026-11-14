-- =========================================================
-- WEEK 1 MYSQL DATABASE ASSIGNMENT
-- Project: Kakuma Markets Hub
-- Description: A database for managing businesses, products,
-- customers, and orders in an online marketplace.
-- =========================================================

-- 1. Create a new database
CREATE DATABASE kakuma_markets_hub;

-- 2. Display all available databases
SHOW DATABASES;

-- 3. Select the database to use
USE kakuma_markets_hub;

-- 4. Create a table to store business information
CREATE TABLE businesses (
    business_id INT AUTO_INCREMENT PRIMARY KEY,
    business_name VARCHAR(100) NOT NULL,
    owner_name VARCHAR(100) NOT NULL,
    phone_number VARCHAR(20),
    location VARCHAR(100)
);

-- 5. Create a table for product categories
CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL
);

-- 6. Create a table to store products
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    business_id INT NOT NULL,
    category_id INT NOT NULL,
    FOREIGN KEY (business_id) REFERENCES businesses(business_id),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- 7. Create a table to store customer information
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    phone_number VARCHAR(20),
    location VARCHAR(100)
);

-- 8. Create a table to store customer orders
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    order_status VARCHAR(30) DEFAULT 'Pending',
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- 9. Create a table for the products included in each order
CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- 10. Insert sample business records
INSERT INTO businesses (business_name, owner_name, phone_number, location)
VALUES
('Emmanuel Fashion Store', 'Emmanuel', '0712345678', 'Kakuma Refugee Camp'),
('Kakuma Electronics', 'James', '0723456789', 'Kakuma Town');

-- 11. Insert sample product categories
INSERT INTO categories (category_name)
VALUES
('Clothing'),
('Electronics'),
('Footwear');

-- 12. Insert sample products
INSERT INTO products (product_name, description, price, business_id, category_id)
VALUES
('Men T-Shirt', 'Cotton casual T-shirt', 500.00, 1, 1),
('Smartphone', 'Android smartphone', 12000.00, 2, 2),
('Sports Shoes', 'Comfortable everyday shoes', 1800.00, 1, 3);

-- 13. Insert sample customers
INSERT INTO customers (customer_name, phone_number, location)
VALUES
('Peter John', '0734567890', 'Kakuma 1'),
('Mary James', '0745678901', 'Kakuma 2');

-- 14. Insert sample orders
INSERT INTO orders (customer_id, order_date, order_status)
VALUES
(1, '2026-11-14', 'Pending'),
(2, '2026-11-14', 'Completed');

-- 15. Insert sample order items
INSERT INTO order_items (order_id, product_id, quantity, unit_price)
VALUES
(1, 1, 2, 500.00),
(2, 2, 1, 12000.00);

-- 16. Display all tables in the selected database
SHOW TABLES;

-- 17. View the structure of the products table
DESCRIBE products;

-- 18. View all businesses
SELECT * FROM businesses;

-- 19. View all products
SELECT * FROM products;

-- 20. View all customers
SELECT * FROM customers;

-- 21. View all orders
SELECT * FROM orders;
