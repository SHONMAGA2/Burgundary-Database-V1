-- Users table
CREATE TABLE users (
    user_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    user_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(200) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Payments table
CREATE TABLE payments (
    payment_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    user_id BIGINT REFERENCES users(user_id),
    amount DOUBLE PRECISION NOT NULL DEFAULT 0,
    currency VARCHAR(10) NOT NULL DEFAULT 'ZAR',
    payment_status VARCHAR(20) NOT NULL DEFAULT 'Inactive',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Project metadata table
CREATE TABLE project_metadata (
    project_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    user_id BIGINT REFERENCES users(user_id),
    title VARCHAR(100) NOT NULL DEFAULT 'My Project',
    project_description VARCHAR(500),
    project_status VARCHAR(10) NOT NULL DEFAULT 'Inactive',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);