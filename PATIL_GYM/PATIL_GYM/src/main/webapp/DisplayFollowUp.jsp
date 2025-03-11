<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Follow Up Enquiry</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7f6;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 30px;
            text-align: center;
            width: 80%;
            max-width: 600px;
        }

        .header {
            font-size: 24px;
            font-weight: bold;
            color: #333;
            margin-bottom: 20px;
        }

        .enquiry-name {
            font-size: 20px;
            color: #2d6a4f;
            font-weight: 600;
            margin-top: 10px;
        }

        .footer {
            font-size: 14px;
            color: #999;
            margin-top: 30px;
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="header">Follow-Up Enquiry</div>
        <div class="enquiry-name">${enquiryName}</div>
        <div class="footer">Thank you for your interest!</div>
    </div>

</body>
</html>
