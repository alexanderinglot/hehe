CREATE USER postgres WITH PASSWORD 'postgres';
CREATE DATABASE test;
GRANT ALL PRIVILEGES ON DATABASE test TO postgres;

-- Tworzenie tabeli użytkowników
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL
);

-- Dodanie przykładowego użytkownika
INSERT INTO users (username, email) VALUES ('john_doe', 'john.doe@example.com');
