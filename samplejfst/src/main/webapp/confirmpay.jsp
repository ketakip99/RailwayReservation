<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% String fromCity = request.getParameter("fromCity"); %>
<% String toCity = request.getParameter("toCity"); %>
<% String departureDate = request.getParameter("departureDate"); %>
<% String id = request.getParameter("id"); %>
<% String name = request.getParameter("name"); %>
<% String email = request.getParameter("email"); %>
<% String phone = request.getParameter("phone"); %>
<% String birthdate = request.getParameter("birthdate"); %>
<% String gender = request.getParameter("gender"); %>
<% String fare = request.getParameter("fare"); %>
<%System.out.println("confirmpay starting check:" + departureDate); %>
<%System.out.println("confirmpay starting check name:" + name); %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="css/confirmpay.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Confirm Payment</title>
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
        <form action="confirmpayServlet" method="post">
        <div class="content">
        
            <div class="payment">
                <h2>Checkout</h2>
                <!--  -->
                <div>
                    <div>Select a Payment Method</div>

                    <input type="radio" name="select" id="option-1" checked>
                    <input type="radio" name="select" id="option-2">
                    <label for="option-1" class="option option-1">
                        <span>
                            <span>UPI</span>
                            <i class="fa-brands fa-google-pay" style="font-size: 40px;"></i>
                        </span>
                        </label>
                    <label for="option-2" class="option option-2">
                        <span>
                            <span>Credit Card</span>
                            <i class="fa-solid fa-credit-card" style="font-size: 20px;"></i>
                        </span>
                    </label>
                </div>
                
                <input type="hidden" name="fromCity" value="<%= fromCity %>" />
                <input type="hidden" name="toCity" value="<%= toCity %>" />
                <input type="hidden" name="departureDate" value="<%= request.getParameter("departureDate") %>" />
                <input type="hidden" name="id" value="<%= id %>" />
                <input type="hidden" name="name" value="<%= request.getParameter("name") %>" />
                <input type="hidden" name="email" value="<%= request.getParameter("email") %>" />
                <input type="hidden" name="phone" value="<%= request.getParameter("phone") %>" />
                <input type="hidden" name="birthdate" value="<%= request.getParameter("birthdate") %>" />
                <input type="hidden" name="gender" value="<%= request.getParameter("gender") %>" />
                <input type="hidden" name="fare" value="<%= request.getParameter("fare") %>" />
                <input type="hidden" name="departureTime" value="<%= request.getParameter("departureTime") %>" />
                <input type="hidden" name="arrivalTime" value="<%= request.getParameter("arrivalTime") %>" />
                <input type="hidden" name="arrivalDate" value="<%= request.getParameter("arrivalDate") %>" />
                <%System.out.println("DOB"+birthdate); %>
                <%System.out.println("confirmpay end check:" + departureDate); %>

                <button class="payBtn" onclick="pay()">Pay</button>
                <!--  -->
            </div>
            
            
            <div class="check">
                <div>
                    <i class="fa-solid fa-circle-check" id="c"></i>
                    <span>Confirmed Flight Booking</span>
                    
                </div>
            </div>
        </div>
        </form>

    </div> 
</body>

<script>
    const c = document.querySelector(".check");
    const check = document.querySelector("#c");

    function pay() {
        c.classList.add('visible');
        check.classList.add('visible');

        setTimeout(function () {
            window.location.href = 'receipt.html';
        }, 5000); 
    }
</script>



</html>