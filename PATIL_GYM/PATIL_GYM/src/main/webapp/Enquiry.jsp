<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored = "false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Enquiry Form</title>

    <style>
        @import url("https://img.freepik.com/premium-photo/dumbbells-yoga-mat_959815-2335.jpg");
        * {
          margin: 0;
          padding: 0;
          box-sizing: border-box;
          font-family: sans-serif;
        }
        body {
          min-height: 60vh;
          min-width:60vh;
          display: flex;
          align-items: center;
          justify-content: center;
          padding: 20px;
          background-color: #000;
          background-image: url("https://media.istockphoto.com/id/1327474895/photo/pink-color-dumbbell-exercise-mat-and-water-bottle-on-white-background.jpg?s=612x612&w=0&k=20&c=fExIoo28unxkQpOtX5I8VxTf_9_qBbbHg0kI3xMCNjA=");
           background-size: cover;
              background-position: center;
              background-repeat: no-repeat;
        }


        .navbar {
          background-color: #000;
          padding: 10px;
          display: flex;
          justify-content: center;
          position: fixed;
          top: 0;
          left: 0;
          width: 100%;
          z-index: 999;
        }

        .navbar-nav {
          display: flex;
        }

        .navbar-nav a {
          color: white;
          text-decoration: none;
          padding: 10px 20px;
          background-color: #000;
          border-radius: 5px;
          font-size: 1rem;
          transition: background-color 0.3s;
        }


        .navbar-nav a:hover {
          background-color: #444;
        }


        .container {
            position: relative;
            max-width: 350px;
            width: 60%;
            height: 100px;
            background: rgba(0, 0, 0, 0.6);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            margin-top: 20px;
        }


        .container header {
          font-size: 1.5rem;
          color: #333;
          font-weight: 500;
          text-align: center;
        }

        .form .input-box {
          width: 100%;
          margin-top: 10px;
        }

        .input-box label {
          color: #333;
        }

        .form :where(.input-box input, .select-box) {
          position: relative;
          height: 50px;
          width: 100%;
          outline: none;
          font-size: 1rem;
          color: #707070;
          margin-top: 8px;
          border: 1px solid #ddd;
          border-radius: 6px;
          padding: 0 15px;
        }

        .input-box input:focus {
          box-shadow: 0 1px 0 rgba(0, 0, 0, 0.1);
        }

        .form .column {
          display: flex;
          column-gap: 15px;
        }

        .form .gender-box {
          margin-top: 20px;
        }

        .gender-box h3 {
          color: #333;
          font-size: 1rem;
          font-weight: 400;
          margin-bottom: 8px;
        }

        .form :where(.gender-option, .gender) {
          display: flex;
          align-items: center;
          column-gap: 50px;
          flex-wrap: wrap;
        }

        .form .gender {
          column-gap: 5px;
        }

        .gender input {
          accent-color: rgb(70, 35, 247);
        }

        .form :where(.gender input, .gender label) {
          cursor: pointer;
        }

        .gender label {
          color: #707070;
        }

        .address :where(input, .select-box) {
          margin-top: 15px;
        }

        .select-box select {
          height: 100%;
          width: 100%;
          outline: none;
          border: none;
          color: #707070;
          font-size: 1rem;
        }

        .form button {
          margin-left: 30%;
          height: 40px;
          width: 30%;
          border-radius: 10px;
          color: #fff;
          font-size: 1rem;
          font-weight: 400;
          margin-top: 30px;
          border: none;
          cursor: pointer;
          transition: all 0.2s ease;
          background: rgb(102, 74, 241);
        }

        .form button:hover {
          background: rgb(45, 6, 240);
        }

        .container {
          padding: 15px;
          margin-top: 80px;
          border-radius: 8px;
          box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
          color: white;
        }

        .container header,
        .container label {
          color: white;
        }

        .container {
          background: rgba(0, 0, 0, 0.5);
          backdrop-filter: blur(px);
          box-shadow: 0 4px 8px rgb(251, 250, 250);
          border-radius: 8px;
          padding: 20px;
          width: 500px;
          height: 800px;
        }

        .input-box select {
          height: 48px;
          width: 100%;
          outline: none;
          font-size: 1rem;
          color: #707070;
          border: 1px solid #ddd;
          border-radius: 6px;
          padding: 0 15px;
          margin-top: 15px;
        }
    </style>
</head>
<body>


<div class="navbar">
    <div class="navbar-nav">
        <a class="nav-link" href="Home.jsp">Home</a>
         <a class="nav-link" href="followUp">Follow Up</a>
        <a class="nav-link" href="register">Registration</a>
        <a class="nav-link" href="UpdateRegisteredDetails.jsp">Update Profile</a>
    </div>
</div>


<section class="container">
    <header>Enquiry Form</header>
    <form action="enquiry" class="form" method="post" onsubmit="return validateEmail()">
        <div class="input-box">
            <label>Full Name</label>
            <input type="text" placeholder="Enter full name" name="name" required />
        </div>

        <div class="input-box">
            <label>Email Address</label>
            <input type="email" placeholder="Enter email address" id="email" name="email" onchange="onEmailChange()" required />
            <span id="displayEmail" style="color:red"></span>
        </div>

        <div class="input-box">
            <label>Phone Number</label>
            <input type="number" placeholder="Enter phone number" id="phoneNumber" name="phoneNumber" required />
        </div>

        <div class="input-box">
            <label>Age</label>
            <input type="number" placeholder="Enter your age" name="age" required />
        </div>

        <div class="gender-box">
            <h3 style="color: #fff;">Gender</h3>
            <div class="gender-option">
                <div class="gender">
                    <input type="radio" id="check-male" name="gender" value="male" checked />
                    <label for="check-male">Male</label>
                </div>
                <div class="gender">
                    <input type="radio" id="check-female" name="gender" value="female" />
                    <label for="check-female">Female</label>
                </div>
                <div class="gender">
                    <input type="radio" id="check-other" name="gender" value="prefer_not_to_say" />
                    <label for="check-other">Prefer not to say</label>
                </div>
            </div>
        </div>

        <div class="input-box address">
            <label>Address</label>
            <input type="text" placeholder="Enter street address" name="address" required />
            <div class="column">
                <div class="input-box">
                    <label>Enquiry Area</label>
                    <input type="text" id="status" name="status" value="Enter your enquiry area:" disabled style="background-color:white"/>
                </div>
                <div class="input-box">
                    <select class="form-control" id="areaName" name="areaName" required>
                        <option value="">Select Place</option>
                        <c:forEach items="${placesList}" var="loc">
                            <option value="${loc}">${loc}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
        </div>

        <button type="submit">Submit</button>
    </form>
</section>

<script>
    function onEmailChange() {
        var email = document.getElementById('email');
        var emailValue = email.value;

        document.getElementById("displayEmail").innerHTML = "Checking...";

        var xhttp = new XMLHttpRequest();
        xhttp.open("GET", "http://localhost:7878/PATIL_GYM/email/" + emailValue, true);
        xhttp.setRequestHeader("Content-Type", "application/json");
        xhttp.send();

        xhttp.onload = function () {
            if (this.status == 200) { // Check if the request was successful
                var response = this.responseText;
                if (response === "email already exists") {
                    document.getElementById("displayEmail").innerHTML = "Email already exists";
                } else if (response === "enquiry Email doesn't exists") {
                    document.getElementById("displayEmail").innerHTML = "Email is available";
                } else {
                    document.getElementById("displayEmail").innerHTML = "Unexpected response from server";
                }
            } else {
                document.getElementById("displayEmail").innerHTML = "Error checking email";
            }
        };
    }
</script>

</body>
</html>
