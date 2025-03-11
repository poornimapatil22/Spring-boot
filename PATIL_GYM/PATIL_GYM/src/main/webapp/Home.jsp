<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
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
            padding-top: 0.5rem;
            padding-bottom: 0.5rem;
            position: relative;
            z-index: 1;
        }


        .navbar-nav .nav-link {
            font-size: 0.9rem;
            padding: 8px 12px;
            margin: 10px;
            border-radius: 5px;
            transition: 0.3s ease-in-out;
            color: white !important;
            background-color: black;
        }

        .navbar-nav .nav-link:hover {
            background-color: #0056b3 !important;
            color: white !important;
        }


        .patil-logo-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
        }

        .patil-logo-container img {
            width: 40px;
            height: 40px;
            border-radius: 50px;
            object-fit: cover;
        }

        .patil-logo-text {
            font-size: 12px;
            color: white;
            font-weight: bold;
            margin-top: 3px;
        }


        .container {
            position: relative;
            z-index: 1;
            color: white;
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


    <nav class="navbar navbar-expand-sm">
        <div class="container-fluid d-flex justify-content-between align-items-center">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link btn me-2" href="enquiryPlaces">Enquiry</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link btn me-2" href="followUp">Follow Up</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link btn me-2" href="register">Registration</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link btn" href="UpdateRegisteredDetails.jsp">Update Profile</a>
                </li>

            </ul>
            <div class="patil-logo-container">
                <img src="https://th.bing.com/th/id/OIP.r-HF5JGN_rV2Nuyq0ZKtcQHaFj?w=185&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7" alt="Patil Gym Logo">
                <span class="patil-logo-text">PATIL GYM</span>
            </div>
        </div>
    </nav>


    <div class="container mt-5">
        <!-- Add your page content here -->
    </div>
</body>
</html>
