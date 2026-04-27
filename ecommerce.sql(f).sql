CREATE DATABASE db_assignment;
USE db_assignment;

SELECT * FROM Customers;
CREATE TABLE Categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10,2),
    stock INT,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);
SELECT * FROM Products;

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
SELECT * FROM Orders;


CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_method VARCHAR(50),
    payment_status VARCHAR(50),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);
SELECT * FROM Payments;
INSERT INTO Customers VALUES
(1,'Amit','amit@gmail.com','9999999991','2026-01-01'),
(2,'Riya','riya@gmail.com','9999999992','2026-01-01'),
(3,'John','john@gmail.com','9999999993','2026-01-01'),
(4,'Sara','sara@gmail.com','9999999994','2026-01-01'),
(5,'Raj','raj@gmail.com','9999999995','2026-01-01'),
(6,'Neha','neha@gmail.com','9999999996','2026-01-01'),
(7,'Arun','arun@gmail.com','9999999997','2026-01-01'),
(8,'Pooja','pooja@gmail.com','9999999998','2026-01-01'),
(9,'Kiran','kiran@gmail.com','9999999999','2026-01-01'),
(10,'Meena','meena@gmail.com','9999999910','2026-01-01');

INSERT INTO Categories VALUES
(1,'Electronics'),
(2,'Clothing'),
(3,'Books');

INSERT INTO Products VALUES
(1,'Laptop',50000,10,1),
(2,'Phone',20000,20,1),
(3,'Shirt',1000,50,2),
(4,'Jeans',2000,30,2),
(5,'Novel',500,40,3),
(6,'Tablet',30000,15,1),
(7,'T-shirt',700,60,2),
(8,'Notebook',200,100,3),
(9,'Headphones',1500,25,1),
(10,'Jacket',2500,20,2);

INSERT INTO Orders VALUES
(1,1,'2026-01-01',52000),
(2,2,'2026-01-02',21000),
(3,3,'2026-01-03',1500),
(4,4,'2026-01-04',2500),
(5,5,'2026-01-05',700),
(6,6,'2026-01-06',500),
(7,7,'2026-01-07',30000),
(8,8,'2026-01-08',200),
(9,9,'2026-01-09',1500),
(10,10,'2026-01-10',2500);

INSERT INTO Order_Items VALUES
(1,1,1,1,50000),
(2,1,9,1,2000),
(3,2,2,1,20000),
(4,3,5,3,1500),
(5,4,10,1,2500),
(6,5,7,1,700),
(7,6,5,1,500),
(8,7,6,1,30000),
(9,8,8,1,200),
(10,9,9,1,1500);

INSERT INTO Payments VALUES
(1,1,'UPI','Completed'),
(2,2,'Card','Completed'),
(3,3,'Cash','Completed'),
(4,4,'UPI','Pending'),
(5,5,'Card','Completed'),
(6,6,'Cash','Completed'),
(7,7,'UPI','Completed'),
(8,8,'Card','Completed'),
(9,9,'Cash','Completed'),
(10,10,'UPI','Pending');

SELECT c.name, o.order_id, o.total_amount
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id;

SELECT SUM(total_amount) FROM Orders;

SELECT o.order_id, p.name
FROM Order_Items oi
JOIN Products p ON oi.product_id = p.product_id
JOIN Orders o ON oi.order_id = o.order_id;

SELECT * FROM Orders WHERE total_amount > 1000;

SELECT customer_id, COUNT(*) FROM Orders GROUP BY customer_id;

SELECT name, stock FROM Products;

SELECT * FROM Payments WHERE payment_status = 'Pending';

SELECT c.name, o.order_id, o.total_amount
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id;

SELECT * FROM Orders WHERE total_amount > 1000;

SELECT SUM(total_amount) FROM Orders;