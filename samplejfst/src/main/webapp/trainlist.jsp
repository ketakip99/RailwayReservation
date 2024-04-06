<%@ page contentType="text/html;charset=UTF-8" language="java" %>



<%@ page import="java.sql.ResultSet" %>



<!DOCTYPE html>



<html>



<head>

    <meta charset="UTF-8">

    <link rel="stylesheet" href="css/trainlist.css">

    <title>Trains</title>

</head>



<body>



    <div class="container">



        <nav>

            <div class="logo">

                <a href="#">Bharat<span>Rails.</span></a>

            </div>

            <ul>

                <li><a href="choice.html">Home</a></li>

                <li><a href="/about">About</a></li>

                <li><a href="/services">Services</a></li>

                <li><a href="/contact">Contact</a></li>

            </ul>

        </nav>



        <div class="content">

            <div class="fromTo">

                <div class="from">

                    <label>From</label>

                    <div class="fromText"><%= request.getAttribute("fromCity") %></div>

                </div>

                <div class="to">

                    <label>To</label>

                    <div class="toText"><%= request.getAttribute("toCity") %></div>

                </div>



                <div class="departureDate">

                    <label>Departure Date</label>

                    <div class="depDateText"><%= request.getAttribute("departureDate") %></div>

                </div>

            </div>



            <div class="trains">

                <%

                    ResultSet resultSet = (ResultSet) request.getAttribute("resultSet");

                    while (resultSet.next()) {
                    	
                    	if(resultSet.getInt("remaining_seats")!=0) {
                    		

                        java.sql.Time departureTime = resultSet.getTime("departure_time");

                        java.sql.Time arrivalTime = resultSet.getTime("arrival_time");
                        java.sql.Date arrivalDate = resultSet.getDate("date_of_arrival");

                %>



                <div class="trainCard">

                    <div class="fDetails">

                        <div class="depTime"><%= departureTime.toString() %></div>

                        <div class="duration">

                            <span class="line"></span>

                            <span class="line2"></span>

                            <span class="train-icon">&#128645;</span>

                        </div>

                        <div class="arvTime"><%= arrivalTime.toString() %></div>

                    </div>



<div class="fBooking">
    <div class="price">₹<%= resultSet.getString("fare") %></div>
    <form action="passengerDetails.jsp" method="get">
    	<input type="hidden" name="fromCity" value="<%= request.getAttribute("fromCity") %>">
        <input type="hidden" name="toCity" value="<%= request.getAttribute("toCity") %>">
        <input type="hidden" name="departureDate" value="<%= request.getAttribute("departureDate") %>">
        <input type="hidden" name="departureTime" value="<%= departureTime.toString() %>">
        <input type="hidden" name="arrivalTime" value="<%= arrivalTime.toString() %>">
        <input type="hidden" name="arrivalDate" value="<%= arrivalDate.toString() %>">
        <input type="hidden" name="fare" value="<%= resultSet.getString("fare") %>">
        <input type="hidden" name="id" value="<%= resultSet.getString("id") %>">
        <button type="submit">Book Train</button>
    </form>
</div>

                </div>



                <%
                    	}

                    }

                %>

            </div>



        </div>



    </div>



</body>



</html>