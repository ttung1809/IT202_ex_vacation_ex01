CREATE DATABASE book_worm;
USE book_worm;

CREATE TABLE authors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(150) NOT NULL,
    birth_year INT,
    nationality VARCHAR(100)
);
CREATE TABLE books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    book_name VARCHAR(200) NOT NULL,
    category VARCHAR(100),
    author_id INT,
    price DECIMAL(10,2) NOT NULL DEFAULT 0,
    publish_year INT,

    CONSTRAINT chk_price CHECK (price >= 0),

    CONSTRAINT fk_books_authors
    FOREIGN KEY (author_id)
    REFERENCES authors(id)
    ON DELETE SET NULL
);
CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(150) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    phone VARCHAR(20) NOT NULL UNIQUE,
    registration_date DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO authors (full_name, birth_year, nationality) VALUES
('Nguyen Nhat Anh', 1955, 'Vietnam'),
('Agatha Christie', 1890, 'British'),
('Dale Carnegie', 1888, 'American');

INSERT INTO books (book_name, category, author_id, price, publish_year) VALUES
('Mat Biec', 'Van hoc', 1, 50000, 1990),
('Toi thay hoa vang tren co xanh', 'Van hoc', 1, 60000, 2010),
('Then There Were None', 'Trinh tham', 2, 80000, 1939),
('Murder on the Orient Express', 'Trinh tham', 2, 90000, 1934),
('How to Win Friends', 'Ky nang', 3, 100000, 1936),
('Stop Worrying and Start Living', 'Ky nang', 3, 95000, 1948),
('Sherlock Holmes', 'Trinh tham', NULL, 70000, 1892),
('Clean Code', 'Ky nang', NULL, 120000, 2008);

INSERT INTO customers (full_name, email, phone) VALUES
('Tran Van A', 'a@gmail.com', '0900000001'),
('Le Thi B', 'b@gmail.com', '0900000002'),
('Pham Van C', 'c@gmail.com', '0900000003'),
('Hoang Thi D', 'd@gmail.com', '0900000004'),
('Nguyen Van E', 'e@gmail.com', '0900000005');

