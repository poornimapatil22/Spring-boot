<%@ page isELIgnored = "false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Login</title>
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
      background-color: rgba(1, 0.8, 1, 0.8);
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
.valid{
color: green;
align-items: center;
justify-content: center;
}
    .message {
      color: red;
    }

    #nameValid {
      color: red;
      font-size: 15px;
    }

    .center-message {
      text-align: center;
      margin-bottom: 15px;
    }

    @media (max-width: 768px) {
      body {
        margin: 0;
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
      <c:if test="${not empty failedAdmin}">
        <h6 class="text-danger font-weight-bold center-message">${failedAdmin}</h6>
      </c:if>
      <c:if test="${not empty fail}">
        <h6 class="text-warning font-weight-bold center-message">${fail}</h6>
      </c:if>
    </div>
  </div>

  <div class="row w-100">
    <div class="col-md-12">
      <h2 class="text-center" style="color:white; font-size: 20px;">Admin Login</h2>
      <form action="adminLogin" method="post">
        <span class="message">${failure}</span>
        <span class="valid">${success}</span>

        <div class="form-group">
          <label for="email">Email</label>
          <input type="email" class="form-control" id="email" name="email" placeholder="Enter email" required onblur="onField()">
          <span id="nameValid" style="display: block; width: 100%;"></span>
        </div>
        <div class="form-group">
          <label for="password">Password</label>
          <input type="password" class="form-control" id="password" name="password" placeholder="Enter password" required>
          <i class="fas fa-eye password-toggle" id="togglePassword" onclick="togglePassword()"></i>
          <span id="nameValid">${invalidPassword}</span>
        </div>
        <button type="submit" class="btn btn-primary btn-center">Login</button>
      </form>
     <div class="text-center mt-3">
       <a href="AdminForgotPassword.jsp" style="color: white;">Forgot Password?</a>
     </div>
    </div>
  </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.4.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
  function togglePassword() {
    const passwordField = document.getElementById('password');
    const toggleIcon = document.getElementById('togglePassword');
    if (passwordField.type === 'password') {
      passwordField.type = 'text';
      toggleIcon.classList.remove('fa-eye');
      toggleIcon.classList.add('fa-eye-slash');
    } else {
      passwordField.type = 'password';
      toggleIcon.classList.remove('fa-eye-slash');
      toggleIcon.classList.add('fa-eye');
    }
  }

  const onField = () => {
    var name = document.getElementById("email");
    var value = name.value;
    if (value !== "") {
      var xhttp = new XMLHttpRequest();
      xhttp.open("GET", "http://localhost:7878/PATIL_GYM/emailOfAdmin/" + value, true);
      xhttp.send();

      xhttp.onload = function () {
        document.getElementById("nameValid").innerHTML = this.responseText;
      }
    }
  }
</script>
</body>
</html>
