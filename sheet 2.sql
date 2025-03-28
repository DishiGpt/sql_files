CREATE DATABASE LibraryDB;
USE LibraryDB;

CREATE TABLE Books (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(255),
    PublishedYear INT,
    Genre VARCHAR(100),
    AvailableCopies INT
);

CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Nationality VARCHAR(100),
    BirthYear INT,
    DeathYear INT
);


INSERT INTO Books (Title, Author, PublishedYear, Genre, AvailableCopies)
VALUES
('The Great Gatsby', 'F. Scott Fitzgerald', 1925, 'Fiction', 10),
('To Kill a Mockingbird', 'Harper Lee', 1960, 'Fiction', 7),
('1984', 'George Orwell', 1949, 'Dystopian', 5),
('Pride and Prejudice', 'Jane Austen', 1813, 'Romance', 8),
('The Hobbit', 'J.R.R. Tolkien', 1937, 'Fantasy', 6);

INSERT INTO Authors (Name, Nationality, BirthYear, DeathYear)
VALUES
('F. Scott Fitzgerald', 'American', 1896, 1940),
('Harper Lee', 'American', 1926, 2016),
('George Orwell', 'British', 1903, 1950),
('Jane Austen', 'British', 1775, 1817),
('J.R.R. Tolkien', 'British', 1892, 1973);

-- 1. Retrieve all books
SELECT * FROM Books;

-- 2. Retrieve books published after 1950 (only Title and Author)
SELECT Title, Author FROM Books WHERE PublishedYear > 1950;

-- 3. Find the total number of available copies for each genre
SELECT Genre, SUM(AvailableCopies) AS TotalCopies FROM Books GROUP BY Genre;

-- 4. Retrieve books with more than 5 available copies
SELECT * FROM Books WHERE AvailableCopies > 5;

-- 5. List books with "The" in the title (case insensitive)
SELECT * FROM Books WHERE Title LIKE '%The%';

-- 1. Increase available copies of a specific book
UPDATE Books SET AvailableCopies = AvailableCopies + 2 WHERE Title = '1984';

-- 2. Change the genre of a specific book
UPDATE Books SET Genre = 'Classic' WHERE Title = 'The Great Gatsby';

-- 3. Update the PublishedYear of a book
UPDATE Books SET PublishedYear = 1948 WHERE Title = '1984';

-- 4. Decrease available copies for books published before 2000
UPDATE Books SET AvailableCopies = AvailableCopies - 1 WHERE PublishedYear < 2000;

-- 1. Delete a book based on its title
DELETE FROM Books WHERE Title = 'The Hobbit';

-- 2. Remove books with less than 5 available copies
DELETE FROM Books WHERE AvailableCopies < 5;

-- 3. Delete all books of a specific genre
DELETE FROM Books WHERE Genre = 'Dystopian';

-- 1. Add ISBN column
ALTER TABLE Books ADD COLUMN ISBN VARCHAR(20);

-- 2. Insert a new book with ISBN
INSERT INTO Books (Title, Author, PublishedYear, Genre, AvailableCopies, ISBN)
VALUES ('Brave New World', 'Aldous Huxley', 1932, 'Dystopian', 7, '9780060850524');

-- 3. Retrieve books sorted by PublishedYear (descending)
SELECT * FROM Books ORDER BY PublishedYear DESC;

-- 4. Find the oldest book
SELECT * FROM Books ORDER BY PublishedYear ASC LIMIT 1;

-- 1. Find the number of books in each genre
SELECT Genre, COUNT(*) AS BookCount FROM Books GROUP BY Genre;

-- 2. Find all unique genres
SELECT DISTINCT Genre FROM Books;

-- 3. Books published after 2000, either Fiction or not by Jane Austen
SELECT * FROM Books 
WHERE PublishedYear > 2000 
AND (Genre = 'Fiction' OR Author <> 'Jane Austen');

-- 4. Aggregate functions
SELECT AVG(AvailableCopies) AS AvgCopies, MAX(AvailableCopies) AS MaxCopies FROM Books;

-- 5. Find books starting with "P"
SELECT * FROM Books WHERE Title LIKE 'P%';

-- 6. Books published between 1900 and 2000
SELECT * FROM Books WHERE PublishedYear BETWEEN 1900 AND 2000;

-- 7. Books in specified genres
SELECT * FROM Books WHERE Genre IN ('Fiction', 'Romance');

-- 8. Inner join Books and Authors
SELECT Books.Title, Books.PublishedYear, Authors.Name, Authors.Nationality 
FROM Books 
JOIN Authors ON Books.Author = Authors.Name;

-- 9. Filter genres with more than 5 books
SELECT Genre, COUNT(*) AS BookCount FROM Books GROUP BY Genre HAVING COUNT(*) > 5;

-- 10. Check if books with less than 3 available copies exist
SELECT EXISTS (SELECT 1 FROM Books WHERE AvailableCopies < 3) AS ExistsCheck;

