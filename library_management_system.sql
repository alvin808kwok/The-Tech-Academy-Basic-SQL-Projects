USE MASTER
go
DROP DATABASE library_mng_system
go
CREATE DATABASE library_mng_system
go
USE library_mng_system
go

/* LIBRARY BRANCH */

CREATE TABLE tbl_library_branch(
	branch_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	branch_name VARCHAR(50) NOT NULL,
	address VARCHAR(50) NOT NULL
);

INSERT INTO tbl_library_branch(branch_name, address)
VALUES
	('Sharpstown', '12345 ABC Street'),
	('Central', '12345 ABC Street'),
	('Northwood', '1st Street'),
	('Southside', 'Windward Street')
;

/* PUBLISHER */

CREATE TABLE tbl_publisher(
	publisher_name VARCHAR(50) PRIMARY KEY NOT NULL,
	address VARCHAR(50) NOT NULL,
	phone VARCHAR(50) NOT NULL
);

INSERT INTO tbl_publisher(publisher_name, address, phone)
VALUES
	('Francisco de Robles', '888 Lucky Street', '256-845-9876'),
	('Chapman & Hall', '5839 South King Street', '483-929-3490'),
	('Allen & Unwin', '743 Harding Avenue', '584-394-3409'),
	('Reynal & Hitchcock', '238 Morningstar Street', '239-953-9343'),
	('Scholastic Corporation', '489 Northpeak Boulevard', '940-490-0439'),
	('Collins Crime Club', '92 Queens Street', '934-394-4939'),
	('Unknown', 'Unkown', '000-000-0000'),
	('Longman', '12th Street', '987-920-9309'),
	('Geoffrey Bles', '984 Irvine Lane', '989-989-9800'),
	('Doubleday', 'D Street', '408-909-1092'),
	('The Ralston Society', '1616 Richard Ave', '503-485-9388'),
	('Little, Brown and Company', '4800 Plumeria Drive', '408-759-9394'),
	('HarperCollins', '102 Goodwill Lane', '958-930-0940'),
	('Olympia Press', '958 Koae Street', '808-735-7520'),
	('Loius Coues Page', '98 Street', '908-904-0400'),
	('Harper', '129 Harper Lane', '849-929-9230'),
	('Scholastic Paperbacks', '549 Windward Avenue', '902-932-9384'),
	('Mark Lee', 'State Street', '746-845-8394'),
	('Simon & Schuster', 'Elm Street', '394-239-3049')
;


/* BOOKS */

CREATE TABLE tbl_books(
	book_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	title VARCHAR(50) NOT NULL,
	publisher_name VARCHAR(50) NOT NULL CONSTRAINT fk_tblBookpublName_to_tblPublpublName FOREIGN KEY REFERENCES tbl_publisher(publisher_name)
);

INSERT INTO tbl_books(title, publisher_name)
VALUES
	('Don Quixote', 'Francisco de Robles'),
	('A Tale of Two Cities', 'Chapman & Hall'),
	('The Lord of the Rings', 'Allen & Unwin'),
	('The Little Prince', 'Reynal & Hitchcock'),
	('Harry Potter and the Sorcerer''s Stone', 'Scholastic Corporation'),
	('And Then There Were None', 'Collins Crime Club'),
	('The Dream of the Red Chamber', 'Unknown'),
	('The Hobbit', 'Allen & Unwin'),
	('She: A History of Adventure', 'Longman'),
	('The Lion, the Witch and the Wardrobe', 'Geoffrey Bles'),
	('The Da Vinci Code', 'Doubleday'),
	('Think and Grow Rich', 'The Ralston Society'),
	('Harry Potter and the Half-Blood Prince', 'Scholastic Corporation'),
	('The Catcher in the Rye', 'Little, Brown and Company'),
	('The Alchemist', 'HarperCollins'),
	('Harry Potter and the Chamber of Secrets', 'Scholastic Paperbacks'),
	('Harry Potter and the Prisoner of Azkaban', 'Scholastic Corporation'),
	('Harry Potter and the Goblet of Fire', 'Scholastic Corporation'),
	('Harry Potter and the Deathly Hallows', 'Scholastic Corporation'),
	('One Hundred Years of Solitude', 'HarperCollins'),
	('Lolita', 'Olympia Press'),
	('Anne of Green Gables', 'Loius Coues Page'),
	('Charlotte''s Web', 'Harper'),
	('The Lost Tribe', 'Mark Lee'),
	('IT', 'Simon & Schuster'),
	('The Shining', 'Doubleday')
