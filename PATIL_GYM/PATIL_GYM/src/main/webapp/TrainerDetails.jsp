<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trainer Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <style>
        body {
          min-height: 100vh;
          margin: 0;
          background-image: url("https://i.pinimg.com/originals/71/60/c9/7160c9f131fe0685678a5749e264e054.png");
          background-size: cover;
          background-position: center;
          background-repeat: no-repeat;
          background-attachment: fixed;
          color: #000;
        }

        .table-container {
          margin-top: 0;
          background-color: #fff;
          padding: 20px;
          border-radius: 10px;
          box-shadow: 0 4px 15px rgba(0, 0, 0, 0.15);
          width: 100%;
          overflow-x: auto;
        }

        .table-name {
          position: sticky;
          top: 0;
          background-color: #f8f9fa;
          padding: 10px;
          z-index: 2;
          text-align: center;
          font-size: 1.25rem;
          font-weight: bold;
          border-bottom: 1px solid #dee2e6;
        }

        table {
          width: 100%;
          border-collapse: collapse;
        }

        table thead tr {
          position: sticky;
          top: 0;
          background-color: #f8f9fa;
          z-index: 1;
        }

        table th {
          background-color: #f8f9fa;
          font-size: 1rem;
          font-weight: 600;
          text-align: center;
          padding: 12px 15px;
          border-bottom: 1px solid #dee2e6;
        }

        table td {
          text-align: center;
          padding: 12px 15px;
        }

        table tr:hover {
          background-color: #f1f1f1;
        }

        table th, table td {
          border: 1px solid #dee2e6;
        }

        .container {
          margin-top: 40px;
          margin-bottom: 50px;
          width: 100%;
          background-color: rgba(255, 255, 255, 0.7);
          padding: 20px;
          border-radius: 10px;
          box-shadow: 0 4px 15px rgba(0, 0, 0, 0.15);
          transition: background-color 0.3s ease;
          margin-bottom: 10px;
        }

        .search-row {
          margin-bottom: 20px;
          display: flex;
          justify-content: flex-end;
          gap: 10px;
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
          background-color: #0E0E0E;
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
    </style>
</head>
<body>


<header class="header">

    <nav class="nav">
      <a href="Home.jsp">Home</a>
      <a href="enquiryPlaces">Enquiry</a>
      <a href="followUp">FollowUp</a>
      <a href="register">Registration</a>
    </nav>


    <div class="menu-toggle" onclick="toggleMenu()">
        <div></div>
        <div></div>
        <div></div>
    </div>
</header>

<div class="container">

    <div class="search-row">
        <a href="onButtonClick" class="btn btn-primary">
            <button class="btn btn-primary">Add trainer</button>
        </a>
    </div>


    <h5 style="color:green;margin-left:40%">${success}</h5>
    <h4 style="color:red; margin-left:40%">${deletedTrainerSlot}</h4>


    <c:if test="${not empty trainerDetails}">
        <div class="table-container">
            <h4 class="table-name">Trainer Slots</h4>
            <form action="deleteTrainerSlot" method="POST">
                <table class="table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Phone Number</th>
                            <th>Slot Time</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${trainerDetails}" var="trainerDetails">
                            <tr>
                                <form action="deleteTrainerSlot" method="POST">
                                    <input type="hidden" name="trainerId" value="${trainerDetails.id}" />
                                    <input type="hidden" name="trainerName" value="${trainerDetails.trainerName}" />
                                    <td>${trainerDetails.trainerName}</td>
                                    <td>${trainerDetails.phoneNo}</td>
                                    <td>${trainerDetails.slotTime}</td>
                                    <td>
                                        <button type="submit" class="btn btn-danger">Delete</button>
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
</script>

</body>
</html>
