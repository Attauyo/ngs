<?php
session_start();
include('../db_connection.php');

if (!isset($_SESSION['admin_logged_in'])) {
    header("Location: admin_login.php");
    exit();
}

// Fetch all investments from the database
$query = "SELECT * FROM investments";
$result = mysqli_query($conn, $query);

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $investment_id = $_POST['investment_id'];
    $new_status = $_POST['status'];

    // Update the investment status
    $update_query = "UPDATE investments SET status='$new_status' WHERE investment_id='$investment_id'";
    if (mysqli_query($conn, $update_query)) {
        $success = "Investment status updated successfully!";
    } else {
        $error = "Error updating status: " . mysqli_error($conn);
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Investments</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <h2 class="text-center mt-5">Manage Investments</h2>
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
                    <th>Investment ID</th>
                    <th>User ID</th>
                    <th>Amount</th>
                    <th>Date</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <?php while ($row = mysqli_fetch_assoc($result)) { ?>
                <tr>
                    <td><?php echo $row['investment_id']; ?></td>
                    <td><?php echo $row['user_id']; ?></td>
                    <td>$<?php echo $row['amount']; ?></td>
                    <td><?php echo $row['date']; ?></td>
                    <td><?php echo $row['status']; ?></td>
                    <td>
                        <form method="post">
                            <input type="hidden" name="investment_id" value="<?php echo $row['investment_id']; ?>">
                            <select name="status" class="form-control">
                                <option value="Pending" <?php if ($row['status'] == 'Pending') echo 'selected'; ?>>Pending</option>
                                <option value="Completed" <?php if ($row['status'] == 'Completed') echo 'selected'; ?>>Completed</option>
                                <option value="Canceled" <?php if ($row['status'] == 'Canceled') echo 'selected'; ?>>Canceled</option>
                            </select>
                            <button type="submit" class="btn btn-primary btn-block mt-2">Update</button>
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
