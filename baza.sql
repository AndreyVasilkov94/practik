CREATE DATABASE library_db;
USE library_db;
CREATE TABLE books (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(100) NOT NULL,
  author VARCHAR(100) NOT NULL,
  year INT
);
INSERT INTO books (title, author, year) VALUES 
  ('Война и мир', 'Лев Толстой', 1869),
  ('Преступление и наказание', 'Федор Достоевский', 1866);