CREATE database cinema_manager;
use cinema_manager;

CREATE TABLE movies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    duration_minutes INT NOT NULL CHECK (duration_minutes > 0),
    age_restriction INT DEFAULT 0,
    
    CHECK (age_restriction IN (0, 13, 16, 18))
);

CREATE TABLE rooms (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    max_seats INT NOT NULL CHECK (max_seats > 0),
    status VARCHAR(20) DEFAULT 'active',
    
    CHECK (status IN ('active', 'maintenance'))
);

CREATE TABLE showtimes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT NOT NULL,
    room_id INT NOT NULL,
    show_time DATETIME NOT NULL,
    ticket_price DECIMAL(10,2) NOT NULL CHECK (ticket_price >= 0),
    
    FOREIGN KEY (movie_id) REFERENCES movies(id)
        ON DELETE CASCADE,
        
    FOREIGN KEY (room_id) REFERENCES rooms(id)
        ON DELETE CASCADE
);

CREATE TABLE bookings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    showtime_id INT NOT NULL,
    customer_name VARCHAR(255) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    booking_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (showtime_id) REFERENCES showtimes(id)
        ON DELETE CASCADE
);

INSERT INTO Movie (MovieName, Genre, Duration, AgeRating)
VALUES 
('Avengers: Secret Wars', 'Action', 150, 'P'),
('Lật Mặt 7', 'Drama', 130, 'P'),
('The Nun 2', 'Horror', 110, 'P'),
('Deadpool 3', 'Action-Comedy', 140, 'C18');

INSERT INTO Room (RoomName, Capacity, Status)
VALUES
('Room 1', 100, 'active'),
('Room 2', 80, 'maintenance'),
('Room 3', 120, 'active');

INSERT INTO Showtime (MovieID, RoomID, ShowDate, ShowTime)
VALUES
(1, 1, '2026-05-01', '18:00:00'),
(2, 3, '2026-05-01', '19:00:00'),
(3, 1, '2026-05-02', '20:00:00'),
(4, 3, '2026-05-02', '21:00:00'),
(1, 1, '2026-05-03', '17:00:00');

INSERT INTO Ticket (ShowtimeID, SeatNumber, Price)
VALUES
(1, 'A1', 90000),
(1, 'A2', 90000),
(2, 'B1', 85000),
(2, 'B2', 85000),
(3, 'C1', 80000),
(3, 'C2', 80000),
(4, 'D1', 95000),
(4, 'D2', 95000),
(5, 'E1', 90000),
(5, 'E2', 90000);