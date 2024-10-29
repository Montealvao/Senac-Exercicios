CREATE DATABASE IF NOT EXISTS Library;
USE Library;

CREATE TABLE IF NOT EXISTS Authors(
 AuthorID VARCHAR(36) PRIMARY KEY,
 Name VARCHAR(100),
 BirthYear INT
);

CREATE TABLE IF NOT EXISTS Books(
 BookID VARCHAR(36) PRIMARY KEY,
 Title VARCHAR(200),
 AuthorID VARCHAR(36),
 FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

CREATE TABLE IF NOT EXISTS Loans(
 LoanID VARCHAR(36) PRIMARY KEY,
 BookID VARCHAR(36),
 MemberID VARCHAR(36),
 LoanDate DATE,
 ReturnDate DATE,
 FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

select * from authors;
INSERT INTO Authors (AuthorID, Name, BirthYear) VALUES
('d14f992b-465c-4361-a5e4-7558e93b19e5','Samuel Barros',2008);

select * from books;
INSERT INTO Books (BookID, Title, AuthorID) VALUES
('3e41c931-f573-4678-b691-8b29e24b7a7c','It a Coisa','74f1e443-b529-4b7b-bff4-a79e26976d11');

select * from loans;
INSERT INTO Loans (LoanID, BookID, MemberID, LoanDate, ReturnDate) VALUES
('99a2051a-8f23-4876-b309-afd9dc08bbe3','3e41c931-f573-4678-b691-8b29e24b7a7c','1959ad82-1a33-4ce7-bf46-c3bec0568fdb','2024-07-22','2024-08-04');

select books.title, authors.name
from books
inner join authors
on books.AuthorID = authors.AuthorID;

select books.title, loans.MemberID
from books
inner join loans
on loans.BookID = books.BookID;

select authors.name, books.title
from authors
left join books
on books.AuthorID = authors.AuthorID;

select books.title, loans.MemberID, loans.LoanDate, loans.ReturnDate
from books
left join loans
on loans.BookID = books.BookID;

select count(loanID) as Livros_Emprestados from loans;

select authors.name, (select count(BookID) from books where books.AuthorID = authors.AuthorID) as Livros_Escritos
from authors;