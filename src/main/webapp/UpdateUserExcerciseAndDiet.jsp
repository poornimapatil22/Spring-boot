<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>UpdateUserExerciseAndDiet</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <style>
        body {
          min-height: 100vh;
          margin: 0;
          background-image: url("https://www.lek.com/sites/default/files/hero-images/insights/COVID-19-fitness-club-business.jpg");
          background-size: cover;
          background-position: center;
          background-repeat: no-repeat;
          background-attachment: fixed;
          color: #fff;
        }

        .table-container {
          margin-top: 20px;
          padding: 20px;
          border-radius: 10px;
          box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
          width: 100%;
          background-color: rgba(0, 0, 0, 0.6) !important;
        }

        .table-name {
          position: sticky;
          top: 0;
          background-color: rgba(0, 0, 0, 0.8) !important;
          padding: 10px;
          z-index: 2;
          text-align: center;
          font-size: 1.25rem;
          font-weight: bold;
          color: white;
        }

        table {
          background-color: transparent !important;
        }

        table thead tr {
          background-color: rgba(0, 0, 0, 0.8) !important;
        }

        table th, table td {
          background-color: rgba(0, 0, 0, 0.7) !important;
          color: white !important;
          padding: 10px !important;
        }

        .btn-sm {
          padding: 5px 10px;
          font-size: 0.875rem;
        }

        .container {
          margin-top: 40px;
          margin-bottom: 50px;
          width: 100%;
          padding: 20px;
          border-radius: 10px;
          box-shadow: 0 4px 15px rgba(0, 0, 0, 0.15);
          transition: background-color 0.3s ease;
        }

        .search-message {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 20px;
            text-align: center;
        }

        .search-row {
            display: flex;
            justify-content: right;
            align-items: center;
            margin-bottom: 20px;
        }

        .form-control {
            padding: 10px;
            font-size: 16px;
        }

        .pagination {
          display: flex;
          justify-content: center;
          margin-top: 20px;
        }

        .page-link {
          color: #007bff;
          text-decoration: none;
          margin: 0 5px;
          padding: 8px 12px;
          border: 1px solid #007bff;
          border-radius: 5px;
        }

        .page-link:hover {
          background-color: #007bff;
          color: #fff;
        }

        .page-link.active {
          background-color: #007bff;
          color: #fff;
        }

        .header {
              display: flex;
              justify-content: space-between;
              align-items: center;
              padding: 15px 30px;
              position: sticky;
              top: 0;
              width: 100%;
              height: 65px;
              z-index: 999;
              color: white;
              box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
              background-color: #1B1E23;
        }

        .logo-img {
          max-height: 51px;
          height: auto;
        }

        .nav {
          display: flex;
          align-items: center;
          gap: 30px;
          position: absolute;
          left: 50%;
          transform: translateX(-50%);
        }

        .nav a {
          color: white;
          text-decoration: none;
          font-size: 1rem;
          transition: color 0.3s;
        }

        .nav a:hover {
          color: #f0c14b;
        }

        .profile-img {
          max-height: 40px;
          width: 40px;
          border-radius: 50%;
          margin-right: 10px;
        }

        .menu-toggle {
          display: flex;
          flex-direction: column;
          cursor: pointer;
        }

        .menu-toggle div {
          width: 30px;
          height: 3px;
          background-color: white;
          margin: 5px 0;
          transition: 0.3s;
        }

        .mobile-nav {
          display: none;
          flex-direction: column;
          position: absolute;
          top: 65px;
          right: 0;
          background: rgba(14, 14, 14, 0.9);
          width: 100%;
          padding: 15px 0;
          align-items: center;
        }

        .mobile-nav a {
          padding: 10px;
          color: white;
          text-decoration: none;
          font-size: 1rem;
          text-align: center;
          display: block;
          width: 100%;
          transition: color 0.3s;
        }

        .mobile-nav a:hover {
          color: #f0c14b;
        }

        .mobile-nav.show {
          display: flex;
        }

        @media (max-width: 768px) {
          .nav {
            display: none;
          }
        }

        .update {
          font-size: 30px;
        }

        #nameValid {
          margin-top: 10px;
          color: green;
        }

        .header .profile-img {
          max-height: 40px;
          width: 40px;
          border-radius: 50%;
        }
    </style>
</head>
<body>

<div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); text-align: center;">
    <h5 style="color: red;">${failure}</h5>
    <p class="update" style="color:red">${notupdated}</p>
    <p class="update" style="color:green">${enquiryName}</p>
