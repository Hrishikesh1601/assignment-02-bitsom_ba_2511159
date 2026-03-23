
CREATE DATABASE datawarehouse_db;
USE datawarehouse_db;


CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    full_date DATE NOT NULL,
    month INT NOT NULL,
    year INT NOT NULL
);

CREATE TABLE dim_store (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL
);

CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL
);



CREATE TABLE fact_sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    date_id INT NOT NULL,
    store_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    revenue DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);

INSERT INTO dim_date VALUES
(1,'2024-01-01',1,2024),
(2,'2024-01-02',1,2024),
(3,'2024-02-01',2,2024),
(4,'2024-02-05',2,2024),
(5,'2024-03-01',3,2024);

INSERT INTO dim_store VALUES
(1,'Mumbai Store','Mumbai'),
(2,'Pune Store','Pune'),
(3,'Delhi Store','Delhi');

INSERT INTO dim_product VALUES
(101,'Smart TV','Electronics'),
(102,'Laptop','Electronics'),
(103,'T-Shirt','Clothing'),
(104,'Jeans','Clothing'),
(105,'Milk','Groceries');

INSERT INTO fact_sales (date_id,store_id,product_id,quantity,revenue) VALUES
(1,1,101,1,45000),
(1,2,103,2,2000),
(2,1,105,5,300),
(2,2,102,1,55000),
(3,1,104,2,4000),
(3,3,105,10,600),
(4,2,101,1,45000),
(4,3,103,3,3000),
(5,1,102,1,55000),
(5,2,105,8,480),
(1,3,104,2,4000);



SELECT * FROM dim_date;
SELECT * FROM dim_store;
SELECT * FROM dim_product;
SELECT * FROM fact_sales;