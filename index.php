<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bitcoin Broker</title>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="#">Bitcoin Broker</a>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="user/user_register.php">User Register</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="admin/admin_login.php">Admin Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="user/user_login.php">User Login</a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container mt-5">
        <div class="row">
            <div class="col-md-6">
                <h2>User Login</h2>
                <form action="user/user_login.php" method="GET">
                    <div class="mb-3">
                        <label for="user_username" class="form-label">Username</label>
                        <input type="text" class="form-control" id="user_username" name="username" required>
                    </div>
                    <div class="mb-3">
                        <label for="user_password" class="form-label">Password</label>
                        <input type="password" class="form-control" id="user_password" name="password" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Login as User</button>
                </form>
            </div>
            <div class="col-md-6">
                <h2>Admin Login</h2>
                <form action="admin/admin_login.php" method="GET">
                    <div class="mb-3">
                        <label for="admin_username" class="form-label">Username</label>
                        <input type="text" class="form-control" id="admin_username" name="username" required>
                    </div>
                    <div class="mb-3">
                        <label for="admin_password" class="form-label">Password</label>
                        <input type="password" class="form-control" id="admin_password" name="password" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Login as Admin</button>
                </form>
            </div>
        </div>
    </div>

    <footer class="bg-dark text-white text-center py-3 mt-5">
        <p>&copy; 2024 Bitcoin Broker. All rights reserved.</p>
    </footer>

    <script src="assets/js/bootstrap.bundle.min.js"></script>
</body>
</html>
  
