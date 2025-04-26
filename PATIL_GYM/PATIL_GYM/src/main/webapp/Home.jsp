<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <style>
        .video-background {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100vh;
            overflow: hidden;
            z-index: -1;
        }

        .video-background video {
            object-fit: cover;
            width: 100%;
            height: 100%;
            position: absolute;
            top: 0;
            left: 0;
            pointer-events: none;
        }

        .overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100vh;
            background: rgba(0, 0, 0, 0.5);
            z-index: 0;
        }

        .navbar {
            background-color: black;
            z-index: 1;
        }


        .navbar-nav .nav-link {
            color: white !important;
            margin-right: 15px;
            padding: 8px 16px;
            background-color: black; /* Black button-like background */
            border: 0px solid #444;
            border-radius: 6px;
            transition: background-color 0.3s ease;
            text-align: center;
        }

        .navbar-nav .nav-link:hover {
            background-color: #0d6efd;
            color: white !important;
        }


        .navbar-toggler-icon {
        color: white;

        }


        .nav-link.user-login {
            background: none !important;
            border: none !important;
            padding: 4px 8px !important;
            margin-top: 2px;
            text-align: center;
        }

        .user-login img {
            width: 30px;
            height: 30px;
            display: block;
            margin: 0 auto;
            border-radius: 50%;
        }

        .user-login span {
            font-size: 0.75rem;
            display: block;
            color: white;
            margin-top: 2px;
        }


        @media (max-width: 992px) {
            .navbar-collapse {
                background-color: rgba(1, 1, 1, 0.95);
                padding: 10px;
            }
        }
    </style>
</head>
<body>

<div class="video-background">
    <video autoplay loop muted playsinline>
        <source src="https://videos.pexels.com/video-files/4761426/4761426-uhd_2732_1440_25fps.mp4" type="video/mp4">
        Your browser does not support the video tag.
    </video>
</div>

<div class="overlay"></div>


<nav class="navbar navbar-expand-lg navbar-dark bg-black">
    <div class="container-fluid">


        <ul class="navbar-nav flex-row align-items-center">
            <li class="nav-item"><a class="nav-link" href="enquiryPlaces">Enquiry</a></li>
            <li class="nav-item"><a class="nav-link" href="followUp">Follow Up</a></li>
            <li class="nav-item"><a class="nav-link" href="register">Registration</a></li>
            <li class="nav-item"><a class="nav-link" href="UpdateRegisteredDetails.jsp">Update Profile</a></li>
            <li class="nav-item">
                <a class="nav-link user-login" href="UserLogin.jsp">
                    <img src="https://th.bing.com/th?q=User+Login+Icon.png&w=120&h=120" alt="User Icon">
                    <span>User Login</span>
                </a>
            </li>
        </ul>


        <button class="navbar-toggler ms-auto" type="button" data-bs-toggle="collapse" data-bs-target="#adminMenu">
            <span class="navbar-toggler-icon"></span>
        </button>


        <div class="collapse navbar-collapse" id="adminMenu">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="addSlots">Slots</a></li>
                <li class="nav-item"><a class="nav-link" href="viewTrainer">View Trainer</a></li>
                <li class="nav-item"><a class="nav-link" href="AssignUsers">Assign Users</a></li>
                <li class="nav-item"><a class="nav-link" href="UpdateExerciseAndDiet">Update Exercise & Diet</a></li>
                <li class="nav-item"><a class="nav-link" href="index.jsp">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container mt-5">

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
