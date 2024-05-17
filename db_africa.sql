CREATE DATABASE africa_db;
\c africa_db;

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
('Concert C', '2024-05-03', 75, 'C3', 'VIP', 'Africa', 'Hall C', 'Nairobi', 'Kenya', 3),
('Concert D', '2024-05-04', 55, 'D4', 'Regular', 'Africa', 'Theater D', 'Lagos', 'Nigeria', 4),
('Concert E', '2024-05-05', 70, 'E5', 'VIP', 'Africa', 'Opera E', 'Casablanca', 'Morocco', 5),
('Concert F', '2024-05-06', 50, 'F6', 'Regular', 'Africa', 'Venue F', 'Accra', 'Ghana', 6),
('Concert G', '2024-05-07', 65, 'G7', 'VIP', 'Africa', 'Club G', 'Addis Ababa', 'Ethiopia', 7),
('Concert H', '2024-05-08', 45, 'H8', 'Regular', 'Africa', 'Park H', 'Dakar', 'Senegal', 8),
('Concert I', '2024-05-09', 85, 'I9', 'VIP', 'Africa', 'Ground I', 'Tunis', 'Tunisia', 9),
('Concert J', '2024-05-10', 60, 'J10', 'Regular', 'Africa', 'Field J', 'Algiers', 'Algeria', 10);

CREATE USER 'region_user'@'%' IDENTIFIED BY 'region_password';
GRANT ALL PRIVILEGES ON europe_db.* TO 'region_user'@'%';
GRANT ALL PRIVILEGES ON america_db.* TO 'region_user'@'%';
GRANT ALL PRIVILEGES ON asia_db.* TO 'region_user'@'%';
GRANT ALL PRIVILEGES ON africa_db.* TO 'region_user'@'%';
FLUSH PRIVILEGES;

DELIMITER $$

CREATE PROCEDURE GetUsersInAfrica()
BEGIN
    SELECT *
    FROM user_db.users
    WHERE region = 'Africa';
END $$

DELIMITER ;
