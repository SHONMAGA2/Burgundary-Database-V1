ALTER TABLE payments
ADD FOREIGN KEY (user_id)
REFERENCES users(user_id)
ON DELETE CASCADE;

ALTER TABLE project_metadata
ADD FOREIGN KEY (user_id)
REFERENCES users(user_id)
ON DELETE CASCADE;