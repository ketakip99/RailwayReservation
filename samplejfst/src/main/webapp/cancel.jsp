<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/cancel.css">
    <script src="js/cancel.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Cancellation</title>
</head>
<body>
    <nav>
        <div class="logo">
          <a href="#">Bharat<span>Rails.</span></a>
        </div>
        <ul>
          <li><a href="choice.html">Home</a></li>
          <li><a href="<c:url value='/about' />">About</a></li>
          <li><a href="<c:url value='/services' />">Services</a></li>
          <li><a href="<c:url value='/contact' />">Contact</a></li>
        </ul>
    </nav>

    <div class="container">
        <div class="content">
            <div class="form">
                <h2>Cancel Train Reservation</h2>

                <div>
                    <label>Passenger ID</label>
                    <input type="number" id="passengerId" placeholder="Passenger ID" />
                </div>

                <div>
                    <label>Train ID</label>
                    <input type="number" id="trainId" placeholder="Train ID" />
                </div>

                <div>
                    <label>Payment ID</label>
                    <input type="number" id="payId" placeholder="Payment ID" />
                </div>

                <button class="submitBtn" value="Confirm" onclick="cancelBtn()">Confirm</button>
            </div>
        </div>
    </div>
</body>
</html>
