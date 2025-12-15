INSERT INTO users (user_name, email, password_hash)
VALUES ('Ivyne', 'ivynemuzenda9@gmail.com', '221236');

INSERT INTO payments (user_id, amount)
VALUES (1, 150.00);

INSERT INTO project_metadata (user_id, title, project_status)
VALUES (1, 'psqlBurgundary Core', 'Active');