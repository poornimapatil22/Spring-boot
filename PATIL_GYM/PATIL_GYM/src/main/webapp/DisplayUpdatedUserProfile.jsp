<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>User Profile</title>
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <style>

    body {
      background-image:url("https://static.vecteezy.com/system/resources/thumbnails/026/727/087/small_2x/gym-equipment-illustration-design-landscape-free-photo.jpg"); /* Light gray background */
      font-family: Arial, sans-serif;
       background-size: cover;
      padding: 30px 0;
    }


    .container {
      max-width: 400px;
      margin: 50px auto;
      background: rgba(255, 255, 255, 0.8);
      padding: 20px;
      border-radius: 12px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
      text-align: center;
      backdrop-filter: blur(6px);
      background: linear-gradient(135deg, rgba(255, 255, 255, 0.6), rgba(0, 123, 255, 0.5));
    }


    .profile-img {
      display: block;
      margin: 0 auto 20px;
      width: 100px;
      height: 100px;
      border-radius: 50%;
      border: 4px solid #007bff;
      box-shadow: 0 2px 12px rgba(0, 0, 0, 0.1);
    }


    .info {
      font-size: 1rem;
      color: #333;
      margin-bottom: 8px;
      text-align: left;
    }


    h2 {
      color: #333;
      font-size: 1.5rem;
      margin-bottom: 25px;
      font-weight: 600;
    }


    .btn {
      font-size: 0.9rem;
      padding: 8px 16px;
      width: 48%;
      margin: 5px;
      border-radius: 8px;
      border: none;
    }


    .btn-primary {
      background: rgba(0, 150, 136, 0.9);
      color: white;
    }


    .btn-danger {
      background: rgba(244, 67, 54, 0.9);
      color: white;
    }


    .btn-primary:hover {
      background: rgba(0, 150, 136, 1);
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    }

    .btn-danger:hover {
      background: rgba(244, 67, 54, 1);
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    }


    .button-container {
      display: flex;
      justify-content: space-between;
      margin-top: 15px;
    }


    @media (max-width: 480px) {
      .container {
        max-width: 95%;
      }

      .btn {
        font-size: 0.85rem;
        width: 100%;
        margin: 5px 0;
      }

      .profile-img {
        width: 80px;
        height: 80px;
      }
    }
  </style>
</head>
<body>

  <div class="container">
    <h2 class="text-center">User Profile</h2>


    <c:if test="${not empty list.profileImage}">

    </c:if>


    <p class="info"><strong>Name:</strong> ${list.name}</p>
    <p class="info"><strong>Email:</strong> ${list.email}</p>
    <p class="info"><strong>Phone Number:</strong> ${list.phoneNo}</p>
    <p class="info"><strong>Age:</strong> ${list.age}</p>
    <p class="info"><strong>Weight:</strong> ${list.weight} kg</p>
    <p class="info"><strong>Height:</strong> ${list.height} cm</p>


    <div class="button-container">
      <a href="UpdateUserProfile.jsp" class="btn btn-primary">Edit Profile</a>
      <a href="index.jsp" class="btn btn-danger">Log Out</a>
    </div>
  </div>

  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.4.4/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
