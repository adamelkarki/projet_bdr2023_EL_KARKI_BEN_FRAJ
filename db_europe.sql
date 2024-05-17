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
('Concert C', '2024-05-03', 70, 'C3', 'VIP', 'Europe', 'Hall C', 'Berlin', 'Germany', 3),
('Concert D', '2024-05-04', 90, 'D4', 'Regular', 'Europe', 'Theater D', 'Madrid', 'Spain', 4),
('Concert E', '2024-05-05', 60, 'E5', 'VIP', 'Europe', 'Opera E', 'Rome', 'Italy', 5),
('Concert F', '2024-05-06', 50, 'F6', 'Regular', 'Europe', 'Venue F', 'Amsterdam', 'Netherlands', 6),
('Concert G', '2024-05-07', 85, 'G7', 'VIP', 'Europe', 'Club G', 'Brussels', 'Belgium', 7),
('Concert H', '2024-05-08', 75, 'H8', 'Regular', 'Europe', 'Park H', 'Vienna', 'Austria', 8),
('Concert I', '2024-05-09', 95, 'I9', 'VIP', 'Europe', 'Ground I', 'Zurich', 'Switzerland', 9),
('Concert J', '2024-05-10', 65, 'J10', 'Regular', 'Europe', 'Field J', 'Stockholm', 'Sweden', 10);

CREATE USER 'region_user'@'%' IDENTIFIED BY 'region_password';
GRANT ALL PRIVILEGES ON europe_db.* TO 'region_user'@'%';
GRANT ALL PRIVILEGES ON america_db.* TO 'region_user'@'%';
GRANT ALL PRIVILEGES ON asia_db.* TO 'region_user'@'%';
GRANT ALL PRIVILEGES ON africa_db.* TO 'region_user'@'%';
FLUSH PRIVILEGES;

DELIMITER $$

CREATE PROCEDURE GetUsersInEurope()
BEGIN
    SELECT *
    FROM user_db.users
    WHERE region = 'Europe';
END $$

DELIMITER ;
