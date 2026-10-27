CREATE DATABASE sqlchallenge;
USE sqlchallenge;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    email VARCHAR(150),
    city VARCHAR(100),
    signup_date DATE,
    segment VARCHAR(50)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2),
    cost DECIMAL(10, 2)
);

DROP TABLE orders;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT PRIMARY KEY,
    order_date DATE,
    status VARCHAR(50),
    channel VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);



CREATE TABLE deliveries (
    delivery_id INT PRIMARY KEY,
    order_id INT,
    dispatch_date DATE,
    delivery_date DATE,
    delivery_status VARCHAR(50),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_method VARCHAR(50),
    payment_status VARCHAR(50),
    amount DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


