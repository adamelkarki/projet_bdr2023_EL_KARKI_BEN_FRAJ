CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL
);

-- user_db.sql
INSERT INTO users (username, email) VALUES ('john_doe', 'john.doe@example.com');
INSERT INTO users (username, email) VALUES ('jane_smith', 'jane.smith@example.com');
