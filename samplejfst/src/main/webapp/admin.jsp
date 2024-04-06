<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/admin.css">
    <title>Admin Details</title>
    <script src="adminDetails.js"></script>
</head>
<body>
    <nav>
        <div class="logo">
            <a href="#">Bharat<span>Rails.</span></a>
        </div>
        <ul>
            <li><a href="choice.html">Home</a></li>
            <li><a href="error.html">About</a></li>
            <li><a href="error.html">Services</a></li>
            <li><a href="error.html">Contact</a></li>
        </ul>
    </nav>

    <div class="container">
        <div class="content">
            <form class="form" action="adminServlet" method="post"onsubmit="return validateForm()"> 
                <h2>Admin Login</h2>
                <p>Please enter your correct username and password</p>

                <div>
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" placeholder="Username" required/>
                </div>

                <div>
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" placeholder="Password" required/>
                </div>

                <input type="submit" class="submitBtn" value="Submit" />
            </form>
        </div>
    </div>
</body>
</html>
