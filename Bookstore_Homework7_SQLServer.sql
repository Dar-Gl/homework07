-- Homework 7: Database Programming (SQL Server)
-- Run in a database where you have permission to create tables.
-- Optional: CREATE DATABASE BookstoreHW7; GO  USE BookstoreHW7; GO
-- WARNING: This setup drops and re-creates the three homework tables.

IF OBJECT_ID(N'dbo.Books', N'U') IS NOT NULL DROP TABLE dbo.Books;
IF OBJECT_ID(N'dbo.Publishers', N'U') IS NOT NULL DROP TABLE dbo.Publishers;
IF OBJECT_ID(N'dbo.Authors', N'U') IS NOT NULL DROP TABLE dbo.Authors;
GO

CREATE TABLE dbo.Authors (
    AuthorID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50)
);

CREATE TABLE dbo.Publishers (
    PublisherID INT PRIMARY KEY,
    PublisherName NVARCHAR(100)
);

CREATE TABLE dbo.Books (
    BookID INT PRIMARY KEY,
    Title NVARCHAR(100),
    Price DECIMAL(8,2),
    PublisherID INT NOT NULL,
    AuthorID INT NOT NULL,
    CONSTRAINT FK_Books_Publishers FOREIGN KEY (PublisherID)
        REFERENCES dbo.Publishers(PublisherID),
    CONSTRAINT FK_Books_Authors FOREIGN KEY (AuthorID)
        REFERENCES dbo.Authors(AuthorID)
);
GO

INSERT INTO dbo.Authors (AuthorID, FirstName, LastName) VALUES
(1, N'Jordan', N'Lee'),
(2, N'Casey', N'Smith'),
(3, N'Morgan', N'Davis');

INSERT INTO dbo.Publishers (PublisherID, PublisherName) VALUES
(1, N'Murach'),
(2, N'Northstar Books');

INSERT INTO dbo.Books (BookID, Title, Price, PublisherID, AuthorID) VALUES
(101, N'C# Fundamentals', 49.95, 1, 1),
(102, N'SQL Server Essentials', 59.95, 1, 2),
(103, N'Database Design Made Simple', 44.50, 2, 1),
(104, N'Practical ADO.NET', 54.00, 1, 2),
(105, N'Software Testing Basics', 39.99, 2, 3);
GO

-- Confirm the starting data
SELECT * FROM dbo.Authors ORDER BY AuthorID;
SELECT * FROM dbo.Publishers ORDER BY PublisherID;
SELECT * FROM dbo.Books ORDER BY BookID;
GO


-- Run the next five tasks IN ORDER, one task at a time.

-- 1. Display books with authors
SELECT b.BookID, b.Title,
       CONCAT(a.FirstName, ' ', a.LastName) AS AuthorName
FROM dbo.Books AS b
INNER JOIN dbo.Authors AS a ON b.AuthorID = a.AuthorID
ORDER BY b.BookID;

-- 2. Books by Murach
SELECT b.BookID, b.Title, p.PublisherName
FROM dbo.Books AS b
INNER JOIN dbo.Publishers AS p ON b.PublisherID = p.PublisherID
WHERE p.PublisherName = N'Murach'
ORDER BY b.BookID;

-- 3. Authors with more than one book
SELECT a.AuthorID,
       CONCAT(a.FirstName, ' ', a.LastName) AS AuthorName,
       COUNT(*) AS BooksWritten
FROM dbo.Authors AS a
INNER JOIN dbo.Books AS b ON a.AuthorID = b.AuthorID
GROUP BY a.AuthorID, a.FirstName, a.LastName
HAVING COUNT(*) > 1
ORDER BY BooksWritten DESC, AuthorName;

-- 4. Increase prices by 10%
UPDATE dbo.Books
SET Price = ROUND(Price * 1.10, 2);

SELECT BookID, Title, Price AS NewPrice
FROM dbo.Books
ORDER BY BookID;

-- 5. Delete one book and verify
DELETE FROM dbo.Books WHERE BookID = 105;

SELECT CASE
         WHEN EXISTS (SELECT 1 FROM dbo.Books WHERE BookID = 105)
         THEN 'Still present'
         ELSE 'Successfully removed'
       END AS DeleteCheck;

SELECT * FROM dbo.Books WHERE BookID = 105;
