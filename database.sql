CREATE DATABASE school_projects;
USE school_projects;

CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE categories (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    description TEXT
);

CREATE TABLE posts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    content TEXT,
    category_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

CREATE TABLE images (
    id INT PRIMARY KEY AUTO_INCREMENT,
    post_id INT,
    image_path VARCHAR(255),
    FOREIGN KEY (post_id) REFERENCES posts(id)
);

CREATE TABLE sessions (
    id VARCHAR(255) PRIMARY KEY,
    user_id INT,
    ip_address VARCHAR(45),
    user_agent TEXT,
    payload TEXT,
    last_activity INT,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Vložení základních dat
INSERT INTO categories (name, description) VALUES 
('Vývojáři', 'Sekce pro programátory a vývojáře software'),
('Grafici', 'Sekce pro grafické designéry a umělce'),
('Filmaři', 'Sekce pro tvůrce videí a filmů');

INSERT INTO users (username, password) VALUES 
('admin', '$2y$10$YourHashedPasswordHere'); 