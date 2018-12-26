DROP database supermarket;
CREATE DATABASE IF NOT EXISTS supermarket;

USE supermarket;

CREATE TABLE department
(
    departmentName	VARCHAR(50) PRIMARY KEY,
    deptManager	VARCHAR(50),
    aisle INT
);

CREATE TABLE items
(
	barcode	INT	PRIMARY KEY,
    itemName	VARCHAR(50)	NOT NULL,
    departmentName	VARCHAR(50),
    aisle	INT,
    deptManager	VARCHAR(50),
    price	INT,
    stock	INT,
    CONSTRAINT items_fk_departmentName FOREIGN KEY (departmentName) REFERENCES department(departmentName)
);

CREATE TABLE employees
(
	empID	INT	PRIMARY KEY,
    empName	VARCHAR(50)	NOT NULL,
    position VARCHAR(50) NOT NULL,
    departmentName	VARCHAR(50)	NOT NULL,
    shift	VARCHAR(50) NOT NULL,
    salary INT NOT NULL,
    CONSTRAINT employees_fk_department FOREIGN KEY (departmentName) REFERENCES department(departmentName) ON DELETE CASCADE
);

CREATE TABLE suppliers
(
	supplierID INT	PRIMARY KEY,
    supplierName VARCHAR(50)	NOT NULL,
    supplierAddress VARCHAR(50)	NOT NULL,
    supplierPhoneNumber VARCHAR(50),
    other_details VARCHAR(100)
);
CREATE TABLE branches
(
	branchNumber VARCHAR(50),
	branchManager VARCHAR(50),
    branchName	VARCHAR(50),
    branchAddress VARCHAR(50),
    branchPhoneNumber VARCHAR(50),
    CONSTRAINT branches_pk PRIMARY KEY (branchNumber, branchManager)
);
CREATE TABLE transactions
(
	transactionID INT PRIMARY KEY,
    transactionDate TIMESTAMP,
    empID INT,
    totalPrice DECIMAL(9,2),
    paymentMethod VARCHAR(10),
    CONSTRAINT transactions_fk_employees FOREIGN KEY (empID) REFERENCES employees (empID)
);

INSERT INTO department VALUES('Bakery', 'Christopher Columbus', 1);
INSERT INTO department VALUES('Produce', 'Morgan Freeman', 2);
INSERT INTO department VALUES('Dairy', 'Marilyn Monroe', 3);
INSERT INTO department VALUES('Meat', 'Jennifer Lopez', 4);
INSERT INTO department VALUES('Deli', 'Tom Cruise', 5);
INSERT INTO department VALUES('Snacks', 'Austin Post', 6);
INSERT INTO department VALUES('Seafood', 'Shawn Carter', 7);
INSERT INTO department VALUES('Personal Care', 'Caitlyn Jenner', 8);
INSERT INTO department VALUES('School Supplies', 'Mark Zuckerburg', 9);
INSERT INTO department VALUES('Clothes', 'Jennifer Lawrence', 10);
INSERT INTO department VALUES('Customer Service', 'Houwei Cao', 11);
INSERT INTO department VALUES('Sanitation', 'Jonathan Voris', 12);
INSERT INTO department VALUES('Inventory', 'Steven Billis', 13);

INSERT INTO items VALUES('00001', 'Organic Chocolate Muffins', 'Bakery',  1, 'Christopher Columbus', 2.79, 100);
INSERT INTO items VALUES('00002', 'Organic Lettuce', 'Produce', 2, 'Morgan Freeman', 1.39, 250);
INSERT INTO items VALUES('00003', 'Organic Blackberries', 'Produce', 2, 'Morgan Freeman', 4.99, 100);
INSERT INTO items VALUES('00004', 'Organic Cream Cheese', 'Dairy', 3, 'Marilyn Monroe', 3.79, 200);
INSERT INTO items VALUES('00005', 'Organic Milk', 'Dairy', 3, 'Marilyn Monroe', 3.99, 20);
INSERT INTO items VALUES('00006', 'Organic Chipotle Peppers', 'Produce', 3, 'Morgan Freeman', 2.79, 200);
INSERT INTO items VALUES('00007', 'Organic Steak', 'Meat', 4, 'Jennifer Lopez', 3.79, 20);
INSERT INTO items VALUES('00008', 'Organic Roast Beef', 'Deli', 5, 'Tom Cruise', 6.99, 200);
INSERT INTO items VALUES('00009', 'Organic Potato Chips', 'Snacks', 6, 'Austin Post', 3.99, 210);
INSERT INTO items VALUES('00010', 'Organic Shrimp', 'Seafood', 7, 'Shawn Carter', 5.79, 230);


INSERT INTO employees VALUES(10001, 'Aubrey Graham', 'Cashier', 'Customer Service','Night', 1000000);
INSERT INTO employees VALUES(10002, 'Quavious Marshall', 'Cashier', 'Customer Service' , 'Night', 500000);
INSERT INTO employees VALUES(10003, 'Kendrick Duckworth', 'Shelf Stocker', 'Inventory' , 'Night', 700000);
INSERT INTO employees VALUES(10004, 'Leland Wayne', 'Store Manager', 'Customer Service' , 'Day', 900000);
INSERT INTO employees VALUES(10005, 'Onika Maraj', 'Cashier', 'Customer Service' , 'Day', 1000000);
INSERT INTO employees VALUES(10006, 'Joseph Cartagena', 'Cashier', 'Customer Service' , 'Night', 600000);
INSERT INTO employees VALUES(10007, 'Bryan Williams', 'Store Manager', 'Customer Service' , 'Day', 800000);
INSERT INTO employees VALUES(10008, 'Robert Williams', 'Cashier', 'Customer Service' , 'Night', 400000);
INSERT INTO employees VALUES(10009, 'Marshall Mathers', 'Store Manager', 'Customer Service' , 'Night', 800000);
INSERT INTO employees VALUES(10010, 'Daniel Hernandez','Janitor', 'Sanitation' , 'Day', '30000');


