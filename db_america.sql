CREATE DATABASE america_db;
\c america_db;

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
('Concert C', '2024-05-03', 110, 'C3', 'VIP', 'America', 'Hall C', 'Chicago', 'USA', 3),
('Concert D', '2024-05-04', 100, 'D4', 'Regular', 'America', 'Theater D', 'Houston', 'USA', 4),
('Concert E', '2024-05-05', 95, 'E5', 'VIP', 'America', 'Opera E', 'Toronto', 'Canada', 5),
('Concert F', '2024-05-06', 85, 'F6', 'Regular', 'America', 'Venue F', 'Mexico City', 'Mexico', 6),
('Concert G', '2024-05-07', 105, 'G7', 'VIP', 'America', 'Club G', 'Buenos Aires', 'Argentina', 7),
('Concert H', '2024-05-08', 75, 'H8', 'Regular', 'America', 'Park H', 'Sao Paulo', 'Brazil', 8),
('Concert I', '2024-05-09', 115, 'I9', 'VIP', 'America', 'Ground I', 'Lima', 'Peru', 9),
('Concert J', '2024-05-10', 65, 'J10', 'Regular', 'America', 'Field J', 'Santiago', 'Chile', 10);

CREATE USER 'region_user'@'%' IDENTIFIED BY 'region_password';
GRANT ALL PRIVILEGES ON europe_db.* TO 'region_user'@'%';
GRANT ALL PRIVILEGES ON america_db.* TO 'region_user'@'%';
GRANT ALL PRIVILEGES ON asia_db.* TO 'region_user'@'%';
GRANT ALL PRIVILEGES ON africa_db.* TO 'region_user'@'%';
FLUSH PRIVILEGES;

DELIMITER $$

CREATE PROCEDURE GetUsersInAmerica()
BEGIN
    SELECT *
    FROM user_db.users
    WHERE region = 'America';
END $$

DELIMITER ;
