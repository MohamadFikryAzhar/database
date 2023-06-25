--Masuk ke postgres--
psgl -U postgres

--Soal nomor 1 membuat query dan tabel--
--Tabel data yang saya masukkan yakni:--
--a. Customers:--
CREATE TABLE Customers (
  customer_id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  email VARCHAR(255),
  phone VARCHAR(20)
);

--b. Products:--
CREATE TABLE Products (
  product_id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  price DECIMAL(10, 2),
  description TEXT
);

--c. Orders:--
CREATE TABLE Orders (
  order_id SERIAL PRIMARY KEY,
  customer_id INTEGER REFERENCES Customers(customer_id),
  product_id INTEGER REFERENCES Products(product_id),
  quantity INTEGER,
  order_date DATE
);

--d. Categories:--
CREATE TABLE Categories (
  category_id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  description TEXT
);

--Soal nomor 2 membuat CRUD (Create, Read, Update, Delete) untuk setiap tabel:--
--a. Customers--
--Create:--
INSERT INTO Customers (name, email, phone)
VALUES 
  ('Mohamad Fikry Azhar', 'azharfikry6@gmail.com', '08128128218'),
  ('Fikry', 'azharaja@gmail.com', '08128128'),
  ('Fik', 'azhja@gmail.com', '08123133128'),
  ('Fikry Ajhar', 'azharajhar@gmail.com', '081484828'),
  ('Fikry Azhar', 'azharazh@gmail.com', '081281465628'),
  ('Mario Dandi', 'dandisubarjo@gmail.com', '08134428128');
--Read:--
SELECT * FROM Customers;
--Update:--
UPDATE Customers
SET email = 'fresconoodle4@example.com'
WHERE customer_id = 1;
--Delete:--
DELETE FROM Customers
WHERE customer_id = 1;

--b. Products--
--Create:--
INSERT INTO Products (name, price, description)
VALUES 
  ('Product A', 11.99, 'Lorem Ipsum dolor sit amet'),
  ('Product B', 10.99, 'Lorem Ipsum dolor sit'),
  ('Product C', 9.99, 'Lorem Ipsum dolor amet'),
  ('Product D', 8.99, 'Lorem Ipsum dolor'),
  ('Product E', 7.99, 'Lorem Ipsum'),
  ('Product F', 6.99, 'Lorem');
--Read:--
SELECT * FROM Products;
--Update:--
UPDATE Products
SET price = 15.99
WHERE product_id = 1;
--Delete:--
DELETE FROM Products
WHERE product_id = 1;

--c. Orders--
--Create:--
INSERT INTO Orders (customer_id, product_id, quantity, order_date)
VALUES 
  (1, 6, 2, '2023-01-17'),
  (2, 6, 2, '2022-03-23'),
  (3, 5, 3, '2022-05-26'),
  (4, 4, 4, '2022-04-29'),
  (5, 3, 2, '2022-11-22'),
  (6, 2, 2, '2022-12-09');
--Read:--
-- Menampilkan semua data dari tabel Orders
SELECT * FROM Orders;
-- Menampilkan data Orders berdasarkan ID tertentu
SELECT * FROM Orders WHERE order_id = 1;
--Update:--
UPDATE Orders SET quantity = 3 WHERE order_id = 1;
--Delete:--
DELETE FROM Orders WHERE order_id = 1;

--d. Categories--
--Create:--
INSERT INTO Categories (name, description)
VALUES 
  ('Category A', 'Lorem Ipsum dolor sit Amet'),
  ('Category B', 'Lorem Ipsum dolor sit'),
  ('Category C', 'Lorem Ipsum dolor'),
  ('Category D', 'Lorem Ipsum'),
  ('Category E', 'Lorem'),
  ('Category F', 'Lorem Ipsum dolor Amet'),
--Read:--
SELECT * FROM Categories;
SELECT * FROM Categories WHERE category_id = 1;
--Update:--
UPDATE Categories SET description = 'New description' WHERE category_id = 1;
--Delete:--
DELETE FROM Categories WHERE category_id = 1;

--Soal nomor 3 membuat query sorting dan filter pada 2 tabel--
--a. Customers berdasarkan nama (ascending)--
SELECT * FROM Customers
ORDER BY name ASC;

--b. Products berdasarkan harga (diatas 50)--
SELECT * FROM Products
WHERE price > 50;
