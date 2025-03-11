<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet"> <!-- Font Awesome for icons -->
    <style>

        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            font-family: Arial, sans-serif;
        }


        .background {
            position: relative;
            height: 100vh;
            background-size: cover;
            background-position: center;
            background-image: url('https://wallpapertag.com/wallpaper/full/3/5/2/198284-gym-background-3000x1730-for-xiaomi.jpg');
        }


        .card {
            background-color: #000;
            color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .card-body {
            padding: 30px;
        }


        .form-control {
            color: black;
            background-color: white;
            border: 1px solid #444;
            padding-left: 35px;
        }

        .form-control:focus {
            background-color: white;
            border-color: #007bff;
        }


        .input-icon {
            position: absolute;
            left: 10px;
            top: 50%;
            transform: translateY(-50%);
            color: #aaa;
        }


        .btn-primary {
            background-color: #007bff;
            border: none;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }


        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100%;
        }

        .mb-3 {
            margin-bottom: 1rem;
        }

        .form-group {
            position: relative;
        }


        .patil-logo-container {
            display: flex;
            align-items: center;
        }

        .patil-logo img {
            width: 35px;
            height: 35px;
            border-radius: 50%;
        }


        .navbar {
            padding: 0.3rem 1rem;
            font-size: 14px;
        }

        .navbar .navbar-brand,
        .navbar span {
            font-size: 14px;
            color: white;
        }


        .patil-logo-container span {
            margin-left: 8px;
             flex-direction: column;
            font-size: 14px;
        }

    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-sm bg-dark">
        <div class="container-fluid">

            <div class="patil-logo-container">
                <img src="https://th.bing.com/th/id/OIP.r-HF5JGN_rV2Nuyq0ZKtcQHaFj?w=185&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7" style="width: 60px; height: 60px; border-radius: 50%; alt="Patil_gym_logo" class="patil-logo">
                <span>PATIL GYM</span>
            </div>

            <img src="https://th.bing.com/th/id/OIP.8IJwPuqG2lQ4EbiZY0erPQHaHZ?rs=1&pid=ImgDetMain" alt="Admin Logo" class="navbar-logo" style="width: 60px; height: 60px; border-radius: 50%;">
        </div>
    </nav>


    <div class="background">
        <div class="container">
            <div class="row w-100">
                <div class="col-lg-6 col-md-8 col-sm-10 mx-auto">
                    <div class="card shadow-sm">
                        <div class="card-body">
                            <h4 class="card-title text-center">Admin Login</h4>
                            <form action="adminLogin" method="post">

                                <div class="mb-3 form-group">
                                    <label for="email" class="form-label">Email</label>
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="fas fa-envelope"></i></span> <!-- Email icon -->
                                        <input type="email" class="form-control" id="email" name="email" placeholder="Enter your Email" required>
                                    </div>
                                </div>


                                <div class="mb-3 form-group">
                                    <label for="password" class="form-label">Password</label>
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="fas fa-eye" id="togglePassword" style="cursor: pointer;"></i></span> <!-- Eye icon for password toggle -->
                                        <input type="password" class="form-control" id="password" name="password" required>
                                    </div>
                                </div>


                                <button type="submit" class="btn btn-primary w-100">Login</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>

        const togglePassword = document.getElementById('togglePassword');
        const passwordField = document.getElementById('password');

        togglePassword.addEventListener('click', function () {

            const type = passwordField.type === 'password' ? 'text' : 'password';
            passwordField.type = type;


            this.classList.toggle('fa-eye-slash');
        });
    </script>
</body>
</html>
