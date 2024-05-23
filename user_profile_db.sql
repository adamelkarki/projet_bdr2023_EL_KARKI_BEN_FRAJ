CREATE DATABASE user_profile_db;
\c user_profile_db;

CREATE TABLE user_profile (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    address VARCHAR(256)
);

INSERT INTO user_profile (username, email, date_of_birth, address) VALUES ('john_doe', 'john.doe@example.com', '1980-01-01', '123 Main St');
INSERT INTO user_profile (username, email, date_of_birth, address) VALUES ('jane_smith', 'jane.smith@example.com', '1990-02-02', '456 Elm St');

DELIMITER $$

CREATE OR REPLACE FUNCTION update_profile_last_modified()
RETURNS TRIGGER AS $$
BEGIN
    NEW.last_modified = NOW();
    RETURN NEW;
END $$

DELIMITER ;

CREATE TRIGGER before_update_profile
BEFORE UPDATE ON user_profile
FOR EACH ROW
EXECUTE FUNCTION update_profile_last_modified();
