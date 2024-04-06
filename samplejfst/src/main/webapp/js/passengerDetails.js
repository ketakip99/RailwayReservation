function validateForm() {
    var name = document.getElementById("name").value;
    var email = document.getElementById("email").value;
    var phone = document.getElementById("phone").value;
    var birthdate = document.getElementById("birthdate").value;
    var gender = document.querySelector('input[name="gender"]:checked');

    if (name.trim() === '') {
        
      window.location.href = "error.html";
        return false;
    }

    if (email.trim() === '' || !validateEmail(email)) {
        
      window.location.href = "error.html";
        return false;
    }

    if (phone.trim() === '') {
        
      window.location.href = "error.html";
        return false;
    }

    if (birthdate.trim() === '') {
        
      window.location.href = "error.html";
        return false;
    }

    if (!gender) {

        window.location.href = "error.html";        
        return false;
    }
    //go to next not working
    window.location.href = "summary.html";
    return true;
}

function validateEmail(email) {
    var emailRegex = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;
    return emailRegex.test(email);
}
