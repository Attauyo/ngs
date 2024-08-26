<?php
$servername = "sql103.infinityfree.com"; // Your database server address
$username = "if0_37180302";        // Your MySQL username
$password = "09058176690ol";          // Your MySQL password
$dbname = "if0_37180302_bit";          // Your database name

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
