<?php
session_start();
include '../includes/db_connection.php';

if (!isset($_SESSION['admin_username'])) {
    header("Location: admin_login.php");
    exit();
}

$investmentSql = "SELECT * FROM investments";
$investmentResult = $conn->query($investmentSql);

$notificationSql = "SELECT * FROM notifications WHERE recipient = 'admin'";
$notificationResult = $conn->query($notificationSql);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet">
    <title>Admin Dashboard</title>
</head>
<body>
    <div class="container mt-5">
        <h2>Admin Dashboard</h2>

        <h3>Manage Investments</h3>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>Amount</th>
                    <th>Date</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <?php while ($investment = $investmentResult->fetch_assoc()): ?>
                <tr>
                    <td><?php echo $investment['investment_id']; ?></td>
                    <td><?php echo $investment['username']; ?></td>
                    <td>$<?php echo number_format($investment['amount'], 2); ?></td>
                    <td><?php echo $investment['date']; ?></td>
                    <td><a href="manage_investments.php?delete_id=<?php echo $investment['investment_id']; ?>" class="btn btn-danger">Delete</a></td>
                </tr>
                <?php endwhile; ?>
            </tbody>
        </table>

        <h3>Notifications</h3>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Message</th>
                    <th>Type</th>
                    <th>Date</th>
                </tr>
            </thead>
            <tbody>
                <?php while ($notification = $notificationResult->fetch_assoc()): ?>
                <tr>
                    <td><?php echo $notification['notification_id']; ?></td>
                    <td><?php echo $notification['message']; ?></td>
                    <td><?php echo ucfirst($notification['type']); ?></td>
                    <td><?php echo $notification['date']; ?></td>
                </tr>
                <?php endwhile; ?>
            </tbody>
        </table>

        <a href="admin_logout.php" class="btn btn-danger">Logout</a>
    </div>
</body>
</html>
