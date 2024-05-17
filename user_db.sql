CREATE DATABASE user_db;
\c user_db;

CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL
);

INSERT INTO users (username, email) VALUES ('john_doe', 'john.doe@example.com');
INSERT INTO users (username, email) VALUES ('jane_smith', 'jane.smith@example.com');

DELIMITER $$

CREATE OR REPLACE FUNCTION update_user_last_modified()
RETURNS TRIGGER AS $$
BEGIN
    NEW.last_modified = NOW();
    RETURN NEW;
END $$

DELIMITER ;

CREATE TRIGGER before_update_user
BEFORE UPDATE ON users
FOR EACH ROW
EXECUTE FUNCTION update_user_last_modified();
