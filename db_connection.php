<?php
$servername = "sql200.infinityfree.com";
$db_username = "if0_37174167";
$db_password = "09058176690Ol";
$dbname = "if0_37174167_bitcoin";

// Create connection
$conn = new mysqli($servername, $db_username, $db_password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
