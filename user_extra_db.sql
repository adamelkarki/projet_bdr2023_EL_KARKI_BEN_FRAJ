CREATE DATABASE user_extra_db;
\c user_extra_db;

CREATE TABLE user_extras (
    user_id INT PRIMARY KEY,
    favorite_hobby VARCHAR(100),
    account_creation_date DATE
);

INSERT INTO user_extras (user_id, favorite_hobby, account_creation_date) VALUES (1, 'reading', '2024-01-01');
INSERT INTO user_extras (user_id, favorite_hobby, account_creation_date) VALUES (2, 'swimming', '2024-02-01');

DELIMITER $$

CREATE OR REPLACE FUNCTION update_user_extra_last_modified()
RETURNS TRIGGER AS $$
BEGIN
    NEW.last_modified = NOW();
    RETURN NEW;
END $$

DELIMITER ;

CREATE TRIGGER before_update_user_extra
BEFORE UPDATE ON user_extras
FOR EACH ROW
EXECUTE FUNCTION update_user_extra_last_modified();
