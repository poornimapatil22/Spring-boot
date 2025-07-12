<%@ page isELIgnored = "false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search User Details</title>
    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background: url('https://img.freepik.com/free-photo/fitness-equipment-dumbbells-against-black-background_1232-1979.jpg?w=1060') no-repeat center center / cover;
            background-attachment: fixed;
            font-family: Arial, sans-serif;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #fff;
            margin: 0;
        }

        .container {
            max-width: 800px;
            width: 100%;
            background: rgba(0, 0, 0, 0.7);
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5);
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #fff;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            font-size: 1.1rem;
            border-radius: 5px;
            border: 1px solid #ddd;
        }

        .form-control:focus {
            border-color: #ff4081;
            outline: none;
        }

        button {
            width: 100%;
            padding: 12px;
            font-size: 1.2rem;
            background-color: #ff4081;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #f50057;
        }

        .table {
            width: 100%;
            margin-top: 30px;
            background-color: #FFDEE9;
            background-image: linear-gradient(270deg, #FFDEE9 0%, #B5FFFC 100%);
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(200, 200, 200, 0.7);
        }

        .table th, .table td {
            padding: 15px;
            text-align: left;
        }

        .table th {
            background-color: #f50057;
            color: white;
        }

        .go-back {
            text-align: center;
            margin-top: 20px;
        }

        .go-back a {
            color: #fff;
            font-size: 1rem;
            text-decoration: none;
            background-color: #5c6bc0;
            padding: 10px 20px;
            border-radius: 5px;
        }

        .go-back a:hover {
            background-color: #3949ab;
        }


        @media (max-width: 768px) {
            .container {
                padding: 20px;
            }

            .form-control, button {
                font-size: 1rem;
            }

            .table th, .table td {
                padding: 12px;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Search User Details</h2>

    <form method="get" action="searchController" class="mb-4">
        <div class="form-group">
            <label for="searchName" class="form-label">Enter User's Name:</label>
            <input type="text" class="form-control" id="searchName" name="searchName" required placeholder="Enter Name">
        </div>
        <button type="submit">Search</button>
    </form>

    <c:if test="${not empty registerDTO}">
        <table class="table table-bordered">
            <tbody>
            <tr>
                <th>Full Name</th>
                <td>${registerDTO.name}</td>
            </tr>
            <tr>
                <th>Email</th>
                <td>${registerDTO.email}</td>
            </tr>
            <tr>
                <th>Phone Number</th>
                <td>${registerDTO.phoneNo}</td>
            </tr>
            <tr>
                <th>Gym Package</th>
                <td>${registerDTO.gympackage}</td>
            </tr>
            <tr>
                <th>Trainer</th>
                <td>${registerDTO.trainer}</td>
            </tr>
            <tr>
                <th>Discount</th>
                <td>${registerDTO.discount}</td>
            </tr>
            <tr>
                <th>Total Amount</th>
                <td>${registerDTO.amount}</td>
            </tr>
            <tr>
                <th>Amount Paid</th>
                <td>${registerDTO.amountPaid}</td>
            </tr>
            <tr>
                <th>Balance Amount</th>
                <td>${registerDTO.balanceAmount}</td>
            </tr>
            <tr>
                <th>Start Date</th>
                <td>${registerDTO.startDate}</td>
            </tr>
            <tr>
                <th>End Date</th>
                <td>${registerDTO.endDate}</td>
            </tr>
            <tr>
                <th>Payment Method</th>
                <td>${registerDTO.paymentMethod}</td>
            </tr>
            <tr>
                <th>Address</th>
                <td>${registerDTO.address}</td>
            </tr>
            <tr>
                <th>Notes</th>
                <td>${registerDTO.notes}</td>
            </tr>
            </tbody>
        </table>
    </c:if>


    <c:if test="${empty registerDTO}">
        <p class="text-center text-warning">No data found for the entered name.</p>
    </c:if>
</div>

</body>
</html>
