<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>FromTo</title>
    <link rel="stylesheet" href="css/fromto.css">
    <script src="js/fromto.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
                <h2>Search Trains</h2>
                <form action ="trainServlet" method = "post">
                <div class="fromTo">
                    <div class="from">
                        <label>From</label>
                        <select id="fromCity" name="fromCity">
                            <option value="none" selected disabled hidden>Select an Option</option>
                            <option value="Pune">Pune</option>
                            <option value="Bangalore">Bangalore</option>
                            <option value="Delhi">Delhi</option>
                            <option value="Mumbai">Mumbai</option>
                        </select>
                    </div>
                    <div class="to">
                        <label>To</label>
                        <select id="toCity" name="toCity">
                            <option value="none" selected disabled hidden>Select an Option</option>
                            <option value="Pune">Pune</option>
                            <option value="Bangalore">Bangalore</option>
                            <option value="Delhi">Delhi</option>
                            <option value="Mumbai">Mumbai</option>
                        </select>
                    </div>
                    <div class="depDate">
                        <label>Departure Date</label>
                        <input type="date" name="departureDate" />
                    </div>
                    <button class="searchBtn" onclick="validateForm()"><i class="fa-solid fa-magnifying-glass"></i></button>
                </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
