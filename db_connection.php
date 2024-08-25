<?php
$servername = "localhost";
$db_username = "your_db_username";
$db_password = "your_db_password";
$dbname = "bitcoin_broker";

// Create connection
$conn = new mysqli($servername, $db_username, $db_password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
