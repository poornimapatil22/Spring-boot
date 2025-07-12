<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Assign Users to Trainer</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: url('https://images.unsplash.com/photo-1593079831268-3381b0db4a77?q=80&w=2069&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D') no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;

        }


       .headers {
             display: flex;
             justify-content: space-between;
             align-items: center;
             padding: 10px 30px;
             position: sticky;
             top: 0;
            width:95.3%;
             height: 55px;
             z-index: 999;
             color: white;
             box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
             background-color: #0E0E0E;
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

        .container {
            background: #d9a7c7;
            background: -webkit-linear-gradient(to right, #fffcdc, #d9a7c7);
            background: linear-gradient(to right, #fffcdc, #d9a7c7);

            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px;
            text-align: center;
            margin-top: 80px;
        }

        .header {
           background: #d9a7c7;
           background: -webkit-linear-gradient(to right, #fffcdc, #d9a7c7);
           background: linear-gradient(to right, #fffcdc, #d9a7c7);

            color: black;
            padding: 10px;
            border-radius: 8px 8px 0 0;
            font-size: 20px;
            font-weight: bold;
        }

        label {
            display: block;
            margin: 15px 0 5px;
            font-weight: bold;
            text-align: left;
        }

        select, input[type="text"], button {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            background-color: #ef9bc2;
            color: white;
            border: none;
            cursor: pointer;
            width:50%;
        }

        button:hover {
            background-color: #cea4c8;
        }

        .user-list div {
            padding: 5px;
            background-color: #e9e9e9;
            margin-bottom: 5px;
            border-radius: 4px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .user-list button {
            background-color: #ff4d4d;
            color: white;
            border: none;
            width: 60px;
            padding: 6px;
            margin-top: 10px;
            font-size: 12px;
            border-radius: 3px;
            cursor: pointer;
        }

        .user-list button:hover {
            background-color: #d43f3f;
        }

        #autocomplete-list div {
            padding: 8px;
            background-color: white;
            border: 1px solid #ccc;
            cursor: pointer;
            text-align: left;
            margin-bottom: 5px;
            border-radius: 4px;
            width: 100%;
        }
        .user-list {
            width: 100%;
            margin: 0 auto;

        }

        .user-list div {
            padding: 5px;
            background-color: #e9e9e9;
            margin-bottom: 5px;
            border-radius: 4px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 80%;
            height:20px;
        }

        .user-list button {
            background-color: #ff4d4d;
            color: white;
            border: none;
            width: 60px;
            padding: 6px;
            margin-top: 10px;
            font-size: 12px;
            border-radius: 3px;
            cursor: pointer;
        }

    </style>
</head>
<body>
<header class="headers">




    <nav class="nav">
      <a href="Home.jsp">Home</a>
      <a href="enquiryPlaces">Enquiry</a>
      <a href="followUp">FollowUp</a>
      <a href="register">Registration</a>

    </nav>


    <div style="display: flex; align-items: center;">
      <img src="photo/${listimg.image}" alt="Profile Picture" class="profile-img">
      <div class="menu-toggle" onclick="toggleMenu()">
        <div></div>
        <div></div>
        <div></div>
      </div>
    </div>


    <nav class="mobile-nav">
      <a href="Home.jsp">Home</a>
      <a href="enquiryPlaces">Enquiry</a>
      <a href="followUp">FollowUp</a>
      <a href="register">Registration</a>
      <a href="updateForm">Update</a>
       <a href="addSlots">Slots</a>
              <a href="viewTrainer">View Trainer</a>
                <a href="AssignUsers">AssignUsers</a>
                 <a href="UpdateExerciseAndDiet">UpdateUserExerciseAndDiet</a>
                  <a href="index.jsp">Logout</a>
    </nav>
  </header>
<div class="container">

    <div class="header">Assign Users to Trainer</div>
    <form id="assignForm" action="assignUsersToNewTrainer" method="post">

        <label for="trainer">Select Trainer:</label>
        <select id="trainer" name="trainerName">
            <option value="">-- Select a Trainer --</option>
            <c:forEach var="trainer" items="${trainerDetails}">
                <option value="${trainer.trainerName},${trainer.slotTime} ">${trainer.trainerName} (${trainer.slotTime})</option>
            </c:forEach>
        </select>

        <label for="userSearch" >Search User:</label>
        <input type="text" id="userSearch" placeholder="Enter user name" style="width:95%;">
        <div id="autocomplete-list"></div>

        <div class="user-list" id="selectedUsers"></div>

        <!-- Hidden input to store selected user IDs -->
        <input type="hidden" id="selectedUserIds" name="selectedUserName">
                    <input type="hidden" id="selectedUserId" name="trainerId" value="${idtrainer}">


        <button type="submit">Assign Users</button>
    </form>
    <div class="result" id="result"></div>
</div>

<script>
    function toggleMenu() {
        document.querySelector('.mobile-nav').classList.toggle('show');
    }

    let users = [];
    <c:forEach var="user" items="${users}">
        users.push({ id: "${user.name}", name: "${user.name}" });
    </c:forEach>


    let selectedUsers = [];
    <c:if test="${not empty user}">
        <c:forEach var="u" items="${user}">
            selectedUsers.push({ id: "${u}", name: "${u}" });
        </c:forEach>
    </c:if>


    $(document).ready(function() {
        renderSelectedUsers();
    });

    function showSuggestions() {
        let input = $("#userSearch").val().toLowerCase();
        let list = $("#autocomplete-list").html("");

        users.forEach(user => {
            if (user.name.toLowerCase().includes(input)) {
                let div = $("<div>").text(user.name).click(() => {
                    if (!selectedUsers.some(u => u.id === user.id)) {
                        selectedUsers.push(user);
                        renderSelectedUsers();
                    }
                    $("#userSearch").val("");
                    list.html("");
                });
                list.append(div);
            }
        });
    }

    function renderSelectedUsers() {
        let selectedDiv = $("#selectedUsers").html("");
        let selectedIds = [];

        selectedUsers.forEach(user => {
            selectedIds.push(user.id);
            let div = $("<div>").text(user.name);
            let removeBtn = $("<button>").text("Remove").click(() => {
                selectedUsers = selectedUsers.filter(u => u.id !== user.id);
                renderSelectedUsers();
            });
            div.append(removeBtn);
            selectedDiv.append(div);
        });


        $("#selectedUserIds").val(selectedIds.join(","));
    }

    $("#userSearch").on("input", showSuggestions);
</script>
</body>
</html>
