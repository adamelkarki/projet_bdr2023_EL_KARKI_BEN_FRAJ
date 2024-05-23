CREATE DATABASE user_payment_db;
\c user_payment_db;

CREATE TABLE user_payment (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date TIMESTAMP DEFAULT NOW()
);

INSERT INTO user_payment (user_id, amount) VALUES (1, 99.99);
INSERT INTO user_payment (user_id, amount) VALUES (2, 49.99);

DELIMITER $$

CREATE OR REPLACE FUNCTION update_payment_date()
RETURNS TRIGGER AS $$
BEGIN
    NEW.payment_date = NOW();
    RETURN NEW;
END $$

DELIMITER ;

CREATE TRIGGER before_update_payment
BEFORE UPDATE ON user_payment
FOR EACH ROW
EXECUTE FUNCTION update_payment_date();
