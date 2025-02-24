-- Create the database
CREATE DATABASE IF NOT EXISTS graphical_auth;
USE graphical_auth;

-- Users table to store user credentials
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Images table to store images used for authentication
CREATE TABLE IF NOT EXISTS images (
    id INT AUTO_INCREMENT PRIMARY KEY,
    image_name VARCHAR(100) UNIQUE NOT NULL,
    image_path VARCHAR(255) NOT NULL
);

-- Click points table to store user-selected points on images
CREATE TABLE IF NOT EXISTS click_points (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    image_id INT NOT NULL,
    x_coordinate INT NOT NULL,
    y_coordinate INT NOT NULL,
    sequence_order INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (image_id) REFERENCES images(id) ON DELETE CASCADE
);

-- Sample Data Insertion
INSERT INTO images (image_name, image_path) VALUES
('image1', 'images/image1.jpg'),
('image2', 'images/image2.jpg'),
('image3', 'images/image3.jpg'),
('image4', 'images/image4.jpg'),
('image5', 'images/image5.jpg');





