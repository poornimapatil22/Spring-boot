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
      background-image: url('https://th.bing.com/th?id=OIP.VfWp5z3JDvrjEU39WtbesAHaE8&w=305&h=204&c=8&rs=1&qlt=90&o=6&dpr=1.5&pid=3.1&rm=2'); /* Background Image */
      background-size: cover;
      background-position: center center;
      background-attachment: fixed;
      color: black;
      padding-top: 80px;
    }

    .container {
      margin-top: 40px;
      background-color: rgba(255, 255, 255, 0.8); /* Light background for the container */
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


    .card {
      border: 2px solid black; /* Adding a square border around the card */
      border-radius: 15px;
      box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1); /* Subtle shadow for depth */
      margin-bottom: 20px;
      background-color: white;
      transition: transform 0.3s ease, box-shadow 0.3s ease; /* Smooth transition for hover effect */
    }

    .card:hover {
      transform: translateY(-10px); /* Move the card upwards slightly */
      box-shadow: 0 12px 30px rgba(0, 0, 0, 0.2); /* Enhance shadow on hover */
    }

    .card-header {
      background-color: black;
      color:white;
      font-weight: bold;
      padding: 10px;
      border-top-left-radius: 15px;
      border-top-right-radius: 15px;
    }

    .card-body {
      padding: 15px;
    }

    .card-footer {
      text-align: right;
      padding: 10px;
      border-bottom-left-radius: 15px;
      border-bottom-right-radius: 15px;
    }

    .form-control {
      margin-bottom: 10px;
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
  </style>
</head>

<body>
  <c:if test="${not empty notUpdated}">
    <div class="not-updated">
      ${notUpdated}
    </div>
  </c:if>

  <div class="container">
    <!-- Search Row -->
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

    <!-- Enquiries List -->
    <c:if test="${not empty list}">
      <div class="row">
        <c:forEach items="${list}" var="enquiry">
          <div class="col-md-4">
            <div class="card">
              <div class="card-header">
                ${enquiry.name}
              </div>
              <div class="card-body">
                <p><strong>Email:</strong> ${enquiry.email}</p>
                <p><strong>Phone:</strong> ${enquiry.phoneNumber}</p>
                <p><strong>Area:</strong> ${enquiry.areaName}</p>

                <!-- Form for each enquiry to update the status and reason -->
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
                  <textarea class="form-control" name="reason" rows="2" placeholder="Update the reason">${enquiry.reason}</textarea>
                  <button type="submit" class="btn btn-success mt-3">Update</button>
                </form>
              </div>
              <div class="card-footer">
                <!-- The form submits with the 'Update' button inside the card -->
              </div>
            </div>
          </div>
        </c:forEach>
      </div>


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

</body>

</html>
