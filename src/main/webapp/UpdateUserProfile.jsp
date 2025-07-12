<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Update User Details</title>
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background-image: url("https://liftdex.ae/wp-content/uploads/2023/08/liftdex-dumbbells-platform.webp"); /* Background image */
      background-size: cover;
      font-family: Arial, sans-serif;
    }


    .container {
      max-width: 350px;
      margin: 50px auto;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.2);
      background: linear-gradient(135deg, rgba(52, 152, 219, 0.5), rgba(231, 76, 60, 0.5), rgba(46, 204, 113, 0.5)); /* Multi-color gradient background */
    }

    h2 {
      color: #ffffff;
      text-align: center;
      margin-bottom: 20px;
    }

    .profile-img {
      display: block;
      margin: 0 auto 15px;
      max-width: 80px;
      height: 80px;
      border-radius: 50%;
      border: 3px solid rgba(231, 76, 60, 0.7);
    }

    label {
      font-weight: bold;
      color: #ffffff;
    }


    .form-control {
      background: rgba(52, 152, 219, 0.3);
      border: 1px solid rgba(231, 76, 60, 0.6);
      color: white;
      margin-bottom: 15px;
    }

    .form-control:focus {
      background: rgba(46, 204, 113, 0.5);
      border-color: rgba(241, 196, 15, 1);
      box-shadow: 0 0 5px rgba(231, 76, 60, 0.5);
    }


    .btn-primary {
      background: linear-gradient(135deg, rgba(52, 152, 219, 0.7), rgba(231, 76, 60, 0.7));
      border-color: rgba(52, 152, 219, 1);
      color: white;
      font-size: 1rem;
      padding: 10px;
      border-radius: 5px;
    }

    .btn-primary:hover {
      background: linear-gradient(135deg, rgba(52, 152, 219, 1), rgba(231, 76, 60, 1));
    }


    .message {
      color: rgba(46, 204, 113, 1);
      font-weight: bold;
      text-align: center;
      margin-bottom: 15px;
    }
  </style>
</head>
<body>

  <div class="container">
    <h2>Update Profile</h2>


    <c:if test="${not empty entity.profileImage}">
      <img src="photo/${entity.profileImage}" alt="Profile Picture" class="profile-img">
    </c:if>

    <form action="updateUserProfile" method="post" enctype="multipart/form-data">
      <div class="form-group">
        <label for="firstName">Full Name</label>
        <input type="text" class="form-control" id="firstName" name="name" required value="${entity.name}">
      </div>

      <div class="form-group">
        <label for="email">Email</label>
        <input type="email" class="form-control" id="email" name="email" required value="${entity.email}">
      </div>

      <div class="form-group">
        <label for="phone">Phone Number</label>
        <input type="tel" class="form-control" id="phone" name="phoneNo" required value="${entity.phoneNumber}">
      </div>

      <div class="form-group">
        <label for="age">Age</label>
        <input type="number" class="form-control" id="age" name="age" required value="${entity.age}">
      </div>

      <div class="form-group">
        <label for="weight">Weight (kg)</label>
        <input type="number" class="form-control" id="weight" name="weight" required value="${entity.weight}">
      </div>

      <div class="form-group">
        <label for="height">Height (cm)</label>
        <input type="number" class="form-control" id="height" name="height" required value="${entity.height}">
      </div>

      <div class="form-group">
        <label for="formFile">Upload Profile Image</label>
        <input type="file" class="form-control" id="formFile" name="thisfile" accept="image/*">
      </div>

      <button type="submit" class="btn btn-primary">Save Changes</button>
    </form>
  </div>

  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.4.4/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