;

/* BOOK AUTHOR */

CREATE TABLE tbl_book_author(
	book_id INT NOT NULL CONSTRAINT fk_tblBookAuthor_to_tblBooksbookID FOREIGN KEY REFERENCES tbl_books(book_id),
	author_name VARCHAR(50)
);

INSERT INTO tbl_book_author(book_id, author_name)
VALUES
	(1, 'Miguel de Cervantes'),
	(2, 'Chalres Dickens'),
	(3, 'J.R.R. Tolkien'),
	(4, 'Antoine de Saint-Exupery'),
	(5, 'J.K. Rowling'),
	(6, 'Agatha Christie'),
	(7, 'Cao Xueqin'),
	(8, 'H. Rider Haggard'),
	(9, 'C.S. Lewis'),
	(10, 'Dan Brown'),
	(11, 'Napolean Hill'),
	(12, 'J.D. Salinger'),
	(13, 'Paulo Coelho'),
	(14, 'Gabriel Garcia Marquez'),
	(15, 'Vladimir Nabokov'),
	(16, 'Lucy Maud Montgomery'),
	(17, 'E.B. White'),
	(18, 'Anna Sewell'),
	(19, 'Stephen King')
;

/* BOOK COPIES*/

CREATE TABLE tbl_book_copies(
	book_id INT NOT NULL CONSTRAINT fk_title FOREIGN KEY REFERENCES tbl_books(book_id),
	branch_id INT NOT NULL CONSTRAINT fk_branch_id FOREIGN KEY REFERENCES tbl_library_branch(branch_id),
	number_of_copies INT NOT NULL
);

INSERT INTO tbl_book_copies(book_id, branch_id, number_of_copies)
VALUES
	(1, 1, 2),
	(2, 1, 2),
	(3, 1, 2),
	(4, 1, 3),
	(5, 1, 2),
	(6, 1, 3),
	(7, 1, 2),
	(8, 1, 3),
	(24, 1, 3),
	(10, 1, 2),
	(11, 2, 4),
	(12, 2, 4),
	(13, 2, 2),
	(14, 2, 2),
	(15, 2, 2),
	(16, 2, 3),
	(17, 2, 2),
	(18, 2, 3),
	(25, 2, 3),
	(26, 2, 3),
	(21, 3, 4),
	(22, 3, 2),
	(23, 3, 2),
	(24, 3, 2),
	(25, 3, 2),
	(26, 3, 2),
	(1, 3, 3),
	(2, 3, 3),
	(3, 3, 2),
	(4, 3, 2),
	(5, 4, 2),
	(6, 4, 2),
	(7, 4, 2),
	(8, 4, 2),
	(9, 4, 2),
	(10, 4, 2),
	(11, 4, 2),
	(12, 4, 2),
	(13, 4, 2),
	(14, 4, 2),
	(15, 4, 2)
;

/* BOOK LOANS */

CREATE TABLE tbl_book_loans(
	book_id INT NOT NULL CONSTRAINT fk_book_id FOREIGN KEY REFERENCES tbl_books(book_id),
	branch_id INT NOT NULL CONSTRAINT fk_branch_id_tolibrarybranch_id FOREIGN KEY REFERENCES tbl_library_branch(branch_id),
	card_no INT NOT NULL CONSTRAINT fk_card_no FOREIGN KEY REFERENCES tbl_borrower(card_no),
	date_out VARCHAR(50) NOT NULL,
	date_due  VARCHAR(50) NOT NULL
);


