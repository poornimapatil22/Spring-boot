<%@ page isELIgnored = "false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login</title>
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet"> <!-- Font Awesome -->
  <style>
    body {
      margin: 0;
      height: 100vh;
      background: url("https://static.vecteezy.com/system/resources/previews/022/653/988/large_2x/treadmill-in-modern-gym-toned-image-3d-rendering-generative-ai-free-photo.jpg") center no-repeat;
      background-size: cover;
      color: white;
      font-family: 'Arial', sans-serif;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .form-container {
      width: 100%;
      max-width: 300px;
      background-color:black;
      padding: 40px;
      border-radius: 10px;
      box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
    }

    .form-title {
      font-size: 1.8rem;
      font-weight: 600;
      text-align: center;
      margin-bottom: 30px;
    }

    .form-group label {
      font-size: 1.1rem;
      font-weight: 500;
    }

    .form-control {
      border-radius: 30px;
      box-shadow: none;
      padding: 12px 20px;
      font-size: 1rem;
    }

    .form-control:focus {
      border-color: #007bff;
      box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
    }

    .password-toggle {
      position: absolute;
      right: 15px;
      top: 38px;
      cursor: pointer;
      font-size: 1.2rem;
      color: #007bff;
    }

    .form-group {
      position: relative;
    }

    .btn-center {
      display: block;
      width: 100%;
      margin-top: 20px;
      padding: 12px;
      font-size: 1.2rem;
      border-radius: 30px;
      background-color: #206777;
      color: white;
      border: none;
      transition: all 0.3s ease;
    }

    .btn-center:hover {
      background-color: #0056b3;
      transform: scale(1.05);
    }

    .message {
      color: red;
      margin-bottom: 15px;
      text-align: center;
    }

    .error-message {
      color: red;
      font-size: 14px;
      display: block;
      margin-top: 10px;
    }

    /* Responsive Styles */
    @media (max-width: 768px) {
      .form-container {
        padding: 25px;
      }
    }

    @media (max-width: 576px) {
      .form-container {
        width: 90%;
        padding: 20px;
      }

      .form-title {
        font-size: 1.5rem;
      }

      .btn-center {
        padding: 10px;
        font-size: 1rem;
      }
    }

  </style>
</head>
<body>

  <div class="form-container">
    <h2 class="form-title">Login</h2>
    <form action="userLogin" method="post">
      <!-- Failure message if login fails -->
      <div class="message">${failure}</div>


      <div class="form-group">
        <label for="email">Email</label>
        <input type="email" class="form-control" id="email" name="useremail" placeholder="Enter your email" required onblur="onField()">
        <span id="nameValid" class="error-message">${invalidEmail}</span>
      </div>


      <div class="form-group">
        <label for="password">Password</label>
        <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
        <i class="fas fa-eye password-toggle" id="togglePassword" onclick="togglePassword()"></i> <!-- Font Awesome icon -->
        <span id="nameValid" class="error-message">${invalidPassword}</span>
      </div>


      <button type="submit" class="btn btn-primary btn-center">Login</button>
    </form>
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
      var email = document.getElementById("email");
      var value = email.value;
      if (value != "") {
        var xhttp = new XMLHttpRequest();
        xhttp.open("GET", "http://localhost:8080/Charan_gym/name/" + value, true);
        xhttp.send();

        xhttp.onload = function () {
          document.getElementById("nameValid").innerHTML = this.responseText;
        }
      }
    }
  </script>
</body>
</html>
