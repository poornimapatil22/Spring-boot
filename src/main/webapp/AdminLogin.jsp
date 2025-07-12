<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Admin Login</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">

  <style>
    body {
      margin: 0;
      margin-top: 10%;
      height: auto;
      display: flex;
      justify-content: center;
      align-items: center;
      background-image: url("https://img.freepik.com/premium-photo/array-dumbbells-precise-rows-essential-equipment-any-gym-vertical-mobile-wallpaper_896558-14134.jpg");
      background-size: cover;
      background-position: center;
      background-repeat: no-repeat;
      background-attachment: fixed;
      color: #000;
    }

    .form-container {
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 0px 5px 10px 10px;
      height: 50%;
      width: 40%;
      max-width: 400px;
      border: 1px solid #333;
      border-radius: 15px;
      background-color: rgba(1, 0.8, 1, 0.8); /* translucent white/pinkish */
      box-shadow: 0px 2px 10px rgba(200, 200, 200, 0.2);
      flex-direction: column;
    }

    label {
      color: white;
      font-weight: 500;
    }

    .btn-center {
      display: block;
      margin: 20px auto;
      padding: 8px 60px;
      font-size: 1.2rem;
    }

    .password-toggle {
      position: absolute;
      right: 15px;
      top: 42px;
      cursor: pointer;
      font-size: 1.3rem;
      color: #007bff;
    }

    .form-group {
      position: relative;
    }

    .valid {
      color: green;
      text-align: center;
      font-weight: bold;
    }

    .message {
      color: red;
      text-align: center;
      font-weight: bold;
    }

    #nameValid {
      color: red;
      font-size: 15px;
    }

    @media (max-width: 768px) {
      body {
        margin-top: 20%;
      }

      .form-container {
        width: 75%;
        padding: 15px 0;
      }
    }
  </style>
</head>
<body>

<div class="container form-container">
  <div class="row w-100">
    <div class="col-md-12 text-center">
      <!-- Matching controller attribute names -->
      <c:if test="${not empty failedAdmin}">
        <h6 class="message">${failedAdmin}</h6>
      </c:if>
      <c:if test="${not empty fail}">
        <h6 class="message">${fail}</h6>
      </c:if>
      <c:if test="${not empty error}">
        <h6 class="message">${error}</h6>
      </c:if>
      <c:if test="${not empty success}">
        <h6 class="valid">${success}</h6>
      </c:if>
    </div>
  </div>

  <div class="row w-100">
    <div class="col-md-12">
      <h2 class="text-center" style="color:white; font-size: 20px;">Admin Login</h2>
      <form action="adminLogin" method="post">
        <div class="form-group">
          <label for="email">Email</label>
          <input type="email" class="form-control" id="email" name="email" placeholder="Enter email" required onblur="onField()">
          <span id="nameValid"></span>
        </div>

        <div class="form-group">
          <label for="password">Password</label>
          <input type="password" class="form-control" id="password" name="password" placeholder="Enter password" required>
          <i class="fas fa-eye password-toggle" id="togglePassword" onclick="togglePassword()"></i>
        </div>

        <button type="submit" class="btn btn-primary btn-center">Login</button>
      </form>

      <div class="text-center mt-3">
        <a href="AdminForgotPassword.jsp" style="color: white;">Forgot Password?</a>
      </div>
    </div>
  </div>
</div>

<!-- Scripts -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script>
  function togglePassword() {
    const passwordField = document.getElementById('password');
    const toggleIcon = document.getElementById('togglePassword');
    if (passwordField.type === 'password') {
      passwordField.type = 'text';
      toggleIcon.classList.replace('fa-eye', 'fa-eye-slash');
    } else {
      passwordField.type = 'password';
      toggleIcon.classList.replace('fa-eye-slash', 'fa-eye');
    }
  }

  function onField() {
    var email = document.getElementById("email").value;
    if (email !== "") {
      var xhttp = new XMLHttpRequest();
      xhttp.open("GET", "http://localhost:8000/PATIL_GYM/emailOfAdmin/" + email, true);
      xhttp.send();
      xhttp.onload = function () {
        document.getElementById("nameValid").innerHTML = this.responseText;
      }
    }
  }
</script>

</body>
</html>
