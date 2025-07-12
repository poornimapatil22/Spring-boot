<%@ page isELIgnored = "false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update User Form</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: rgba(240, 255, 255, 0.9);
            font-family: Arial, sans-serif;
            margin-top: 100px;

            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;

            background-image: url("https://thumbs.dreamstime.com/b/equipment-sport-exercise-fitness-background-dumbbells-mat-pastel-pink-top-view-copy-space-107691877.jpg") !important;

            padding-top: 80px;
        }


        .navbar {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 1000;
            background-color: rgba(255, 250, 245, 0.7);
            padding: 15px 0;
        }

        .navbar-nav .nav-item {
            margin-right: 20px;
        }

        .navbar-nav .nav-link {
            color: black !important;
            font-size: 1.2em;
        }

        .navbar-nav .nav-link:hover {
            background-color: #444;
            border-radius: 5px;
        }


        .form-container {
            max-width: 600px;
            margin: 25px auto;
            background-color: rgba(245, 245, 240, 0.9);
            padding: 10px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h2 {
            font-size: 1.8em;
            color: #333;
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-control {
            border-radius: 5px;
            border: 1px solid rgba(200, 200, 200, 0.6);
            background-color: rgba(255, 255, 255, 0.7);
            transition: all 0.3s ease;
        }

        .form-control:focus {
            border-color: rgba(0, 123, 255, 0.7);
            box-shadow: 0 0 8px rgba(0, 123, 255, 0.4);
        }

        .btn {
            width: 20%;
            padding: 12px;
            font-size: 16px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            margin-bottom: 10px;
        }

        .btn-primary {
            background-color: rgba(0, 123, 255, 0.8);
            border-color: rgba(0, 123, 255, 0.8);
        }

        .btn-primary:hover {
            background-color: rgba(0, 56, 139, 0.8);
            border-color: rgba(0, 56, 139, 0.8);
        }

        .btn-success {
            background-color: rgba(40, 167, 69, 0.8);
            border-color: rgba(40, 167, 69, 0.8);
        }

        .btn-success:hover {
            background-color: rgba(23, 126, 55, 0.8);
            border-color: rgba(23, 126, 55, 0.8);
        }

        #errorMessage {
            margin-top: 20px;
            font-size: 1.2em;
            color: red;
            text-align: center;
        }

        .form-control:disabled {
            background-color: rgba(230, 230, 230, 0.6);
        }
    </style>
</head>
<body>


    <nav class="navbar navbar-expand-lg">
        <div class="container d-flex justify-content-center">
            <ul class="navbar-nav flex-row">
                <li class="nav-item mx-3">
                    <a class="nav-link" href="Home.jsp">Home</a>
                </li>
                <li class="nav-item mx-3">
                    <a class="nav-link" href="enquiryPlaces">Enquiry</a>
                </li>
                <li class="nav-item mx-3">
                    <a class="nav-link" href="register">Registration</a>
                </li>
                <li class="nav-item mx-3">
                    <a class="nav-link" href="followUp">FollowUp</a>
                </li>
            </ul>
        </div>
    </nav>


    <div class="form-container">
        <form id="updateForm" method="post" action="updateUserDetails">
            <div class="form-group">
                <label for="name">Enter Name to Update:</label>
                <input type="text" id="name" name="name" class="form-control" placeholder="Enter Name" required />
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-primary">Search</button>
            </div>
        </form>

        <c:if test="${not empty user}">
            <form id="updateDetailsForm" method="post" action="updateRegister">
                <input type="hidden" name="id" value="${user.id}" />

                <h2 class="text-center">Update User Details</h2>

                <div class="form-group">
                    <label for="firstName">Full Name</label>
                    <input type="text" class="form-control" id="firstName" name="name" value="${user.name}" disabled />
                </div>

                <div class="form-group">
                    <label for="phone">Phone Number</label>
                    <input type="tel" class="form-control" id="phone" name="phoneNo" value="${user.phoneNo}" disabled />
                </div>

                <div class="form-group">
                    <label for="trainer">Trainer</label>
                    <select class="form-control" name="trainer" id="trainer">
                        <option value="SHISHIR" ${user.trainer == 'SHISHIR' ? 'selected' : ''}>SHISHIR</option>
                        <option value="GAGAN" ${user.trainer == 'GAGAN' ? 'selected' : ''}>GAGAN</option>
                        <option value="KIRAN" ${user.trainer == 'KIRAN' ? 'selected' : ''}>KIRAN</option>
                        <option value="NOT_REQUIRED" ${user.trainer == 'NOT_REQUIRED' ? 'selected' : ''}>NOT_REQUIRED</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="balanceAmount">Current Balance (Remaining)</label>
                    <input type="text" class="form-control" id="balanceAmount" name="balanceAmount" value="${user.balanceAmount}" disabled />
                </div>

                <div class="form-group">
                    <label for="amountPaid">Amount Paid Now</label>
                    <input type="number" class="form-control" id="amountPaid" name="amountPaid" value="0" min="0" required />
                </div>

                <div class="form-group">
                    <label for="updatedBalance">Updated Balance (After Payment)</label>
                    <input type="text" class="form-control" id="updatedBalance" name="balanceAmount" value="${user.balanceAmount}" readonly />
                </div>

                <div class="text-center">
                    <button type="submit" class="btn btn-success">Update</button>
                </div>
            </form>
        </c:if>

        <div id="errorMessage">
            <c:if test="${not empty message}">
                <p>${message}</p>
            </c:if>
        </div>
    </div>

    <script>
        document.getElementById("amountPaid").addEventListener("input", function() {
            var amountPaid = parseFloat(this.value);
            var currentBalance = parseFloat("${user.balanceAmount}");
            var newBalance = currentBalance - amountPaid;

            document.getElementById("updatedBalance").value = newBalance.toFixed(2);
            document.getElementById("balanceAmount").value = newBalance.toFixed(2);
        });
    </script>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
