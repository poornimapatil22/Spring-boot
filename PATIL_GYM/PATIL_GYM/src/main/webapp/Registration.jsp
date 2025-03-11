<%@ page isELIgnored = "false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Registration Form</title>
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      margin: 0;
      background-image: url("https://cmkt-image-prd.freetls.fastly.net/0.1.0/ps/3201181/1360/906/m1/fpnw/wm1/cwqa5n3rhmfdjfgbe7pp8n3jnm9wto7thevtcy3wamvrsofmgpbiurqwkpxz75mr-.jpg?1504521588&s=176f8724f59d059b7c4da0193e3321ed");
      background-size: cover;
      background-position: center;
      background-repeat: no-repeat;
      background-attachment: fixed;
      color: #000;
      height: 100%;
    }
    .header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 15px 30px;
      position: sticky;
      top: 0;
      width: 100%;
      height: 60px;
      z-index: 999;
      color: white;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
      background-color: #1B1E23;
    }
    .header .logo {
      font-size: 1.5rem;
      font-weight: bold;
    }
    .header .nav {
      display: flex;
      gap: 20px;
    }
    .header .nav a {
      color: white;
      text-decoration: none;
      font-size: 1rem;
      transition: color 0.3s;
    }
    .header .nav a:hover {
      color: #f0c14b;
    }
    .header .logo {
      display: flex;
      align-items: center;
    }
    .logo-img {
      max-height: 51px;
      max-width: 120%;
      height: auto;
      border-radius: 50%;
    }
    .form-container {
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 20px; /* Reduced padding */
      border: 1px solid #333;
      border-radius: 10px;
      background-color: rgba(0, 0, 0, 0.7);
      margin-top: 80px;
      box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
      width: 600px;
      margin-bottom: 20px;
    }
    .form-image {
      max-width: 100%;
      height: auto;
      height: 100%;
      border-radius: 10px;
      box-shadow: 0px 2px 10px rgba(100 100, 100, 20);
    }
    label {
      color: white;
      font-weight: 100px;
    }
    .btn-center {
      display: block;
      margin: 20px auto;
      padding: 4px 100px;
      font-size: 1.2rem;
    }

    body, html {
      margin: 0;
      padding: 0;
      height: 100%;
    }
  </style>
