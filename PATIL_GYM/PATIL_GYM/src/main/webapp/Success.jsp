<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Message Page</title>
    <style>

        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-image:url("https://img.freepik.com/premium-photo/blue-yoga-mat-with-dumbbell-water-bottle_868155-17.jpg");
            background-size:cover;
             background-repeat:no-repeat;
             background-position:center;
            background-color: #f0f8ff;
        }


        p {
            font-size: 1.5em;
            color: #333;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 600px;
        }
    </style>
</head>
<body>
   <c:if test="${message != null && not empty message}">
       <p>${message} &#x1F389;</p>
   </c:if>
</body>
</html>
