START TRANSACTION;

DROP TABLE IF EXISTS locations;
DROP TABLE IF EXISTS menuItems;
DROP TABLE IF EXISTS locationMenu;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;


CREATE TABLE locations (
locationId INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
locationName VARCHAR(100) NOT NULL

);


CREATE TABLE menuItems (
itemId INT PRIMARY KEY AUTO_INCREMENT,
itemName VARCHAR(100) NOT NULL,
itemDescription TEXT,
price DECIMAL(10, 2) NOT NULL,
category ENUM('starter', 'entree', 'dessert', 'drinks') NOT NULL
);


CREATE TABLE locationMenu (
locationId INT,
itemId INT,
PRIMARY KEY (locationId, itemId),
FOREIGN KEY (locationId) REFERENCES locations(locationId),
FOREIGN KEY (itemId) REFERENCES menuItems(itemId)
);



CREATE TABLE orders (
orderId INT PRIMARY KEY AUTO_INCREMENT,
locationId INT,
-- customerId INT AUTO_INCREMENT,
customerName VARCHAR(50) NOT NULL,
itemId INT NOT NULL,
-- FOREIGN KEY (customerId) references customers (customerId),
FOREIGN KEY (locationId) references locations (locationId),
FOREIGN KEY (itemId) references locationMenu (itemId)
);



INSERT INTO menuItems (itemName, itemDescription, price, category) VALUES ('Hamburger', 'burger', 3.99, 'entree');
INSERT INTO menuItems (itemName, itemDescription, price, category) VALUES ('Cheeseburger', 'burger with cheese', 4.99, 'entree');
INSERT INTO menuItems (itemName, itemDescription, price, category) VALUES ('Panini', 'ham and cheese panini', 4.99, 'entree');
INSERT INTO menuItems (itemName, itemDescription, price, category) VALUES ('Chicken Sandwich', 'chicken in sandwich form', 3.99, 'entree');
INSERT INTO menuItems (itemName, itemDescription, price, category) VALUES ('Fish Sandwich', 'Fish in sandwich form', 4.99, 'entree');
INSERT INTO menuItems (itemName, itemDescription, price, category) VALUES ('Chips and Guac', 'Pan Fried tortilla chips and fresh guacamole', 1.99, 'starter');
INSERT INTO menuItems (itemName, itemDescription, price, category) VALUES ('Fries', 'Basket of Fries', 1.99, 'starter');
INSERT INTO menuItems (itemName, itemDescription, price, category) VALUES ('Wings', 'Basket of Wings', 1.99, 'starter');
INSERT INTO menuItems (itemName, itemDescription, price, category) VALUES ('Do-Not Donut', 'Just don\'t', 1.99, 'dessert');
INSERT INTO menuItems (itemName, itemDescription, price, category) VALUES ('Ice Cream', 'Chocolate or Vanilla', 1.99, 'dessert');
INSERT INTO menuItems (itemName, itemDescription, price, category) VALUES ('Malt', 'served in a small porcelain dish resembling a toilet', 2.99, 'dessert');
INSERT INTO menuItems (itemName, itemDescription, price, category) VALUES ('Dog Food', 'Not for Dogs', 39.99, 'dessert');
INSERT INTO menuItems (itemName, itemDescription, price, category) VALUES ('Iced Tea', 'Sweet or Unsweet', 1.99, 'drinks');
INSERT INTO menuItems (itemName, itemDescription, price, category) VALUES ('Coffee', 'with cream and/or sugar', 2.99, 'drinks');
INSERT INTO menuItems (itemName, itemDescription, price, category) VALUES ('Soft Drinks', 'Variety of Smepsi products', 1.99, 'drinks');


INSERT INTO locations (locationName) VALUES ('Burbank');
INSERT INTO locations (locationName) VALUES ('LA');
INSERT INTO locations (locationName) VALUES ('Riverside');
INSERT INTO locations (locationName) VALUES ('Orange County');
INSERT INTO locations (locationName) VALUES ('Oceanside');


INSERT INTO locationMenu (locationId, itemId) VALUES (1,1),(1,2),(1,3),(1,4),(1,6),(1,8),(1,9),(1,12),(1,13),(1,15);
INSERT INTO locationMenu (locationId, itemId) VALUES (2,1),(2,2),(2,3),(2,4),(2,6),(2,7),(2,9),(2,10),(2,11),(2,12),(2,13),(2,14),(2,15);
INSERT INTO locationMenu (locationId, itemId) VALUES (3,1),(3,2),(3,3),(3,4),(3,6),(3,7),(3,8),(3,12),(3,13),(3,14),(3,15);
INSERT INTO locationMenu (locationId, itemId) VALUES (4,1),(4,2),(4,3),(4,4),(4,6),(4,7),(4,8),(4,12),(4,13),(4,15);
INSERT INTO locationMenu (locationId, itemId) VALUES (5,1),(5,2),(5,3),(5,4),(5,5),(5,7),(5,8),(5,10),(5,14),(5,15);


INSERT INTO orders (locationId, customerName, itemId) VALUES (1, 'Hank Hill', 2),(1, 'Bobby Hill', 4),(2, 'Jeff Lebowski', 15),(3, 'John Carpenter', 6),(4, 'Forrest Gump', 2),(5, 'Jim Skywalker', 10);


COMMIT;

