<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/receipt.css">
    <title>Receipt Summary</title>
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
          <div class="summary">
            <h2>Receipt Summary</h2>

            <div>
                <div class="fDetails">
                    <div>
                        <label>Passenger ID</label>
                        <div><%= request.getAttribute("passengerId") %></div>
                    </div>
                    <div>
                        <label>Train ID</label>
                        <div><%= request.getParameter("id") %></div>
                    </div>
                </div>
    
                <div class="passDetails">
                    <div>
                        <label>Passenger Name</label>
                        <div><%= request.getParameter("name") %></div>
                    </div>
                    <div class="age">
                        <label>Age</label>
                        <div><%= request.getAttribute("age") %></div>
                    </div>
                </div>
    
                <div class="details">
                    <div class="fromTo">
                        <div>
                            <label>From </label>
                            <div><%= request.getParameter("fromCity") %></div>
                        </div>
                        <div>
                            <label>To </label>
                            <div><%= request.getParameter("toCity") %></div>
                        </div>
                    </div>
                    
                    <div class="date">
                        <label>Date</label>
                        <div><%= request.getAttribute("currentDate") %></div>
                    </div>
                </div>

                <div class="time">
                    <div>
                        <div>
                            <label>Departure Time</label>
                            <div><%= request.getParameter("departureTime") %></div>
                        </div>
                        <div>
                            <label>Arrival Time</label>
                            <div><%= request.getParameter("arrivalTime") %></div>
                        </div>
                    </div>

                    <div class="dates">
                        <div>
                            <label>Departure Date</label>
                            <div><%= request.getParameter("departureDate") %></div>
                        </div>
                        <div>
                            <label>Arrival Date</label>
                            <div><%= request.getParameter("arrivalDate") %></div>
                        </div>
                    </div>
                </div>

                <div class="bill">
                    <div class="pid">
                        <label>Payment ID</label>
                        <div><%= request.getAttribute("paymentId") %></div>
                    </div>
                    <div class="paid">
                        <label>Total Amount Paid: </label>
                        <div>&#8377; <%= request.getParameter("fare") %></div>
                    </div>
                </div>
            </div>
          </div>
        </div>

    </div> 
</body>
</html>