<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Registration</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #ffecd2, #fcb69f);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .register-container {
            background-color: #fff;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
            width: 360px;
            text-align: center;
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
        }

        input[type="text"],
        input[type="password"],
        input[type="email"],
        input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 16px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 14px;
        }

        input[type="submit"] {
            background-color: #ff7f50;
            color: white;
            padding: 10px;
            width: 100%;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #e5673c;
        }

        .error {
            color: red;
            font-weight: bold;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <div class="register-container">
        <h2>Register</h2>
        <% 
            String error = (String) request.getAttribute("errormsg");
            if (error != null) { 
        %>
            <div class="error"><%= error %></div>
        <% } %>

        <form action="new" method="post">
            <input type="email" name="email" placeholder="Email ID" required><br>
            <input type="password" name="password" placeholder="Password" required><br>
            <input type="number" name="age" placeholder="Age" required><br>
            <input type="text" name="address" placeholder="Address" required><br>
            <input type="text" name="city" placeholder="City" required><br>
            <input type="submit" value="Register">
        </form>
    </div>
</body>
</html>
