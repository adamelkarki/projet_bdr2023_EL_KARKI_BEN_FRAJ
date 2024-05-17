CREATE DATABASE asia_db;
\c asia_db;

CREATE TABLE tickets (
    id INT PRIMARY KEY AUTO_INCREMENT,
    evenement VARCHAR(100) NOT NULL,
    date DATE NOT NULL,
    price INT NOT NULL,
    seat VARCHAR(50) NOT NULL,
    category VARCHAR(50) NOT NULL,
    region VARCHAR(50) NOT NULL,
    venue VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL,
    user_id INT
);

INSERT INTO tickets (evenement, date, price, seat, category, region, venue, city, country, user_id) VALUES
('Concert C', '2024-05-03', 100, 'C3', 'VIP', 'Asia', 'Hall C', 'Beijing', 'China', 3),
('Concert D', '2024-05-04', 80, 'D4', 'Regular', 'Asia', 'Theater D', 'Bangkok', 'Thailand', 4),
('Concert E', '2024-05-05', 95, 'E5', 'VIP', 'Asia', 'Opera E', 'Kuala Lumpur', 'Malaysia', 5),
('Concert F', '2024-05-06', 60, 'F6', 'Regular', 'Asia', 'Venue F', 'Singapore', 'Singapore', 6),
('Concert G', '2024-05-07', 85, 'G7', 'VIP', 'Asia', 'Club G', 'Jakarta', 'Indonesia', 7),
('Concert H', '2024-05-08', 75, 'H8', 'Regular', 'Asia', 'Park H', 'Manila', 'Philippines', 8),
('Concert I', '2024-05-09', 100, 'I9', 'VIP', 'Asia', 'Ground I', 'Mumbai', 'India', 9),
('Concert J', '2024-05-10', 65, 'J10', 'Regular', 'Asia', 'Field J', 'Hanoi', 'Vietnam', 10);

CREATE USER 'region_user'@'%' IDENTIFIED BY 'region_password';
GRANT ALL PRIVILEGES ON europe_db.* TO 'region_user'@'%';
GRANT ALL PRIVILEGES ON america_db.* TO 'region_user'@'%';
GRANT ALL PRIVILEGES ON asia_db.* TO 'region_user'@'%';
GRANT ALL PRIVILEGES ON africa_db.* TO 'region_user'@'%';
FLUSH PRIVILEGES;

DELIMITER $$

CREATE PROCEDURE GetUsersInAsia()
BEGIN
    SELECT *
    FROM user_db.users
    WHERE region = 'Asia';
END $$

DELIMITER ;