INSERT INTO suppliers VALUES(2001, 'Maplevale Farms Inc', '2063 Allen Street Falconer NY 14733', '716-483-4090', 'Meat');
INSERT INTO suppliers VALUES(2002, 'Island Natural', '42-07 20th Avenue Long Island City NY 11105', '718-721-8000', null);
INSERT INTO suppliers VALUES(2003, 'The Chefs Warehouse', '100 E Ridge Rd Ridgefield CT 06877', '203-894-1345', 'Food Items');
INSERT INTO suppliers VALUES(2004, 'Driscoll Foods', '174 Delwanna Avenue CLifton NJ 07014', '973-672-9400', 'Produce');
INSERT INTO suppliers VALUES(2005, 'Table Fresh', '6930 S Choctaw Dr Baton Rouge LA 70806', '225-444-1234', null);
INSERT INTO suppliers VALUES(2006, 'Bel Canto Foods LLC', '1300 Viele Avenue Bronx NY', '718-497-3888', 'Spanish');
INSERT INTO suppliers VALUES(2007, 'ACE Endico Corp', '80 International Blvd Brewster NY 10509', '845-940-1501', null);
INSERT INTO suppliers VALUES(2008, 'Pocono ProFoods', 'Rt 191 and Chipperfield Drive Stroudsburg PA 18360', '570-421-4990', null);
INSERT INTO suppliers VALUES(2009, 'The Cheese Works', '247 Margaret King Avenue Ringwood NJ 07456', '800-962-1220', 'Dairy');
INSERT INTO suppliers VALUES(2010, 'Costa Fruit and Produce', '18 Bunker Hill Industrial Park Boston MA 02129', '617-241-8718', 'Produce');

INSERT INTO branches VALUES(0001, 'John Wick', 'Organic Market', '234 River Dr. Brooklyn NY 11265', '718-555-0956');
INSERT INTO branches VALUES(0002, 'Patrick Star', 'Organic Market', '234 River Dr. Brooklyn NY 11265', '718-555-0956');
INSERT INTO branches VALUES(0003, 'Chuck Norris', 'Fancy Foods', '123 Food Pl. Bronx NY 10473', '646-555-1513');
INSERT INTO branches VALUES(0004, 'Steve Jobs', 'Fancy Foods', '123 Food Pl. Bronx NY 10473', '646-555-1513');
INSERT INTO branches VALUES(0005, 'Tony Stark', 'World Food Market', '785 Water Ave. New York NY 10034', '347-555-8230');
INSERT INTO branches VALUES(0006, 'Danny Phantom', 'World Food Market', '785 Water Ave. New York NY 10034', '347-555-8230');
INSERT INTO branches VALUES(0007, 'Herbert Taylor','Grocery Junction', '772 First St. Queens NY 11437', '917-555-4537');
INSERT INTO branches VALUES(0004, 'Bruce Lee', 'Grocery Junction', '772 First St. Queens NY 11437', '917-555-4537');
INSERT INTO branches VALUES(0005, 'Clark Kent', 'Amazing Foods', '234 Broad St. Staten Island NY 10353', '212-555-1463');
INSERT INTO branches VALUES(0005, 'Yoshikazu Saito', 'Amazing Foods', '234 Broad St. Staten Island NY 10353', '212-555-1463');

INSERT INTO transactions VALUES(1110, '2018-03-08 08:12:33', 10001, 10.35, 'Cash');
INSERT INTO transactions VALUES(1111, '2018-03-08 09:32:45', 10002, 8.20, 'Credit'); 
INSERT INTO transactions VALUES(1112, '2018-03-08 09:46:11', 10008, 250.50, 'Credit');
INSERT INTO transactions VALUES(1113, '2018-03-08 10:51:34', 10001, 80.21, 'Cash');
INSERT INTO transactions VALUES(1114, '2018-03-08 11:10:50', 10005, 20.21, 'Cash');
INSERT INTO transactions VALUES(1115, '2018-03-08 11:22:19', 10001, 19.90, 'Cash');
INSERT INTO transactions VALUES(1116, '2018-03-08 12:37:05', 10005, 3.98, 'Debit');
INSERT INTO transactions VALUES(1117, '2018-03-08 12:46:53', 10002, 23.99, 'Credit');
INSERT INTO transactions VALUES(1118, '2018-03-09 01:22:10', 10001, 47.50, 'Debit');
INSERT INTO transactions VALUES(1119, '2018-03-09 01:43:25', 10006, 170.20, 'Cash');


-- queries
SELECT * FROM suppliers 
WHERE supplierAddress LIKE '%NY%';

SELECT * FROM transactions
WHERE totalPrice > 20.00; 

SELECT * FROM transactions
WHERE paymentMethod = 'Cash';

SELECT * FROM branches 
WHERE branchAddress LIKE '%Queens%';

SELECT empName FROM employees
ORDER BY empName;

-- shift view
CREATE VIEW manager_shift
AS SELECT empName, shift, position 
FROM employees;

CREATE VIEW transaction_date
AS SELECT transactionID, transactionDate, totalPrice, paymentMethod 
FROM transactions;