</div>

<header class="header">
    <nav class="nav">
        <a href="Home.jsp">Home</a>
        <a href="enquiryPlaces">Enquiry</a>
        <a href="followUp">FollowUp</a>
        <a href="register">Registration</a>
    </nav>

    <div style="display: flex; align-items: center;">
        <div class="menu-toggle" onclick="toggleMenu()">
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>

    <nav class="mobile-nav">
        <a href="updateForm">Update</a>
        <a href="addSlots">Slots</a>
        <a href="viewTrainer">View Trainer</a>
        <a href="AssignUsers">AssignUsers</a>
        <a href="UpdateExerciseAndDiet">UpdateUserExerciseAndDiet</a>
        <a href="index.jsp">Logout</a>
    </nav>
</header>

<div class="container">
    <div class="search-row" style="display: flex; flex-direction: column; gap: 10px; align-items: flex-end;">
        <form action="searchUser" style="display: flex; gap: 10px; align-items: center;">
            <input type="text" class="form-control form-control-sm" id="searchName" name="searchName" placeholder="Search name" oninput="onField()" required>
            <input type="text" class="form-control form-control-sm" id="searchPhoneNo" name="searchPhoneNo" placeholder="Search phone number" oninput="onField()" required>
            <button type="submit" class="btn btn-primary btn-sm">Search</button>
        </form>
        <div id="nameValid" style="margin-top: 0px; color: red;"></div>
    </div>

    <div class="search-message">
        <h4 style="color: red;">${listEmpty}</h4>
        <h4 style="color: red;">${notFound}</h4>
    </div>

    <c:if test="${not empty list}">
        <div class="table-container">
            <h5 style="color:green; text-align:center;padding:10px">${success}</h5>
            <h4 class="table-name">Registered User Details</h4>
            <form action="updateDiet">
                <table class="table table-striped table-bordered table-hover">
                    <colgroup>
                        <col style="width: 18%;">
                        <col style="width: 15%;">
                        <col style="width: 10%;">
                        <col style="width: 20%;">
                        <col style="width: 10%;">
                    </colgroup>
                    <thead>
                    <tr>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Phone Number</th>
                        <th>Update</th>
                        <th>View</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${list}" var="enquiry">
                        <tr>
                            <form action="updateDiet">
                                <input type="hidden" name="id" value="${enquiry.id}" />
                                <td>${enquiry.name}</td>
                                <td>${enquiry.email}</td>
                                <td>${enquiry.phoneNo}</td>
                                <td>
                                    <button type="submit" class="btn btn-success btn-sm">Update Diet</button>
                                </td>
                                <td>
                                    <a href="viewUserExercise?id=${enquiry.id}" class="btn btn-success btn-sm">View</a>
                                </td>
                            </form>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </form>
        </div>
        <c:if test="${totalPages > 1}">
            <div class="pagination">
                <c:forEach begin="1" end="${totalPages}" var="i">
                    <a href="followupoperation?page=${i}" class="page-link ${currentPage == i ? 'active' : ''}">${i}</a>
                </c:forEach>
            </div>
        </c:if>
    </c:if>
</div>

<script>
    function toggleMenu() {
        document.querySelector('.mobile-nav').classList.toggle('show');
    }

    const onField = () => {
        var searchName = document.getElementById("searchName").value;
        var searchPhoneNo = document.getElementById("searchPhoneNo").value;
        var nameValidDiv = document.getElementById("nameValid");

        var namePattern = /^[A-Za-z\s]+$/;
        var phonePattern = /^[0-9]*$/;

        if (searchName !== "" && !namePattern.test(searchName)) {
            nameValidDiv.innerHTML = "Please enter only alphabets for the name.";
            return;
        }

        if (searchPhoneNo !== "" && !phonePattern.test(searchPhoneNo)) {
            nameValidDiv.innerHTML = "Please enter only numbers for the phone number.";
            return;
        }

        nameValidDiv.innerHTML = "";

        if (searchName !== "" && searchPhoneNo !== "") {
            var xhttp = new XMLHttpRequest();
            var url = "http://localhost:8080/PATIL_GYM/search?searchName=" + encodeURIComponent(searchName) + "&searchPhoneNo=" + encodeURIComponent(searchPhoneNo);
            xhttp.open("GET", url, true);
            xhttp.send();

            xhttp.onload = function () {
                nameValidDiv.innerHTML = this.responseText;
            };
        }
    };
</script>

</body>
</html>
