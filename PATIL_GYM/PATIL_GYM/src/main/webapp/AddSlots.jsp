<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add Slots</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
  <style>
    body {
      min-height: 100vh;
      margin: 0;
      background-image: url("https://img.freepik.com/premium-photo/free-space-table-background-your-interior-gym-decor_62972-5592.jpg");
      background-size: cover;
      background-position: center;
      background-repeat: no-repeat;
      background-attachment: fixed;
      color: #000;
      overflow-x: hidden;
    }

    .container {
      margin-top: 40px;
      margin-bottom: 40px;
      width: 100%;
      background-color: rgba(255, 255, 255, 0.8);
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.15);
    }

    .header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 15px 30px;
      position: sticky;
      top: 0;
      width: 100%;
      background-color: #343a40;
      color: white;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
    }

    .logo-img {
      max-height: 50px;
      height: auto;
    }

    .nav {
      display: flex;
      align-items: center;
      gap: 30px;
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

    .mobile-nav {
      display: none;
      flex-direction: column;
      background-color: #343a40;
      position: absolute;
      top: 65px;
      right: 0;
      width: 100%;
      padding: 15px 0;
    }

    .mobile-nav a {
      padding: 10px;
      color: white;
      text-decoration: none;
      text-align: center;
      display: block;
    }

    .mobile-nav.show {
      display: flex;
    }

    .table-container {
      margin-top: 20px;
      overflow-x: auto;
      background-color: #ffffff;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
    }

    .table-name {
      text-align: center;
      font-size: 1.5rem;
      font-weight: bold;
      margin-bottom: 20px;
    }

    table th {
      background-color: #f8f9fa;
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

    .search-row {
      display: flex;
      justify-content: center;
      margin-top: 30px;
    }

    .deleteMessage {
      color: red;
      text-align: center;
      font-size: 18px;
      margin-top: 10px;
    }

    @media (max-width: 768px) {
      .nav {
        display: none;
      }

      .mobile-nav {
        display: flex;
        flex-direction: column;
      }

      .search-row {
        flex-direction: column;
        align-items: center;
      }
    }

  </style>
</head>
<body>


  <header class="header">
    <div class="logo">

    </div>

    <nav class="nav">
      <a href="index.jsp">Home</a>
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
  </header>


  <nav class="mobile-nav">
    <a href="index.jsp">Home</a>
    <a href="enquiryPlaces">Enquiry</a>
    <a href="followUp">FollowUp</a>
    <a href="register">Registration</a>
    <a href="updateForm">Update</a>
    <a href="addSlots">Slots</a>
    <a href="viewTrainer">View Trainer</a>
    <a href="AssignUsers">Assign Users</a>
    <a href="index.jsp">Logout</a>
  </nav>


  <div class="search-row">
    <a href="createSlot" class="btn btn-primary">Create Slot</a>
  </div>


  <div class="container">
    <h4 class="deleteMessage">${deleteSlot}</h4>
    <p style="color:red;text-align: center;font-size:20px">${added}</p>
    <c:if test="${not empty slotsEntityList}">
      <div class="table-container">
        <h4 class="table-name">Slot Timing Details</h4>
        <form action="deletebutton" method="post">
          <table class="table table-striped table-bordered table-hover">
            <thead>
              <tr>
                <th>Start Time</th>
                <th>End Time</th>
                <th>Duration</th>
                <th>Delete</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach items="${slotsEntityList}" var="slotsEntityList">
                <tr>
                  <form action="deleteSlot" method="post">
                    <input type="hidden" name="idForDelete" value="${slotsEntityList.id}" />
                    <td>${slotsEntityList.startTime}</td>
                    <td>${slotsEntityList.endTime}</td>
                    <td>${slotsEntityList.duration}</td>
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
