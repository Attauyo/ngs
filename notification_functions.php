<?php
function add_notification($conn, $message, $type, $recipient, $recipient_username) {
    $stmt = $conn->prepare("INSERT INTO notifications (message, type, recipient, recipient_username) VALUES (?, ?, ?, ?)");
    $stmt->bind_param("ssss", $message, $type, $recipient, $recipient_username);
    $stmt->execute();
    $stmt->close();
}

function get_notifications($conn, $recipient, $username) {
    $stmt = $conn->prepare("SELECT * FROM notifications WHERE recipient = ? AND recipient_username = ?");
    $stmt->bind_param("ss", $recipient, $username);
    $stmt->execute();
    $result = $stmt->get_result();
    $notifications = $result->fetch_all(MYSQLI_ASSOC);
    $stmt->close();
    return $notifications;
}
?>
