<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            background-image: url("https://img.freepik.com/premium-photo/illustration-fitness-equipments-design-background_916191-36199.jpg"); /* Gym background image */
            background-size: cover;
            background-position: center;
            font-family: 'Arial', sans-serif;
            padding-top: 20px;
        }

        .container {
            max-width: 350px;
            margin-top: 50px;
        }

        .card {
            background: linear-gradient(135deg, rgba(52, 152, 219, 0.6), rgba(46, 204, 113, 0.6));
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
            padding: 20px;
        }

        .card-body {
            background: rgba(52, 152, 219, 0.4);
            border-radius: 10px;
            padding: 15px;
        }

        h2 {
            text-align: center;
            color: #ffffff;
            font-size: 1.5rem;
            margin-bottom: 20px;
        }

        .card h4 {
            color: #ffffff;
            font-size: 1.2rem;
        }

        .btn {
            border-radius: 5px;
            padding: 6px 12px;
            font-size: 0.9rem;
            width: 48%;
        }

        .btn-success {
            background: rgba(39, 174, 96, 0.8);
            border-color: rgba(39, 174, 96, 0.8);
        }

        .btn-danger {
            background: rgba(231, 76, 60, 0.8);
            border-color:#9B111E;
        }

        .btn-success:hover {
            background: rgba(46, 204, 113, 1);
        }

        .btn-danger:hover {
            background: rgba(192, 57, 43, 1);
        }

        .img-thumbnail {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            border: 4px solid rgba(52, 152, 219, 1);
            margin-bottom: 15px;
            display: block;
            margin-left: auto;
            margin-right: auto;
        }

        .form-group label {
            color: #ffffff;
            font-size: 0.9rem;
        }

        .form-control {
            background: rgba(52, 152, 219, 0.6);
            border-radius: 5px;
            border: 1px solid rgba(52, 152, 219, 0.6);
            padding: 8px;
            font-size: 0.9rem;
            color: white;
        }

        .form-control:focus {
            background: rgba(46, 204, 113, 0.8);
            box-shadow: 0 0 5px rgba(39, 174, 96, 0.4);
        }

        .message {
            color: green;
            font-weight: bold;
            text-align: center;
            margin-bottom: 15px;
        }


        .button-container {
            display: flex;
            justify-content: space-between;
            margin-top: 15px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="card">
            <div class="card-body text-center">
                <h2>User Profile</h2>
                <div class="message">${passwordSuccess}</div>


                <c:if test="${not empty userRegEntity.profileImage}">
                    <img src="photo/${userRegEntity.profileImage}"  class="img-thumbnail">
                </c:if>

                <h4>Welcome, ${userRegEntity.name}!</h4>


                <p><strong>Email:</strong> ${userRegEntity.email}</p>
                <p><strong>Phone Number:</strong> ${userRegEntity.phoneNo}</p>
                <p><strong>Age:</strong> ${userRegEntity.age}</p>
                <p><strong>Weight:</strong> ${userRegEntity.weight}</p>
                <p><strong>Height:</strong> ${userRegEntity.height}</p>


                <div class="button-container">

                    <a href="UpdateUserProfile.jsp" class="btn btn-success">Update Profile</a>


                    <a href="index.jsp" class="btn btn-danger">Logout</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>