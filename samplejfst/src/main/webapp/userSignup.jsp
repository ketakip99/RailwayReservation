<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/userSignup.css">
    <title>User Details</title>
    <script src="passengerDetails.js"></script>
</head>
<body>
    <nav>
        <div class="logo">
            <a href="#">Bharat<span>Rails.</span></a>
        </div>
        <ul>
            <li><a href="choice.html">Home</a></li>
            <li><a href="<%= request.getContextPath() %>/about">About</a></li>
            <li><a href="<%= request.getContextPath() %>/services">Services</a></li>
            <li><a href="<%= request.getContextPath() %>/contact">Contact</a></li>
        </ul>
    </nav>

    <div class="container">
        <div class="content">
            <form class="form" action="userSignupServlet" method="post" onsubmit="return validateForm()">
                <h2>User SignUp</h2>

                <div>
                    <label for="name">Name</label>
                    <input type="text" id="name" name="name" placeholder="Name" required/>
                </div>

                <div>
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" placeholder="Username" required/>
                </div>

                <div>
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" placeholder="Password" required/>
                </div>

                <input type="submit" class="submitBtn" value="Sign Up" />
            </form>
        </div>
    </div>
</body>
</html>
