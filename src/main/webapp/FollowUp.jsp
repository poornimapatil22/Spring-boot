<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Follow-up</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
  <style>
    body {
      min-height: 100vh;
      background-color: black;
      background-image: url('https://img.freepik.com/premium-photo/dumbbells-water-bottle-jump-rope-gym-mat_634830-1685.jpg');
      background-size: cover;
      background-position: center center;
      background-attachment: fixed;
      color: black;
      padding-top: 80px;
    }

    .navbar {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      z-index: 1000;
      background-color: black;
      padding: 10px 0;
    }

    .navbar-nav a {
      color: white !important;
      text-decoration: none;
      padding: 10px 20px;
      font-size: 1.1rem;
      font-weight: 500;
    }

    .navbar-nav a:hover {
      background-color: #444;
      border-radius: 5px;
    }

    .container {
      margin-top: 100px;
      background-color: rgba(230, 230, 250, 0.5);
      padding: 30px;
      border-radius: 15px;
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
    }

    .search-row {
      margin-bottom: 20px;
      display: flex;
      justify-content: flex-end;
      gap: 10px;
    }

    .table {
      width: 100%;
      margin-top: 20px;
      border-collapse: collapse;
      table-layout: fixed;
    }

    .table th,
    .table td {
      padding: 12px;
      text-align: left;
      border-bottom: 1px solid #ddd;
      vertical-align: middle;
      word-wrap: break-word;
    }

    .table th {
      background-color: #343a40;
      color: white;
    }

    .table td {
      background-color: rgba(230, 230, 250, 0.5);
    }

    .table td select,
    .table td textarea {
      width: 100%;
      box-sizing: border-box;
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

    .no-records {
      text-align: center;
      font-size: 18px;
      color: black;
      rgba(230, 230, 250, 0.5);
      margin-top: 40px;
    }

    .no-records i {
      font-size: 40px;
      color: black;

    }

    .not-updated {
      color: #ff4d4d;
      font-weight: bold;
      font-size: 18px;
      text-align: center;
      margin-bottom: 20px;
    }

    .table td textarea {
      resize: none;
      height: 100px;
      font-size: 14px;
      padding: 8px;
    }
  </style>
</head>

<body>


  <nav class="navbar navbar-dark bg-dark fixed-top">
    <div class="container-fluid justify-content-center">
      <ul class="navbar-nav flex-row gap-3">
      <li class="nav-item">
                <a class="nav-link" href="Home.jsp">Home</a>
              </li>
        <li class="nav-item">
          <a class="nav-link" href="enquiryPlaces">Enquiry</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="register">Registration</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="UpdateRegisteredDetails.jsp">Update</a>
        </li>
      </ul>
    </div>
  </nav>


  <c:if test="${not empty notUpdated}">
    <div class="not-updated">
      ${notUpdated}
    </div>
  </c:if>

  <div class="container">

    <div class="search-row">
      <form action="followUpOperation" method="POST" style="display: flex; gap: 10px;">
        <select class="form-control" name="status" required>
          <option value="select">Filter by Status</option>
          <option value="Enquiry">Enquiry</option>
          <option value="Registration">Registration</option>
          <option value="Registred">Registered</option>
          <option value="Not Interested">Not Interested</option>
          <option value="Interested">Interested</option>
        </select>
        <button type="submit" class="btn btn-primary">Filter</button>
      </form>
    </div>


    <c:if test="${not empty list}">
      <table class="table">
        <thead>
          <tr>
            <th>Name</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Area</th>
            <th>Status</th>
            <th>Reason</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach items="${list}" var="enquiry">
            <tr>
              <td>${enquiry.name}</td>
              <td>${enquiry.email}</td>
              <td>${enquiry.phoneNumber}</td>
              <td>${enquiry.areaName}</td>
              <td>
                <form action="updateStatus" method="POST">
                  <input type="hidden" name="enquiryId" value="${enquiry.id}" />
                  <input type="hidden" name="enquiryName" value="${enquiry.name}" />
                  <select class="form-control" name="status" required>
                    <option value="Enquiry" ${enquiry.status == 'Enquiry' ? 'selected' : ''}>Enquiry</option>
                    <option value="Registration" ${enquiry.status == 'Registration' ? 'selected' : ''}>Registration</option>
                    <option value="Registred" ${enquiry.status == 'Registred' ? 'selected' : ''}>Registered</option>
                    <option value="Not Interested" ${enquiry.status == 'Not Interested' ? 'selected' : ''}>Not Interested</option>
                    <option value="Interested" ${enquiry.status == 'Interested' ? 'selected' : ''}>Interested</option>
                  </select>
              </td>
              <td>
                <textarea class="form-control" name="reason" rows="3" placeholder="Update the reason">${enquiry.reason}</textarea>
              </td>
              <td>
                <button type="submit" class="btn btn-success mt-3">Update</button>
                </form>
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>

      <c:if test="${totalPages > 1}">
        <div class="pagination">
          <c:forEach begin="1" end="${totalPages}" var="i">
            <a href="followUpOperation?page=${i}" class="page-link ${currentPage == i ? 'active' : ''}">${i}</a>
          </c:forEach>
        </div>
      </c:if>
    </c:if>

    <c:if test="${empty list}">
      <div class="no-records">
        <i class="bi bi-x-circle"></i>
        <p>No records found for the selected filter. Please try again with a different filter.</p>
      </div>
    </c:if>

  </div>


  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" crossorigin="anonymous"></script>
</body>

</html>
