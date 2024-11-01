CREATE DATABASE IF NOT EXISTS Library;
USE Library;

CREATE TABLE IF NOT EXISTS Authors(
 AuthorID VARCHAR(36) PRIMARY KEY,
 Name VARCHAR(100),
 BirthYear INT,
 Country VARCHAR(100)
);

CREATE TABLE Genres (
 GenreID VARCHAR(36) PRIMARY KEY,
 GenreName VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Books(
 BookID VARCHAR(36) PRIMARY KEY,
 Title VARCHAR(200),
 AuthorID VARCHAR(36),
 GenreID VARCHAR(36),
 PublicationYear INT,
 FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID),
 FOREIGN KEY (GenreID) REFERENCES Genres(GenreID)
);

CREATE TABLE Members (
 MemberID VARCHAR(36) PRIMARY KEY,
 Name VARCHAR(100),
 JoinDate DATE
);

CREATE TABLE IF NOT EXISTS Loans(
 LoanID VARCHAR(36) PRIMARY KEY,
 BookID VARCHAR(36),
 MemberID VARCHAR(36),
 LoanDate DATE,
 DueDate DATE,
 ReturnDate DATE,
 FOREIGN KEY (BookID) REFERENCES Books(BookID),
 FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

select * from authors;
INSERT INTO Authors (AuthorID, Name, BirthYear, Country) VALUES
('fa9dfafb-3e4d-4d78-9e58-a4a0ccc86e41', 'J.K. Rowling', 1965, 'United Kingdom'),
('8abec1b5-bb73-4e0d-be58-bb91d7a5da2c', 'George R.R. Martin', 1948, 'United States'),
('45c0fa42-23ef-48b9-bd1e-0fccfc65dd2b', 'J.R.R. Tolkien', 1892, 'United Kingdom'),
('a315eafc-f937-43fd-8366-ea4156760cc2', 'Agatha Christie', 1890, 'United Kingdom');
/*('d14f992b-465c-4361-a5e4-7558e93b19e5','Samuel Barros',2008);*/

select * from Genres;
INSERT INTO Genres (GenreID, GenreName) VALUES
 ('450f6503-feb9-4934-a6c4-32a4b0bb6e11', 'Fantasy'),
 ('b3945aaf-d974-4a78-ba38-95adadb1ba49', 'Mystery'),
 ('51216214-eda8-4420-8763-56e81160ef05', 'Science Fiction'),
 ('205dd251-cea4-4390-acd6-de00c5605b96', 'Non-Fiction');

select * from books;
INSERT INTO Books (BookID, Title, AuthorID, GenreID, PublicationYear) VALUES
('74a0ff62-63ab-449d-8446-5a34e4b62aaa', 'Harry Potter and the Sorcerer\s Stone', 'fa9dfafb-3e4d-4d78-9e58-a4a0ccc86e41', '450f6503-feb9-4934-a6c4-32a4b0bb6e11', 1997),
('9a3d1f0d-214e-4693-a516-1e0b498a1340', 'A Game of Thrones', '8abec1b5-bb73-4e0d-be58-bb91d7a5da2c', '450f6503-feb9-4934-a6c4-32a4b0bb6e11', 1996),
('3910deb5-12f6-4333-a10b-0a51eac32d5b', 'The Hobbit', '45c0fa42-23ef-48b9-bd1e-0fccfc65dd2b', '450f6503-feb9-4934-a6c4-32a4b0bb6e11', 1937),
('cb95bc0b-2626-424c-bbd7-c5a3f01fc486', 'Harry Potter and the Chamber of Secrets', 'fa9dfafb-3e4d-4d78-9e58-a4a0ccc86e41', '450f6503-feb9-4934-a6c4-32a4b0bb6e11', 1998),
('8dbffd03-d2d6-4ecc-91a3-274314a50531', 'Murder on the Orient Express', 'a315eafc-f937-43fd-8366-ea4156760cc2', 'b3945aaf-d974-4a78-ba38-95adadb1ba49', 1934);

select * from Members;
INSERT INTO Members (MemberID, Name, JoinDate) VALUES
 ('8201d2dc-a8f6-44c6-9b43-cbd5a3c788e7', 'Alice Johnson', '2023-05-10'),
 ('3cd53aae-ff6f-4a8f-b051-003f70c5b375', 'Bob Smith', '2022-11-05'),
 ('7b5bef88-546c-4844-9198-f06d8d0b8ebd', 'Carol White', '2023-01-15'),
 ('e5b1b0d3-5204-4de9-9246-81ed32059fb9', 'Dave Black', '2023-07-20');

select * from loans;
INSERT INTO Loans (LoanID, BookID, MemberID, LoanDate, DueDate, ReturnDate) VALUES
 (1, '74a0ff62-63ab-449d-8446-5a34e4b62aaa', '8201d2dc-a8f6-44c6-9b43-cbd5a3c788e7', '2024-01-10', '2024-01-17', '2024-01-16'),
 (2, '9a3d1f0d-214e-4693-a516-1e0b498a1340', '3cd53aae-ff6f-4a8f-b051-003f70c5b375', '2024-02-05', '2024-02-12', NULL),
 (3, '74a0ff62-63ab-449d-8446-5a34e4b62aaa', '7b5bef88-546c-4844-9198-f06d8d0b8ebd', '2024-01-15', '2024-01-22', '2024-01-21'),
 (4, '3910deb5-12f6-4333-a10b-0a51eac32d5b', 'e5b1b0d3-5204-4de9-9246-81ed32059fb9', '2024-01-20', '2024-01-27', NULL),
 (5, '8dbffd03-d2d6-4ecc-91a3-274314a50531', '3cd53aae-ff6f-4a8f-b051-003f70c5b375', '2024-03-01', '2024-03-08', '2024-03-05');

/*1*/
select books.title, authors.name, genres.GenreName, books.PublicationYear
from books
inner join authors
on books.AuthorID = authors.AuthorID join genres on genres.GenreID = books.GenreId;

/*2*/
select books.title, members.name ,loans.LoanDate, loans.DueDate ,loans.ReturnDate
from books
left join loans
on loans.BookID = books.BookID join members on members.MemberId = loans.MemberId;

/*3*/
select authors.name, books.title
from authors
left join books
on books.AuthorID = authors.AuthorID;

/*4*/
select genres.GenreName, (select count(BookID) from books where books.GenreID = genres.GenreID) as Livros_Disponíveis
from genres;

/*5*/
select count(loanID) as Livros_Emprestados from loans where loans.ReturnDate IS NUll;

/*6*/
select members.name as Nome, (select count(LoanID) from loans where loans.MemberId = members.MemberID) as Quantidade_Empréstimo
from members;

/*7*/
select books.title as Livros, (select count(LoanId) from loans where loans.BookID = books.BookId) as Quantidade_Emprestada
from books;

/*8*/
select members.Name 
from members 
inner join loans 
on loans.MemberID = members.MemberId
where loans.ReturnDate IS null;


select books.title, loans.MemberID
from books
inner join loans
on loans.BookID = books.BookID;

select count(loanID) as Livros_Emprestados from loans;