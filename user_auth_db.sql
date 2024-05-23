CREATE DATABASE user_auth_db;
\c user_auth_db;

CREATE TABLE user_auth (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password_hash VARCHAR(256) NOT NULL,
    auth_token VARCHAR(256)
);

INSERT INTO user_auth (username, password_hash, auth_token) VALUES ('john_doe', 'hashed_password1', 'token1');
INSERT INTO user_auth (username, password_hash, auth_token) VALUES ('jane_smith', 'hashed_password2', 'token2');

DELIMITER $$

CREATE OR REPLACE FUNCTION update_auth_token()
RETURNS TRIGGER AS $$
BEGIN
    NEW.auth_token = md5(random()::text);
    RETURN NEW;
END $$

DELIMITER ;

CREATE TRIGGER before_update_auth
BEFORE UPDATE ON user_auth
FOR EACH ROW
EXECUTE FUNCTION update_auth_token();
