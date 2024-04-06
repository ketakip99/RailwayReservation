<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/adminForm.css">
    <title>Train Details</title>
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
        <!-- <div class="buttons">
          <a href="#" class="login">Log in</a>
          <a href="#" class="btn">Register</a>
        </div> -->
    </nav>

    <div class="container">
        <div class="content">
            <form class="form" onsubmit="return validateForm()" action='adminFormServlet' method = 'post'> 
                <h2><b>Train Details</b></h2>

                <div>
                    <label for="source">Source</label>
                    <input type="text" id="source" name="source" placeholder="Source" required/>
                </div>

                <div>
                    <label for="destination">Destination</label>
                    <input type="text" id="destination" name="destination" placeholder="Destination" required/>
                </div>

                <div class="pd">
                    <div>
                        <label for="arrivalDate">Date of Arrival</label>
                        <input type="date" id="arrivalDate" name="arrivalDate" placeholder="Date of Arrival" required/>
                    </div>
                    <div>
                        <label for="departureDate">Date of Departure</label>
                        <input type="date" id="departureDate" name="departureDate" placeholder="Date of Departure" required/>
                    </div>
                </div>

                <div class="pd">
                    <div>
                        <label for="remainingSeats">Number of Remaining Seats</label>
                        <input type="number" id="remainingSeats" name="remainingSeats" placeholder="Remaining Seats" required/>
                    </div>
                    <div>
                        <label for="arrivalTime">Time Of Arrival</label>
                        <input type="time" id="arrivalTime" name="arrivalTime" placeholder="Time of Arrival" required/>
                    </div>
                    <div>
                        <label for="departureTime">Time Of Departure</label>
                        <input type="time" id="departureTime" name="departureTime" placeholder="Time of Departure" required/>
                    </div>
                </div>

                <div>
                    <label for="fare">Fare</label>
                    <input type="number" id="fare" name="fare" placeholder="Fare" required/>
                </div>

                <input type="submit" class="submitBtn" value="Submit"></input>
            </form>
        </div>
    </div>
</body>
</html>
