<%@ page isELIgnored = "false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update User Form</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">

        <form id="updateForm" method="post" action="updateUserDetails">
            <div class="form-group">
                <label for="name">Enter Name to Update:</label>
                <input type="text" id="name" name="name" class="form-control" placeholder="Enter Name" required />
            </div>
            <button type="submit" class="btn btn-primary">Search</button>
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
                    <!-- Remove the "disabled" attribute here, so this field will be submitted -->
                    <input type="text" class="form-control" id="updatedBalance" name="balanceAmount" value="${user.balanceAmount}" readonly />
                </div>

                <button type="submit" class="btn btn-success">Update</button>
            </form>
        </c:if>

        <div id="errorMessage" style="color: red;">
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
</body>
</html>
