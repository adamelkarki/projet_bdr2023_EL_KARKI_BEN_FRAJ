CREATE TABLE user_extras (
    user_id INT PRIMARY KEY,
    favorite_hobby VARCHAR(100),
    account_creation_date DATE
);

-- user_extra_db.sql
INSERT INTO user_extras (user_id, favorite_hobby, account_creation_date) VALUES (1, 'reading', '2024-01-01');
INSERT INTO user_extras (user_id, favorite_hobby, account_creation_date) VALUES (2, 'swimming', '2024-02-01');
