<?php
session_start();
include('../db_connection.php');

if (!isset($_SESSION['admin_logged_in'])) {
    header("Location: admin_login.php");
    exit();
}

// Fetch all notifications from the database
$query = "SELECT * FROM notifications";
$result = mysqli_query($conn, $query);

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $notification_id = $_POST['notification_id'];

    // Delete the notification
    $delete_query = "DELETE FROM notifications WHERE notification_id='$notification_id'";
    if (mysqli_query($conn, $delete_query)) {
        $success = "Notification deleted successfully!";
    } else {
        $error = "Error deleting notification: " . mysqli_error($conn);
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Notifications</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <h2 class="text-center mt-5">Manage Notifications</h2>
        <?php if (isset($success)) { ?>
            <div class="alert alert-success text-center">
                <?php echo $success; ?>
            </div>
        <?php } ?>
        <?php if (isset($error)) { ?>
            <div class="alert alert-danger text-center">
                <?php echo $error; ?>
            </div>
        <?php } ?>
        <table class="table table-bordered mt-4">
            <thead>
                <tr>
                    <th>Notification ID</th>
                    <th>User ID</th>
                    <th>Message</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <?php while ($row = mysqli_fetch_assoc($result)) { ?>
                <tr>
                    <td><?php echo $row['notification_id']; ?></td>
                    <td><?php echo $row['user_id']; ?></td>
                    <td><?php echo $row['message']; ?></td>
                    <td>
                        <form method="post">
                            <input type="hidden" name="notification_id" value="<?php echo $row['notification_id']; ?>">
                            <button type="submit" class="btn btn-danger btn-block">Delete</button>
                        </form>
                    </td>
                </tr>
                <?php } ?>
            </tbody>
        </table>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
