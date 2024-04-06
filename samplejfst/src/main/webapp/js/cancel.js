function cancelBtn() {
    var passId = document.getElementById("passengerId").value;
    var trainId = document.getElementById("trainId").value;
    var payId = document.getElementById("payId").value;

    if (passId === "" || trainId === "" || payId === "") {
        window.location.href = "error.html";
        return false;
        //have to add database validation here
    }
    // Sending the data to the cancelServlet
    window.location.href = "cancelServlet?passengerId=" + passId + "&trainId=" + trainId + "&payId=" + payId;
    return true;
}
