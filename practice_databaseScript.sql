START TRANSACTION;

DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS orderDetails;


CREATE TABLE customers (
customerId INT PRIMARY KEY AUTO_INCREMENT,
customerName VARCHAR(50) NOT NULL
);
CREATE TABLE orders (
orderId INT PRIMARY KEY AUTO_INCREMENT,
customerId INT,
orderDate DATE NOT NULL,
FOREIGN KEY (customerId) references customers (customerId)
);
CREATE TABLE orderDetails (
detailId INT PRIMARY KEY AUTO_INCREMENT,
orderId INT,
productName VARCHAR(100) NOT NULL,
quantity INT NOT NULL,
FOREIGN KEY (orderId) references orders (orderId)
);


INSERT INTO Customers (customerName) VALUES ('Bob Saget');
INSERT INTO Orders (customerId, orderDate) VALUES (1, '2025-06-28');
INSERT INTO OrderDetails (orderId, productName, quantity) VALUES (1, 'Full House', 1);

COMMIT;