-- Users table
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
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
-- Create the transactions table
CREATE TABLE transactions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    type ENUM('deposit', 'withdrawal', 'investment') NOT NULL,
    amount DECIMAL(15, 2) NOT NULL,
    date DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('pending', 'completed', 'failed') DEFAULT 'completed',
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Insert example data for testing
INSERT INTO transactions (user_id, type, amount, status)
VALUES 
(1, 'deposit', 100.00, 'completed'),
(2, 'investment', 50.00, 'completed'),
(3, 'withdrawal', 20.00, 'pending');


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
(1,'charity', 'charity', 1000.00),
(2,'user2', 'password456', 2000.00);

-- Insert example admins
INSERT INTO admins (username, password) VALUES
(1, 'admin', 'admin'),

-- Insert example notifications
INSERT INTO notifications (message, type, recipient, recipient_username, date) VALUES
(1, 'Investment successful!', 'success', 'user', 'user1', NOW()),
(2, 'Your balance is low.', 'warning', 'user', 'user2', NOW()),
(3, 'Admin login attempt.', 'info', 'admin', 'admin1', NOW());
