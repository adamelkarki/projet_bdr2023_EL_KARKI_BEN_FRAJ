CREATE DATABASE user_activity_db;
\c user_activity_db;

CREATE TABLE user_activity (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    activity VARCHAR(256) NOT NULL,
    activity_time TIMESTAMP DEFAULT NOW()
);

INSERT INTO user_activity (user_id, activity) VALUES (1, 'login');
INSERT INTO user_activity (user_id, activity) VALUES (2, 'purchase');

DELIMITER $$

CREATE OR REPLACE FUNCTION update_activity_time()
RETURNS TRIGGER AS $$
BEGIN
    NEW.activity_time = NOW();
    RETURN NEW;
END $$

DELIMITER ;

CREATE TRIGGER before_update_activity
BEFORE UPDATE ON user_activity
FOR EACH ROW
EXECUTE FUNCTION update_activity_time();
