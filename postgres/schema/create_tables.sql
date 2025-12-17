--Users table
CREATE TABLE auth.users (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(200) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

--Project metadata table
CREATE TABLE core.project_metadata (
    project_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES auth.users(user_id) ON DELETE CASCADE,
    title VARCHAR(100) NOT NULL DEFAULT 'My Project',
    project_description VARCHAR(500),
    project_status VARCHAR(10) NOT NULL DEFAULT 'Inactive',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE billing.payments (
    payment_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES auth.users(user_id) ON DELETE CASCADE,
    amount NUMERIC(10,2) NOT NULL DEFAULT 0,
    currency VARCHAR(10) NOT NULL DEFAULT 'ZAR',
    payment_status VARCHAR(20) NOT NULL DEFAULT 'Inactive',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
