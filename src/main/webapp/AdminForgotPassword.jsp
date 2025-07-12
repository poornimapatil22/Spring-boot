<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Set New Password</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      margin-top: 10%;
      display: flex;
      justify-content: center;
      align-items: center;
      height: auto;
      background-image: url("https://wallpapercave.com/wp/wp8077684.jpg");
      background-size: cover;
      background-repeat: no-repeat;
      background-attachment: fixed;
    }

    .form-container {
      width: 100%;
      max-width: 320px;
      padding: 20px;
      border-radius: 12px;
      background-color: rgba(255, 255, 255, 0.1); /* transparent white */
      box-shadow: 0 0 15px rgba(0, 0, 0, 0.4);
      backdrop-filter: blur(6px);
      border: 1px solid rgba(255, 255, 255, 0.3);
    }

    h2 {
      text-align: center;
      margin-bottom: 20px;
      font-size: 1.4rem;
      color: white;
    }

    .form-group label {
      font-size: 0.9rem;
      font-weight: 500;
      color: white;
    }

    .form-control {
      font-size: 0.85rem;
      padding: 6px 10px;
      background-color: rgba(255, 255, 255, 0.3); /* semi-transparent input */
      border: 1px solid rgba(255, 255, 255, 0.4);
      color: #fff;
    }

    .form-control::placeholder {
      color: rgba(255, 255, 255, 0.7);
    }

    .btn-block {
      padding: 6px;
      font-size: 0.95rem;
    }

    .message {
      text-align: center;
      font-weight: bold;
      margin-bottom: 10px;
      font-size: 0.9rem;
    }

    .text-success { color: lightgreen; }
    .text-danger { color: #ff4d4d; }

    @media (max-width: 768px) {
      body {
        margin-top: 20%;
      }
    }
  </style>
</head>
<body>

<div class="form-container">
  <h2>Set New Password</h2>

  <c:if test="${not empty error}">
    <div class="message text-danger">${error}</div>
  </c:if>
  <c:if test="${not empty success}">
    <div class="message text-success">${success}</div>
  </c:if>

  <form action="setNewPassword" method="post">
    <div class="form-group">
      <label for="email">Registered Email</label>
      <input type="email" class="form-control" id="email" name="email" required placeholder="Enter your email">
    </div>

    <div class="form-group">
      <label for="password">New Password</label>
      <input type="password" class="form-control" id="password" name="password" required placeholder="Enter new password">
    </div>

    <div class="form-group">
      <label for="confirmPassword">Confirm Password</label>
      <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required placeholder="Confirm new password">
    </div>

    <button type="submit" class="btn btn-primary btn-block">Reset Password</button>
  </form>
</div>

</body>
</html>
