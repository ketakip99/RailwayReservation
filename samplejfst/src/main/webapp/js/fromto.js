function validateForm() {
    var fromCity = document.getElementById("fromCity").value;
    var toCity = document.getElementById("toCity").value;
    var departureDate = new Date(document.querySelector('.depDate input').value);
    var currentDate = new Date();

    if (fromCity === toCity) {
      window.location.href = "error.html";
      return false;
    }

    if (departureDate <= currentDate) {
      window.location.href = "error.html";
      return false;
    }

    // If all validations are successful, go to the trainListServlet
    window.location.href = "trainServlet?fromCity=" + fromCity + "&toCity=" + toCity + "&departureDate=" + departureDate.toISOString().split('T')[0];
    return true;
  }