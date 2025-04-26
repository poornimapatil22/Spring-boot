
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
    margin: 0;
    background-image: url("https://img.freepik.com/premium-photo/3d-rendering-iron-fitness-equipment-black-podium_338925-153.jpg?w=1060");
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    background-attachment: fixed;
    color: #000;
    padding-top: 80px;
     overflow: hidden;

  }

 .table-container {
   margin-top: 0;
   background-color: #fff;
   padding: 20px;
   padding-top:0px;
   border-radius: 10px;
   box-shadow: 0 4px 15px rgba(0, 0, 0, 0.15);
   max-height: calc(100vh - 170px);
   overflow-y: auto;
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

 table thead tr {
   position: sticky;
   top: 40px;
   background-color: #f8f9fa;
   z-index: 1;
 }

 table th {
   background-color: #f8f9fa;
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
    position: fixed;
    top: 0;
    width: 100%;
    height: 65px;
    z-index: 1000;
    color: white;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
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
  }
    .update{
    font-size:30px;
    }
  </style>
</head>
<body>

  <div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); text-align: center;">
    <h5 style="color: red;">${failure}</h5>
    <p class="update" style="colr:red">${notupdated}</p>
     <p class="update" style="color:green">${enquiryName}</p>

  </div>


<header class="header">

  <nav class="nav">
    <a href="index.jsp">Home</a>
    <a href="enquiryPlaces">Enquiry</a>
    <a href="followUp">follow Up</a>
    <a href="register">Registration</a>
  </nav>
</header>


  <div class="container">

    <div class="search-row">
      <form action="searchName" method="POST" style="display: flex; gap: 10px;">
            <input type="text" class="form-control" id="searchName" name="searchName" placeholder="Search name" required >
        <button type="submit" class="btn btn-primary">Search</button>
      </form>
    </div>


    <c:if test="${not empty list}">
     <div class="table-container">
       <h4 class="table-name">Enquiry Details</h4>
       <form action="updatebutton" method="post">
         <table class="table table-striped table-bordered table-hover">
           <colgroup>

             <col style="width: 15%;">
             <col style="width: 15%;">
             <col style="width: 10%;">
             <col style="width: 10%;">
             <col style="width: 10%;">
             <col style="width: 10%;">
             <col style="width: 10%;">
             <col style="width: 10%;">
             <col style="width: 10%;">
             <col style="width: 10%;">
           </colgroup>
           <thead>
             <tr>
               <th>Name</th>
               <th>Email</th>
               <th>Phone Number</th>
               <th>Package</th>
               <th>Trainer</th>
               <th>Total Amount</th>
               <th>Amount Paid</th>
               <th>Balance Amount</th>
                <th>update</th>
             </tr>
           </thead>
           <tbody>
           <c:forEach items="${list}" var="enquiry">
             <tr>
               <form action="updatebutton" method="post" >

                 <input type="hidden" name="id" value="${enquiry.id}" />
                 <input type="hidden" name="name" value="${enquiry.name}" />
                   <input type="hidden" name="totalAmount" value="${enquiry.amount}" />
                  <input type="hidden" name="trainer" value="${enquiry.trainer}" />
                    <input type="hidden" name="phoneNumber" value="${enquiry.phoneNumber}" />
                 <input type="hidden" name="gympackage" value="${enquiry.gympackage}" />
                   <input type="hidden" name="balanceAmount" value="${enquiry.balanceAmount}" />


                 <td>${enquiry.name}</td>
                 <td>${enquiry.email}</td>
                 <td>${enquiry.phoneNumber}</td>
                 <td>${enquiry.gympackage}</td>
                 <td>${enquiry.trainer}</td>
                 <td>${enquiry.amount}</td>
                 <td>${enquiry.amountPaid}</td>
                  <td>${enquiry.balanceAmount}</td>

                 <td>
                   <button type="submit" class="btn btn-success">Update</button>  <!-- Update button for each row -->
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
              <a href="followUpOperation?page=${i}" class="page-link ${currentPage == i ? 'active' : ''}">${i}</a>
            </c:forEach>
          </div>
        </c:if>
      </div>
    </c:if>
  </div>
</body>

</html>
