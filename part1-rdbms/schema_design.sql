Create database retail_db;
Use retail_db;

CREATE TABLE Customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100) NOT NULL,
    customer_city VARCHAR(50) NOT NULL
);

CREATE TABLE Products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL
);

CREATE TABLE Sales_Reps (
    sales_rep_id VARCHAR(10) PRIMARY KEY,
    sales_rep_name VARCHAR(100) NOT NULL,
    sales_rep_email VARCHAR(100) NOT NULL,
    office_address VARCHAR(200) NOT NULL
);

CREATE TABLE Orders (
    order_id VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10) NOT NULL,
    sales_rep_id VARCHAR(10) NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (sales_rep_id) REFERENCES Sales_Reps(sales_rep_id)
);

CREATE TABLE Order_Items (
    order_id VARCHAR(10),
    product_id VARCHAR(10),
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);


INSERT INTO Customers VALUES
('C002','Priya Sharma','priya.sharma@email.com','Delhi'),
('C001','Rohan Mehta','rohan.mehta@email.com','Mumbai'),
('C006','Neha Gupta','neha.gupta@email.com','Delhi'),
('C003','Amit Verma','amit.verma@email.com','Bangalore'),
('C005','Vikram Singh','vikram.singh@email.com','Mumbai');

INSERT INTO Products VALUES
('P004','Notebook','Stationery',120),
('P007','Pen Set','Stationery',250),
('P005','Headphones','Electronics',3200),
('P003','Desk Chair','Furniture',8500),
('P006','Standing Desk','Furniture',22000);

INSERT INTO Sales_Reps VALUES
('SR02','Priya Khanna','priya.khanna@company.com','Delhi Office, Connaught Place, New Delhi - 110001'),
('SR01','Deepak Joshi','deepak.joshi@company.com','Mumbai HQ, Nariman Point, Mumbai - 400021'),
('SR03','Arjun Menon','arjun.menon@company.com','South Zone, MG Road, Bangalore - 560001');

INSERT INTO Orders VALUES
('ORD1027','C002','SR02','2023-11-02'),
('ORD1114','C001','SR01','2023-08-06'),
('ORD1153','C006','SR01','2023-02-14'),
('ORD1002','C002','SR02','2023-01-17'),
('ORD1118','C006','SR02','2023-11-10');


INSERT INTO Order_Items VALUES
('ORD1027','P004',4,120),
('ORD1114','P007',2,250),
('ORD1153','P007',3,250),
('ORD1002','P005',1,3200),
('ORD1118','P007',5,250);

SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Sales_Reps;
SELECT * FROM Orders;
SELECT * FROM Order_Items;






























-- Q1: List all customers from Mumbai along with their total order value:

SELECT c.customer_name,
       SUM(oi.quantity * oi.unit_price) AS total_order_value
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Order_Items oi ON o.order_id = oi.order_id
WHERE c.customer_city = 'Mumbai'
GROUP BY c.customer_name;


-- Q2: Find the top 3 products by total quantity sold:

SELECT p.product_name,
       SUM(oi.quantity) AS total_quantity
FROM Products p
JOIN Order_Items oi ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY total_quantity DESC
LIMIT 3;

-- Q3: List all sales representatives and the number of unique customers they have handled:

SELECT sr.sales_rep_name,
       COUNT(DISTINCT o.customer_id) AS unique_customers
FROM Sales_Reps sr
LEFT JOIN Orders o
ON sr.sales_rep_id = o.sales_rep_id
GROUP BY sr.sales_rep_name;

-- Q4: Find all orders where the total value exceeds 10000, sorted by value descending:

SELECT o.order_id,
       SUM(oi.quantity * oi.unit_price) AS order_value
FROM Orders o
JOIN Order_Items oi
ON o.order_id = oi.order_id
GROUP BY o.order_id
HAVING order_value > 10000
ORDER BY order_value DESC;

-- Q5: Identify any products that have never been ordered:

SELECT p.product_name
FROM Products p
LEFT JOIN Order_Items oi
ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;

