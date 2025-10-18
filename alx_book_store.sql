-- Create database
CREATE DATABASE IF NOT EXISTS alx_book_store
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

USE alx_book_store;

-- Authors table
CREATE TABLE Authors (
    author_id INT NOT NULL AUTO_INCREMENT,
    author_name VARCHAR(215) NOT NULL,
    PRIMARY KEY (author_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Books table
CREATE TABLE Books (
    book_id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(130) NOT NULL,
    author_id INT NOT NULL,
    price DOUBLE NOT NULL,
    publication_date DATE,
    PRIMARY KEY (book_id),
    INDEX idx_books_author (author_id),
    CONSTRAINT fk_books_author FOREIGN KEY (author_id) REFERENCES Authors(author_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Customers table
CREATE TABLE Customers (
    customer_id INT NOT NULL AUTO_INCREMENT,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215),
    address TEXT,
    PRIMARY KEY (customer_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Orders table
CREATE TABLE Orders (
    order_id INT NOT NULL AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date DATE,
    PRIMARY KEY (order_id),
    INDEX idx_orders_customer (customer_id),
    CONSTRAINT fk_orders_customer FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Order_Details table
CREATE TABLE Order_Details (
    orderdetailid INT NOT NULL AUTO_INCREMENT,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity DOUBLE NOT NULL,
    PRIMARY KEY (orderdetailid),
    INDEX idx_orderdetails_order (order_id),
    INDEX idx_orderdetails_book (book_id),
    CONSTRAINT fk_orderdetails_order FOREIGN KEY (order_id) REFERENCES Orders(order_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT fk_orderdetails_book FOREIGN KEY (book_id) REFERENCES Books(book_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