</head>
<body>
  <header class="header">
    <div class="logo">
      <img src="https://th.bing.com/th/id/OIP.r-HF5JGN_rV2Nuyq0ZKtcQHaFj?w=185&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7" alt="Patil_gym_logo" class="logo-img">
    </div>
    <nav class="nav">
      <a href="Home.jsp">Home</a>
      <a href="enquiry">Enquiry</a>
      <a href="followUp">FollowUp</a>
      <a href="UpdateRegisteredDetails.jsp">Update</a>
    </nav>
  </header>

  <div class="container mt-5 form-container">
    <div class="row">
      <div class="col-md-12">
        <h2 class="text-center" style="color:white">Registration Form</h2>
        <form action="registration" method="post">
          <div class="form-group">
            <label for="firstName">Full Name</label>
            <input type="text" class="form-control" id="firstName" name="name" placeholder="Enter first name" required>
          </div>
          <div class="form-group">
            <label for="lastName">Email</label>
            <input type="text" class="form-control" id="email" name="email" placeholder="Enter email" required>
          </div>
          <div class="form-row">
            <div class="form-group col-md-6">
              <label for="phone">Phone Number</label>
              <input type="tel" class="form-control" id="phone" name="phoneNo" placeholder="Enter phone number" required>
            </div>
          </div>
          <div class="form-row">
            <div class="form-group col-md-6">
              <label for="city">Package</label>
              <select class="form-control" id="gymPackage" name="gymPackage" required>
                <option value="">Select package</option>
                <c:forEach items="${packagesEnumList}" var="loc">
                  <option value="${loc}">${loc}</option>
                </c:forEach>
              </select>
            </div>
            <div class="form-group col-md-6">
              <label for="state">Trainer</label>
              <select class="form-control" id="trainer" name="trainer" required>
                <option value="">Select trainer</option>
                <c:forEach items="${gymTrainersEnums}" var="loc">
                  <option value="${loc}">${loc}</option>
                </c:forEach>
              </select>
            </div>
          </div>
          <div class="form-row">
            <div class="form-group col-md-6">
              <label for="state">Discount</label>
              <div class="input-group mb-3">
                <input type="text" class="form-control" id="discount" placeholder="Enter discount" name="discount" aria-label="Server" required>
                <span class="input-group-text">%</span>
              </div>
            </div>
            <div class="form-group col-md-6">
              <label for="zipcode">Total Amount</label>
              <div class="input-group mb-3">
                <span class="input-group-text">&#8377;</span>
                <input type="text" class="form-control" id="amount" aria-label="Amount (to the nearest dollar)" name="amount">
                <span class="input-group-text">.00</span>
              </div>
            </div>
          </div>
          <div class="form-row">
            <div class="form-group col-md-6">
              <label for="password">Amount paid</label>
              <div class="input-group mb-3">
                <span class="input-group-text">&#8377;</span>
                <input type="text" class="form-control" id="amountPaid" aria-label="Amount (to the nearest dollar)" name="amountPaid" required>
                <span class="input-group-text">.00</span>
              </div>
            </div>
            <div class="form-group col-md-6">
              <label for="confirmPassword">Balance Amount</label>
              <div class="input-group mb-3">
                <span class="input-group-text">&#8377;</span>
                <input type="text" class="form-control" id="balanceamount" aria-label="Amount (to the nearest dollar)" name="balanceAmount">
                <span class="input-group-text">.00</span>
              </div>
            </div>
          </div>
          <button type="submit" class="btn btn-primary btn-center">Register</button>
        </form>
      </div>
    </div>
  </div>

  <script>
    document.addEventListener('DOMContentLoaded', function () {
      const packagePrices = {
        "BASIC": 6000,
        "PRO": 8000,
        "PREMIUM": 10000,
        "VIP": 20000
      };

      const trainerPrices = {
        "NOT_REQUIRED": 0,
        "SHISHIR": 1000,
        "GAGAN": 1000,
        "KIRAN": 1000
      };

      const packageDiscounts = {
        "BASIC": 5,
        "PRO": 10,
        "PREMIUM": 15,
        "VIP": 20
      };

      const packageSelect = document.getElementById('gymPackage');
      const trainerSelect = document.getElementById('trainer');
      const discountInput = document.querySelector('input[name="discount"]');
      const amountInput = document.querySelector('input[name="amount"]');
      const amountPaidInput = document.querySelector('input[name="amountPaid"]');
      const balanceAmountInput = document.querySelector('input[name="balanceAmount"]');

      function updateAmount() {
        let packageAmount = 0;
        let trainerAmount = 0;
        let discount = 0;

        const selectedPackage = packageSelect.value;
        const selectedTrainer = trainerSelect.value;


        if (packagePrices[selectedPackage]) {
          packageAmount = packagePrices[selectedPackage];
          discount = packageDiscounts[selectedPackage] || 0; // Get discount based on the selected package
        }


        if (trainerPrices[selectedTrainer]) {
          trainerAmount = trainerPrices[selectedTrainer];
        }


        let totalAmount = packageAmount + trainerAmount;
        totalAmount -= (totalAmount * discount) / 100;

        amountInput.value = totalAmount.toFixed(2);
        discountInput.value = discount; // Display the calculated discount in the discount field

        updateBalance();
      }

      function updateBalance() {
        const amount = parseFloat(amountInput.value) || 0;
        const amountPaid = parseFloat(amountPaidInput.value) || 0;
        const balance = amount - amountPaid;
        balanceAmountInput.value = balance.toFixed(2);
      }


      packageSelect.addEventListener('change', updateAmount);
      trainerSelect.addEventListener('change', updateAmount);
      discountInput.addEventListener('input', updateAmount);
      amountPaidInput.addEventListener('input', updateBalance);
      amountInput.addEventListener('input', updateBalance);
    });
  </script>

  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.4.4/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
