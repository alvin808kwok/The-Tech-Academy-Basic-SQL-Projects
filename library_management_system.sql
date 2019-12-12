CREATE DATABASE library_mng_system

USE library_mng_system

CREATE TABLE tbl_library_branch(
	branch_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	branch_name VARCHAR(50) NOT NULL,
	address VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_publisher(
	publisher_name VARCHAR(50) PRIMARY KEY NOT NULL,
	address VARCHAR(50) NOT NULL,
	phone VARCHAR NOT NULL
);

CREATE TABLE tbl_books(
	book_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	title VARCHAR(50) NOT NULL,
	publisher_name VARCHAR(50) NOT NULL CONSTRAINT fk_publisher_name FOREIGN KEY REFERENCES tbl_publisher(publisher_name)
);

CREATE TABLE tbl_book_author(
	book_id INT NOT NULL CONSTRAINT fk_book_id FOREIGN KEY REFERENCES tbl_books(book_id),
	author_name VARCHAR(50)
);

CREATE TABLE tbl_book_copies(
	book_id VARCHAR(50) NOT NULL CONSTRAINT fk_title FOREIGN KEY REFERENCES tbl_books(title),
	branch_id INT NOT NULL CONSTRAINT fk_branch_id FOREIGN KEY REFERENCES tbl_library_branch(branch_id),
	number_of_copies INT NOT NULL
);

CREATE TABLE tbl_book_loans(
	book_id VARCHAR(50) NOT NULL CONSTRAINT fk_title FOREIGN KEY REFERENCES tbl_books(title),
	branch_id INT NOT NULL CONSTRAINT fk_branch_id FOREIGN KEY REFERENCES tbl_library_branch(branch_id),
	card_no INT NOT NULL CONSTRAINT fk_card_no FOREIGN KEY REFERENCES tbl_borrower(card_no),
	date_out DATE NOT NULL,
	date_due DATE NOT NULL
);

CREATE TABLE tbl_borrower(
	card_no INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	name VARCHAR(50) NOT NULL,
	address VARCHAR(50) NOT NULL,
	phone VARCHAR(50) NOT NULL
);

INSERT INTO tbl_library_branch(branch_name)
VALUES
	('Sharpstown'),
	('Central')
;

INSERT INTO tbl_books(title)
VALUES
	('Don Quixote'),
	('A Tale of Two Cities'),
	('The Lord of the Rings'),
	('The Little Prince'),
	('Harry Potter and the Sorcerer''s Stone'),
	('And Then There Were None'),
	('The Dream of the Red Chamber'),
	('The Hobbit'),
	('She: A History of Adventure'),
	('The Lion, the Witch and the Wardrobe'),
	('The Da Vinci Code'),
	('Think and Grow Rich'),
	('Harry Potter and the Half-Blood Prince'),
	('The Catcher in the Rye'),
	('The Alchemist'),
	('Harry Potter and the Chamber of Secrets'),
	('Harry Potter and the Prisoner of Azkaban'),
	('Harry Potter and the Goblet of FIre'),
	('Harry Potter and the Deathly Hallows'),
	('One Hundred Years of Solitude'),
	('Lolita'),
	('Anne of Green Gables'),
	('Charlotte''s Web'),
	('Black Beauty')
;

INSERT INTO tbl_book_author(author_name)
VALUES
	('Miguel de Cervantes'),
	('Chalres Dickens'),
	('J.R.R. Tolkien'),
	('Antoine de Saint-Exupery'),
	('J.K. Rowling'),
	('Agatha Christie'),
	('Cao Xueqin'),
	('J.R.R. Tolkien'),
	('H. Rider Haggard'),
	('C.S. Lewis'),
	('Dan Brown'),
	('Napolean Hill'),
	('J.K. Rowling'),
	('J.D. Salinger'),
	('Paulo Coelho'),
	('J.K. Rowling'),
	('J.K. Rowling'),
	('J.K. Rowling'),
	('J.K. Rowling'),
	('Gabriel Garcia Marquez'),
	('Vladimir Nabokov'),
	('Lucy Maud Montgomery'),
	('E.B. White'),
	('Anna Sewell')
;
