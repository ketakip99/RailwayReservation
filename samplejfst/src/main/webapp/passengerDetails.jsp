<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%-- Retrieve data from the request parameters passed from trainlist.jsp --%>
<% String fromCity = request.getParameter("fromCity"); %>
<% String toCity = request.getParameter("toCity"); %>
<% String departureDate = request.getParameter("departureDate"); %>
<% String arrivalDate = request.getParameter("arrivalDate"); %>
<% String id = request.getParameter("id"); %>
<% String fare = request.getParameter("fare"); %>
<% String departureTime = request.getParameter("departureTime"); %>
<% String arrivalTime = request.getParameter("arrivalTime"); %>
<%System.out.println("passend starting check:" + departureDate); %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/passengerDetails.css">
    <title>Passenger Details</title>
    <script src="js/passengerDetails.js"></script>
</head>
<body>
    <nav>
        <div class="logo">
          <a href="#">Bharat<span>Rails.</span></a>
        </div>
        <ul>
          <li><a href="choice.html">Home</a></li>
          <li><a href="{% url 'about' %}">About</a></li>
          <li><a href="{% url 'services' %}">Services</a></li>
          <li><a href="{% url 'contact' %}">Contact</a></li>
        </ul>
        <!-- <div class="buttons">
          <a href="#" class="login">Log in</a>
          <a href="#" class="btn">Register</a>
        </div> -->
    </nav>

    <div class="container">
        <div class="content">
            <form class="form" action="summary.jsp" method="post" onsubmit="return validateForm()"> 
                <h2>Passenger Details</h2>

                <div>
                    <label for="name">Name</label>
                    <input type="text" name ="name" id="name" placeholder="Full Name" />
                </div>

                <div>
                    <label for="email">Email Address</label>
                    <input type="email" name ="email" id="email" placeholder="Email Address" />
                </div>

                <div class="pd">
                    <div>
                        <label for="phone">Phone Number</label>
                        <input type="tel" name ="phone" id="phone" placeholder="Phone Number" />
                    </div>
                    <div>
                        <label for="birthdate">Birth Date</label>
                        <input type="date" name ="birthdate" id="birthdate" placeholder="Birth Date" />
                    </div>
                </div>

                <div class="gender">
                    <label>Gender</label>
                    <div>
                        <div class="genderOpt">
                            <input type="radio" value="male" id="check-male" name="gender">
                            <label for="check-male">Male</label>
                        </div>
                        <div class="genderOpt">
                            <input type="radio" value="female" id="check-female" name="gender">
                            <label for="check-female">Female</label>
                        </div>
                    </div>
                </div>
                <%-- Include hidden fields to carry data to the next page --%>
                <input type="hidden" name="fromCity" value="<%= fromCity %>" />
                <input type="hidden" name="toCity" value="<%= toCity %>" />
                <input type="hidden" name="departureDate" value="<%= departureDate %>" />
                <input type="hidden" name="id" value="<%= id %>" />
                <input type="hidden" name="fare" value="<%= fare %>" />
                <input type="hidden" name="arrivalDate" value="<%= arrivalDate %>" />
                <input type="hidden" name="arrivalTime" value="<%= arrivalTime %>" />
                <input type="hidden" name="departureTime" value="<%= departureTime %>" />
                <%System.out.println("PassengerDetails check:" + departureDate); %>

                <input type="submit" class="submitBtn" value="Submit"></input>
            </form>
        </div>
    </div>
</body>
</html>