INSERT INTO tbl_book_loans(book_id, branch_id, card_no, date_out, date_due)
VALUES
	(1, 1, 1, '12-12-2019', '12-19-2019'), 
	(2, 3, 1, '12-12-2019', '12-19-2019'),
	(3, 2, 1, '12-12-2019', '12-19-2019'),
	(4, 2, 2, '12-12-2019', '12-19-2019'),
	(5, 3, 2, '12-12-2019', '12-19-2019'),
	(6, 4, 2, '12-12-2019', '12-19-2019'),
	(7, 4, 2, '12-12-2019', '12-19-2019'),
	(8, 3, 3, '12-12-2019', '12-19-2019'),
	(9, 2, 3, '12-12-2019', '12-19-2019'),
	(10, 1, 3, '12-12-2019', '12-19-2019'),
	(11, 1, 3, '12-12-2019', '12-19-2019'),
	(12, 1, 4, '12-12-2019', '12-19-2019'),
	(13, 2, 4, '12-12-2019', '12-19-2019'),
	(14, 2, 4, '12-12-2019', '12-19-2019'),
	(15, 3, 4, '12-12-2019', '12-19-2019'),
	(16, 4, 5, '12-12-2019', '12-19-2019'),
	(17, 4, 5, '12-12-2019', '12-19-2019'),
	(18, 3, 5, '12-12-2019', '12-19-2019'),
	(19, 3, 5, '12-12-2019', '12-19-2019'),
	(20, 3, 6, '12-12-2019', '12-19-2019'),
	(21, 3, 6, '12-12-2019', '12-19-2019'),
	(22, 3, 6, '12-12-2019', '12-19-2019'),
	(23, 3, 6, '12-12-2019', '12-19-2019'),
	(24, 3, 7, '12-12-2019', '12-19-2019'),
	(1, 2, 7, '12-13-2019', '12-20-2019'),
	(2, 1, 7, '12-13-2019', '12-20-2019'),
	(3, 2, 7, '12-13-2019', '12-20-2019'),
	(4, 3, 1, '12-13-2019', '12-20-2019'),
	(5, 1, 2, '12-13-2019', '12-20-2019'),
	(6, 1, 3, '12-13-2019', '12-20-2019'),
	(7, 1, 4, '12-13-2019', '12-20-2019'),
	(8, 1, 1, '12-13-2019', '12-20-2019'),
	(9, 1, 1, '12-13-2019', '12-20-2019'),
	(10, 2, 1, '12-13-2019', '12-20-2019'),
	(11, 1, 2, '12-13-2019', '12-20-2019'),
	(12, 1, 2, '12-13-2019', '12-20-2019'),
	(13, 2, 2, '12-13-2019', '12-20-2019'),
	(14, 2, 2, '12-13-2019', '12-20-2019'),
	(15, 2, 3, '12-13-2019', '12-20-2019'),
	(16, 1, 3, '12-13-2019', '12-20-2019'),
	(17, 1, 3, '12-13-2019', '12-20-2019'),
	(18, 1, 3, '12-13-2019', '12-20-2019'),
	(19, 1, 4, '12-13-2019', '12-20-2019'),
	(20, 1, 4, '12-13-2019', '12-20-2019'),
	(21, 1, 4, '12-13-2019', '12-20-2019'),
	(22, 1, 4, '12-13-2019', '12-20-2019'),
	(23, 2, 5, '12-13-2019', '12-20-2019'),
	(24, 2, 5, '12-13-2019', '12-20-2019'),
	(1, 4, 5, '12-13-2019', '12-20-2019'),
	(2, 4, 5, '12-13-2019', '12-20-2019')
;

/* BORROWER */

CREATE TABLE tbl_borrower(
	card_no INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	name VARCHAR(50) NOT NULL,
	address VARCHAR(50) NOT NULL,
	phone VARCHAR(50) NOT NULL
);
 
INSERT INTO tbl_borrower (name, address, phone)
VALUES
	('James Smith', '1293 Oak Street', '239-340-2349'),
	('John Johnson', '9238 Maple Street', '343-345-4535'),
	('Robert Jones', '23rd Street', '345-543-5435'),
	('Michael Brown', '5423 Cedar Street', '345-453-2355'),
	('William Davis', '849 Lake Street', '234-454-4535'),
	('David Miller', 'Ninth Street', '234-543-5432'),
	('Richard Wilson', '69 View Street', '204-340-3450'),
	('Joeseph Moore', 'Washington Street', '540-340-3404')
;

SELECT * FROM tbl_library_branch;
SELECT * FROM tbl_publisher;
SELECT * FROM tbl_books;
SELECT * FROM tbl_book_author;
SELECT * FROM tbl_book_copies;
SELECT * FROM tbl_book_loans;
SELECT * FROM tbl_borrower;

