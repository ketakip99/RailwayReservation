<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%java.time.LocalDate dob =java.time.LocalDate.parse( request.getParameter("birthdate")); %>
<%java.time.LocalDate currentDate = java.time.LocalDate.now(); %>
<%java.time.Period ageCal = java.time.Period.between(dob, currentDate);%>
<%int age = ageCal.getYears(); %>
      
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/summary.css">
    <title>Ticket Summary</title>
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
            <h2>Ticket Summary</h2>

            <div>
                <div class="fDetails">
                    <div>
                        <label>Passenger ID</label>
                        <div>--</div>
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
                        <div><%= age %></div>
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
                        <div><%= currentDate %></div>
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
                    <label>Total Amount Payable: </label>
                    <div>&#8377; <%= request.getParameter("fare") %></div>
                </div>
                
                
                <form action="confirmpay.jsp" method="post">
        <input type="hidden" name="passengerId" value="${passengerId}">
        <input type="hidden" name="id" value="<%= request.getParameter("id") %>">
        <input type="hidden" name="name" value="<%= request.getParameter("name") %>">
        <input type="hidden" name="age" value="<%= request.getParameter("age") %>">
        <input type="hidden" name="gender" value="<%= request.getParameter("gender") %>">
        <input type="hidden" name="birthdate" value="<%= request.getParameter("birthdate") %>">
        <input type="hidden" name="phone" value="<%= request.getParameter("phone") %>">
        <input type="hidden" name="email" value="<%= request.getParameter("email") %>">
        <input type="hidden" name="fromCity" value="<%= request.getParameter("fromCity") %>">
        <input type="hidden" name="toCity" value="<%= request.getParameter("toCity") %>">
        <input type="hidden" name="currentDate" value="<%= request.getParameter("currentDate") %>">
        <input type="hidden" name="departureTime" value="<%= request.getParameter("departureTime") %>">
        <input type="hidden" name="arrivalTime" value="<%= request.getParameter("arrivalTime") %>">
        <input type="hidden" name="departureDate" value="<%= request.getParameter("departureDate") %>">
        <input type="hidden" name="arrivalDate" value="<%= request.getParameter("arrivalDate") %>">
        <input type="hidden" name="fare" value="<%= request.getParameter("fare") %>">
        
        

                <button class="payBtn">Make Payment</button>
                </form>
            </div>
          </div>
        </div>

    </div> 
</body>
</html>