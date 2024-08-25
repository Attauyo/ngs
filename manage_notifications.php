<?php
session_start();
include '../includes/db_connection.php';

// Check if admin is logged in
if (!isset($_SESSION['admin_username'])) {
    header("Location: admin_login.php");
    exit();
}

// Handle notification deletion
if (isset($_GET['delete'])) {
    $notification_id = intval($_GET['delete']);
    $deleteSql = "DELETE FROM notifications WHERE notification_id = ?";
    $stmt = $conn->prepare($deleteSql);
    $stmt->bind_param("i", $notification_id);
    if ($stmt->execute()) {
        echo "Notification deleted successfully.";
    } else {
        echo "Error: " . $stmt->error;
    }
    $stmt->close();
}

// Handle new notification
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $message = $_POST['message'];
    $type = $_POST['type'];
    $recipient = $_POST['recipient'];
    $recipient_username = $_POST['recipient_username'];

    $insertSql = "INSERT INTO notifications (message, type, recipient, recipient_username) VALUES (?, ?, ?, ?)";
    $stmt = $conn->prepare($insertSql);
    $stmt->bind_param("ssss", $message, $type, $recipient, $recipient_username);
    if ($stmt->execute()) {
        echo "Notification created successfully.";
    } else {
        echo "Error: " . $stmt->error;
    }
    $stmt->close();
}

// Fetch notifications
$fetchSql = "SELECT * FROM notifications ORDER BY date DESC";
$notificationsResult = $conn->query($fetchSql);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="../assets/css/style.css" rel="stylesheet">
    <title>Manage Notifications</title>
</head>
<body>
    <div class="container mt-5">
        <h2>Manage Notifications</h2>

        <!-- Notification Creation Form -->
        <h3>Create New Notification</h3>
        <form action="" method="POST">
            <div class="mb-3">
                <label for="message" class="form-label">Message</label>
                <textarea class="form-control" id="message" name="message" rows="3" required></textarea>
            </div>
            <div class="mb-3">
                <label for="type" class="form-label">Type</label>
                <select class="form-select" id="type" name="type" required>
                    <option value="info">Info</option>
                    <option value="success">Success</option>
                    <option value="warning">Warning</option>
                    <option value="error">Error</option>
                </select>
            </div>
            <div class="mb-3">
                <label for="recipient" class="form-label">Recipient</label>
                <select class="form-select" id="recipient" name="recipient" required>
                    <option value="admin">Admin</option>
                    <option value="user">User</option>
                </select>
            </div>
            <div class="mb-3">
                <label for="recipient_username" class="form-label">Recipient Username</label>
                <input type="text" class="form-control" id="recipient_username" name="recipient_username" required>
            </div>
            <button type="submit" class="btn btn-primary">Create Notification</button>
        </form>

        <!-- Notifications Table -->
        <h3 class="mt-5">Notification List</h3>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Message</th>
                    <th>Type</th>
                    <th>Recipient</th>
                    <th>Recipient Username</th>
                    <th>Date</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <?php while ($notification = $notificationsResult->fetch_assoc()): ?>
                <tr>
                    <td><?php echo $notification['notification_id']; ?></td>
                    <td><?php echo htmlspecialchars($notification['message']); ?></td>
                    <td><?php echo htmlspecialchars($notification['type']); ?></td>
                    <td><?php echo htmlspecialchars($notification['recipient']); ?></td>
                    <td><?php echo htmlspecialchars($notification['recipient_username']); ?></td>
                    <td><?php echo $notification['date']; ?></td>
                    <td>
                        <a href="?delete=<?php echo $notification['notification_id']; ?>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this notification?');">Delete</a>
                    </td>
                </tr>
                <?php endwhile; ?>
            </tbody>
        </table>

        <a href="admin_dashboard.php" class="btn btn-secondary">Back to Dashboard</a>
    </div>

    <script src="../assets/js/bootstrap.bundle.min.js"></script>
</body>
</html>
