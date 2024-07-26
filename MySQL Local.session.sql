
CREATE DATABASE IF NOT EXISTS BookstoreDB;


USE BookstoreDB;


CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    BirthYear INT,
    Country VARCHAR(50)
);


CREATE TABLE Books (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(100),
    AuthorID INT,
    Genre VARCHAR(50),
    Price DECIMAL(10, 2),
    PublishYear INT,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);


CREATE TABLE Sales (
    SaleID INT PRIMARY KEY AUTO_INCREMENT,
    BookID INT,
    Quantity INT,
    SaleDate DATE,
    TotalPrice DECIMAL(10, 2),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);


INSERT INTO Authors (Name, BirthYear, Country) VALUES
('George Orwell', 1903, 'United Kingdom'),
('J.K. Rowling', 1965, 'United Kingdom'),
('J.R.R. Tolkien', 1892, 'United Kingdom');


INSERT INTO Books (Title, AuthorID, Genre, Price, PublishYear) VALUES
('1984', 1, 'Dystopian', 9.99, 1949),
('Harry Potter and the Philosopher''s Stone', 2, 'Fantasy', 12.99, 1997),
('The Hobbit', 3, 'Fantasy', 14.99, 1937);


INSERT INTO Sales (BookID, Quantity, SaleDate, TotalPrice) VALUES
(1, 10, '2024-07-20', 99.90),
(2, 5, '2024-07-21', 64.95),
(3, 8, '2024-07-22', 119.92);


SELECT 
    b.Title, 
    a.Name AS Author, 
    b.Genre, 
    b.Price, 
    s.Quantity, 
    s.SaleDate, 
    s.TotalPrice 
FROM 
    Books b
JOIN 
    Authors a ON b.AuthorID = a.AuthorID
LEFT JOIN 
    Sales s ON b.BookID = s.BookID;