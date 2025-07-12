<%@ page isELIgnored = "false"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Set New Password</title>
    <style>
        @import url("https://fonts.googleapis.com/css2?family=Open+Sans:wght@200;300;400;500;600;700&display=swap");


        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Open Sans', sans-serif;
        }

        body {
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            width: 100%;
            background-color: #000;
            padding: 0 10px;
            background: url("https://img.freepik.com/premium-photo/close-up-black-gym-dumbbells-isolated_312869-59.jpg?w=1060") no-repeat center center fixed;
            background-size: cover;
        }

        .wrapper {
            width: 400px;
            border-radius: 8px;
            padding: 30px;
            text-align: center;
            background-color: rgba(0, 0, 0, 0.7);
            color: #fff;
            border: 1px solid rgba(255, 255, 255, 0.5);
            backdrop-filter: blur(8px);
            -webkit-backdrop-filter: blur(8px);
        }

        h2 {
            font-size: 2rem;
            margin-bottom: 20px;
            color: #fff;
        }

        .input-field {
            position: relative;
            border-bottom: 2px solid #ccc;
            margin: 15px 0;
        }

        .input-field label {
            position: absolute;
            top: 50%;
            left: 0;
            transform: translateY(-50%);
            color: #fff;
            font-size: 16px;
            pointer-events: none;
            transition: 0.15s ease;
        }

        .input-field input {
            width: 100%;
            height: 40px;
            background: transparent;
            border: none;
            outline: none;
            font-size: 16px;
            color: #fff;
        }

        .input-field input:focus ~ label,
        .input-field input:valid ~ label {
            font-size: 0.8rem;
            top: 10px;
            transform: translateY(-120%);
        }

        .forget {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin: 25px 0 35px 0;
            color: #fff;
        }

        #remember {
            accent-color: #fff;
        }

        .forget label {
            display: flex;
            align-items: center;
        }

        .forget label p {
            margin-left: 8px;
        }

        .wrapper a {
            color: #efefef;
            text-decoration: none;
        }

        .wrapper a:hover {
            text-decoration: underline;
        }

        button {
            background: #fff;
            color: #000;
            font-weight: 600;
            border: none;
            padding: 12px 20px;
            cursor: pointer;
            border-radius: 3px;
            font-size: 16px;
            border: 2px solid transparent;
            transition: 0.3s ease;
        }

        button:hover {
            color: #fff;
            border-color: #fff;
            background: rgba(255, 255, 255, 0.15);
        }

        .register {
            text-align: center;
            margin-top: 30px;
            color: #fff;
        }

        .register a {
            color: #fff;
            text-decoration: underline;
        }

        .register a:hover {
            color: #efefef;
        }

        .error-message {
            color: red;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="wrapper">
        <form action="setUserNewPassword" method="post">
            <h2>Set New Password</h2>

            
            <c:if test="${not empty notSetNewPassword}">
                <div class="error-message">${notSetNewPassword}</div>
            </c:if>

            <div class="input-field">
                <input type="email" id="email" name="email" required>
                <label for="email">Enter your email</label>
            </div>

             <div class="input-field">
                     <input type="password"  id="oldPassword" name="oldPassword"  required>
                      <label for="oldPassword">Enter Your Old Password</label>
                 </div>

            <div class="input-field">
         <input type="password" id="newPassword" name="newPassword" required>
         <label for="newPassword">Enter Your New Password</label>
             </div>



            <div class="input-field">
                <input type="password" id="confirmPassword" name="confirmPassword" required>
                <label for="confirmPassword">Confirm your password</label>
            </div>




            <div class="forget">
                <label for="remember">
                    <input type="checkbox" id="remember">
                    <p>Remember me</p>
                </label>
                <a href="#">Forgot password?</a>
            </div>

            <button type="submit">Set New Password</button>

            <div class="register">
                <p>Don't have an account? <a href="Registration.jsp">Register</a></p>
            </div>
        </form>
    </div>
</body>
</html>