DROP TABLE tbl_book_loans;
DROP TABLE tbl_borrower;
DROP TABLE tbl_book_copies;
DROP TABLE tbl_book_author;
DROP TABLE tbl_books;
DROP TABLE tbl_publisher;
DROP TABLE tbl_library_branch;

/* QUERIES
	#1	
	How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?*/
SELECT * FROM tbl_book_copies;
SELECT * FROM tbl_books;
SELECT * FROM tbl_library_branch;

SELECT title, branch_name, number_of_copies FROM tbl_books 
INNER JOIN tbl_book_copies ON tbl_books.book_id = tbl_book_copies.book_id
INNER JOIN tbl_library_branch ON tbl_book_copies.branch_id = tbl_library_branch.branch_id
WHERE title = 'The Lost Tribe' AND branch_name = 'Sharpstown';

/* #2
	How many copies of the book titled "The Lost Tribe are owned by each library branch? */

SELECT title, branch_name, number_of_copies FROM tbl_books 
INNER JOIN tbl_book_copies ON tbl_books.book_id = tbl_book_copies.book_id
INNER JOIN tbl_library_branch ON tbl_book_copies.branch_id = tbl_library_branch.branch_id
WHERE title = 'The Lost Tribe';

/* #3
Retrieve the names of all borrowers who do not have any books checked out */

SELECT * FROM tbl_book_loans;
SELECT * FROM tbl_borrower;

SELECT name, date_out, date_due FROM tbl_borrower
FULL OUTER JOIN tbl_book_loans ON tbl_borrower.card_no = tbl_book_loans.card_no
WHERE tbl_book_loans.card_no IS NULL;

/* #4
	For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, retrieve the book title,
	the borrower's name, and the borrower's address. */
SELECT * FROM tbl_borrower;
SELECT * FROM tbl_book_loans;
SELECT * FROM tbl_books;
SELECT * FROM tbl_library_branch;

SELECT title, name, tbl_borrower.address, branch_name, date_due FROM tbl_borrower
INNER JOIN tbl_book_loans ON tbl_borrower.card_no = tbl_book_loans.card_no
INNER JOIN tbl_books ON tbl_books.book_id = tbl_book_loans.book_id
INNER JOIN tbl_library_branch ON tbl_library_branch.branch_id = tbl_book_loans.branch_id
WHERE branch_name = 'Sharpstown' AND date_due = '12-20-2019';

/* #5 /* A. COUNT()  B. GROUP BY C. HAVING */
	For each library branch, retrieve the branch name and the total number of books loaned out from that branch. */
SELECT * FROM tbl_library_branch;
SELECT * FROM tbl_book_loans;

SELECT COUNT(*) AS 'COUNT', branch_name FROM tbl_library_branch
INNER JOIN tbl_book_loans ON tbl_library_branch.branch_id = tbl_book_loans.branch_id
GROUP BY branch_name; 

/* In this statement, the SELECT COUNT(*) funtion returns the number of rows in this query. 
AS 'COUNT' is a name for the COUNT(*) data column.
FROM tells which table to run the SELECT COUNT(*) AS 'COUNT' function. 
INNER JOIN combines two individual table and will display data from both tables.
ON is where the two tables being INNER JOIN (combined) has a matching values.
The tables must have correlating data to be INNER JOIN.
GROUP BY groups rows that have the same values into summary rows.

In summary, this query statement returns all the number of rows of each branch_name from the Library_Branch table and Book_Loans table.
*/

/* #6
	Retrieve the names addresses, and the number of books checked out from all borrowers who have more than five book checked out. */
SELECT * FROM tbl_book_loans;
SELECT * FROM tbl_borrower;

SELECT COUNT(*) AS 'Total Books Checked Out', name FROM tbl_book_loans
INNER JOIN tbl_borrower ON tbl_book_loans.card_no = tbl_borrower.card_no
GROUP BY name HAVING COUNT(*) > 5;

/*
This statement will return the number of rows of each card number's name from the table 'Book_Loans' and the table 'Borrower'.
However, the number of rows must be greater than 5. The number of row column will also be name 'Total Books CHecked Out'.
*/