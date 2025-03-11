<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PATIL_GYM_index</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>

        .navbar-custom {
            background-color: black;
        }
        .navbar-custom .nav-link {
            color: white;
            font-weight: bold;
            margin-top: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
            padding-left: 2px;
            padding-right: 2px;
        }
        .navbar-custom .nav-link:hover {
            color: #ffcc00;
        }


        .navbar-logo {
            width: 30px;
            height: 30px;
            margin-bottom: 5px;
            border-radius: 50%;
        }


        .navbar-nav {
            display: flex;
            align-items: center;
        }

        .nav-item {
            margin-left: 3px;
        }


        .nav-item:last-child a {
            margin-left: 3px;
        }


        .hero-container {
            position: relative;
            height: 100vh;
            background-image: url('https://wallpapertag.com/wallpaper/full/3/5/2/198284-gym-background-3000x1730-for-xiaomi.jpg'); /* Gym background image */
            background-size: cover;
            background-position: center;
        }

        .moving-text-wrapper {
            position: absolute;
            top: 10%;
            right: 10%;
            width: auto;
            max-width: 300px;
            padding: 10px;
        }


        .moving-text-container {
            font-size: 1.25rem;
            font-family: 'Times-New-Roman', sans-serif;
            color: white;
            text-align: left;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.7);
            animation: move-up-down 2s ease-in-out infinite;
        }


        @keyframes move-up-down {
            0% {
                transform: translateY(0);
            }
            50% {
                transform: translateY(-10px);
            }
            100% {
                transform: translateY(0);
            }
        }


        footer {
            background-color: black;
            color: white;
            padding: 20px;
            text-align: center;
        }

        .patil-logo img {
            width: 60px;
            height: 60px;
            border-radius: 50%;
        }

    </style>
</head>
<body>

    <nav class="navbar navbar-expand-sm navbar-custom">
        <div class="container-fluid">
            <a class="navbar-brand text-white" href="#">
                <div class="patil-logo">
                    <img src="https://th.bing.com/th/id/OIP.r-HF5JGN_rV2Nuyq0ZKtcQHaFj?w=185&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7" alt="Patil_gym_logo">
                </div>
                <span style="font-size:15px;">PATIL GYM</span>
            </a>
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="UserLogin.jsp">
                        <img src="https://th.bing.com/th?q=User+Login+Icon.png&w=120&h=120&c=1&rs=1&qlt=90&cb=1&dpr=1.5&pid=InlineBlock&mkt=en-IN&cc=IN&setlang=en&adlt=moderate&t=1&mw=247" alt="User Logo" class="navbar-logo">
                        <span style="font-size:15px;">User Login</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="AdminLogin.jsp">
                        <img src="https://th.bing.com/th/id/OIP.8IJwPuqG2lQ4EbiZY0erPQHaHZ?rs=1&pid=ImgDetMain" alt="Admin Logo" class="navbar-logo">
                        <span style="font-size:15px;">Admin Login</span>
                    </a>
                </li>
            </ul>
        </div>
    </nav>


    <div class="hero-container">

        <div class="moving-text-wrapper">
            <p class="moving-text-container">
                As you sweat it out, you're not just burning calories; you're igniting your determination.
            </p>
        </div>
    </div>


    <footer>
        <p>&copy; 2025 PATIL GYM | All Rights Reserved</p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-J7q51qBocGpckcH2Tc7yFEdWyPYd/UuV7Kk1Db49vFfbhsew9fz6fVoG1z69kJ5t" crossorigin="anonymous"></script>
</body>
</html>
