

-- Drop existing tables if they exist (use with caution in production)
DROP TABLE IF EXISTS notifications;
DROP TABLE IF EXISTS investments;
DROP TABLE IF EXISTS admins;
DROP TABLE IF EXISTS users;

-- Users table
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    balance DECIMAL(15, 2) DEFAULT 0.00
);

-- Admins table
CREATE TABLE IF NOT EXISTS admins (
    admin_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- Investments table
CREATE TABLE IF NOT EXISTS investments (
    investment_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    amount DECIMAL(15, 2) NOT NULL,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (username) REFERENCES users(username) ON DELETE CASCADE
);

-- Notifications table
CREATE TABLE IF NOT EXISTS notifications (
    notification_id INT AUTO_INCREMENT PRIMARY KEY,
    message TEXT NOT NULL,
    type ENUM('info', 'success', 'warning', 'error') NOT NULL,
    recipient ENUM('admin', 'user') NOT NULL,
    recipient_username VARCHAR(50) NOT NULL,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (recipient_username) REFERENCES users(username)
);

-- Insert example users
INSERT INTO users (username, password, balance) VALUES
('user1', 'password123', 1000.00),
('user2', 'password456', 2000.00);

-- Insert example admins
INSERT INTO admins (username, password) VALUES
('admin1', 'adminpass123'),
('admin2', 'adminpass456');

-- Insert example investments
INSERT INTO investments (username, amount, date) VALUES
('user1', 100.00, NOW()),
('user2', 200.00, NOW());

-- Insert example notifications
INSERT INTO notifications (message, type, recipient, recipient_username, date) VALUES
('Investment successful!', 'success', 'user', 'user1', NOW()),
('Your balance is low.', 'warning', 'user', 'user2', NOW()),
('Admin login attempt.', 'info', 'admin', 'admin1', NOW());
