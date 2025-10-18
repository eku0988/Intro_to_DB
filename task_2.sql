-- TASK 2: Create all tables for alx_book_store

-- Ensure the database exists and use it
CREATE DATABASE IF NOT EXISTS alx_book_store;
USE alx_book_store;

-- Drop tables if they exist (to avoid errors when re-running the script)
DROP TABLE IF EXISTS order_details;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS authors;
DROP TABLE IF EXISTS customers;

-- ===========================
-- AUTHORS TABLE
-- ===========================
CREATE TABLE AUTHORS (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    country VARCHAR(100)
);

-- ===========================
-- BOOKS TABLE
-- ===========================
CREATE TABLE BOOKS (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    author_id INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT DEFAULT 0,
    FOREIGN KEY (author_id) REFERENCES AUTHORS(author_id)
);

-- ===========================
-- CUSTOMERS TABLE
-- ===========================
CREATE TABLE CUSTOMERS (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    address VARCHAR(255)
);

-- ===========================
-- ORDERS TABLE
-- ===========================
CREATE TABLE ORDERS (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2) DEFAULT 0.00,
    FOREIGN KEY (customer_id) REFERENCES CUSTOMERS(customer_id)
);

-- ===========================
-- ORDER_DETAILS TABLE
-- ===========================
CREATE TABLE ORDER_DETAILS (
    order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity INT NOT NULL,
    subtotal DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES ORDERS(order_id),
    FOREIGN KEY (book_id) REFERENCES BOOKS(book_id)
);
