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
        @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap");
        * {
          margin: 0;
          padding: 0;
          box-sizing: border-box;
          font-family: sans-serif;
        }
        body {
          min-height: 100vh;
          display: flex;
          align-items: center;
          justify-content: center;
          padding: 20px;
          background-color: #000;
          background-image: url("https://img.freepik.com/premium-photo/fitness-healthy-background-concept_28586-237.jpg?w=900");
        }
        .container {
          position: relative;
          max-width: 700px;
          width: 100%;
          background: #fff;
          padding: 25px;
          border-radius: 8px;
        }
        .container header {
          font-size: 1.5rem;
          color: #333;
          font-weight: 500;
          text-align: center;
        }
        .container .form {
          margin-top: 30px;
        }
        .form .input-box {
          width: 100%;
          margin-top: 20px;
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
          border-radius: 30px;
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
        /* Responsive */
        @media screen and (max-width: 500px) {
          .form .column {
            flex-wrap: wrap;
          }
          .form :where(.gender-option, .gender) {
            row-gap: 15px;
          }
        }
        .container {
          padding: 25px;
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
        .header {
          display: flex;
          justify-content: space-between;
          align-items: center;
          padding: 15px 30px;
          position: fixed;
          top: 0;
          width: 100%;
          height: 65px;
          z-index: 1000;
          color: white;
          overflow: hidden;
          box-shadow: 0 2px 4px rgba(0, 0, 0, 0);
          background-color: #2F2D2E;
        }
        .header .logo {
          font-size: 1.5rem;
          font-weight: bold;
        }
        .header .nav {
          display: flex;
          gap: 20px;
        }
        .header .nav a {
          color: white;
          text-decoration: none;
          font-size: 1rem;
          transition: color 0.3s;
        }
        .header .nav a:hover {
          color: #f0c14b;
        }
        .header .logo {
          display: flex;
          align-items: center;
        }
        .logo-img {
          max-height: 51px;
          max-width: 120%;
          height: auto;
        }
        .patil-logo img {
          width: 40px;
          height: 40px;
          border-radius: 50%;
          margin-left: 0px;
        }
        .patil-logo {
          display: flex;
          flex-direction: column;
          align-items: center;
          justify-content: center;
        }
    </style>
    </head>
<body>
<!-- Header Section -->
<header class="header">
  <div class="patil-logo">
    <img src="https://th.bing.com/th/id/OIP.r-HF5JGN_rV2Nuyq0ZKtcQHaFj?w=185&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7" alt="Logo" class="patil-logo">
    <span style="font-size:10px;">PATIL GYM</span>
  </div>
</header>
<section class="container">
    <header>Enquiry Form</header>
    <form action="enquiry" class="form" method="post" onsubmit="return validateEmail()">
        <div class="input-box">
            <label>Full Name</label>
            <input type="text" placeholder="Enter full name" name="name" required />
        </div>

        <div class="input-box">
            <label>Email Address</label>
            <input type="email" placeholder="Enter email address"id="email" name="email" onchange="onEmailChange()" required />
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
