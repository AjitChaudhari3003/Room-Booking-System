<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background: linear-gradient(to right, #74ebd5, #acb6e5);
        margin: 0;
        padding: 0;
        display: flex;
        height: 100vh;
        justify-content: center;
        align-items: center;
    }

    .login-container {
        background-color: #fff;
        padding: 30px 40px;
        border-radius: 12px;
        box-shadow: 0 4px 10px rgba(0,0,0,0.2);
        text-align: center;
        width: 320px;
    }

    h2 {
        margin-bottom: 20px;
        color: #333;
    }

    input[type="text"], input[type="password"] {
        width: 100%;
        padding: 10px;
        margin: 10px 0 20px;
        border: 1px solid #ccc;
        border-radius: 8px;
        font-size: 14px;
    }

    input[type="submit"] {
        background-color: #4CAF50;
        color: white;
        border: none;
        padding: 10px 20px;
        font-size: 16px;
        border-radius: 8px;
        cursor: pointer;
        width: 100%;
        transition: background-color 0.3s;
    }

    input[type="submit"]:hover {
        background-color: #45a049;
    }

    .error {
        color: red;
        margin-bottom: 15px;
        font-weight: bold;
    }

    .register-link {
        margin-top: 10px;
        font-size: 14px;
    }

    .register-link a {
        color: #007bff;
        text-decoration: none;
    }

    .register-link a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>
<div class="login-container">
    <h2>Login</h2>

    <% 
        String error = (String) request.getAttribute("errormsg");
        if (error != null) {
    %>
        <div class="error"><%= error %></div>
    <% 
            session.removeAttribute("errormsg");
        }
    %>

    <form action="userlogin" method="get">
        <input type="text" name="name" placeholder="Username" required><br>
        <input type="password" name="password" placeholder="Password" required><br>
        <input type="submit" value="Login"><br>
    </form>

    <div class="register-link">
        New user? <a href="new">Register</a>
    </div>
</div>
</body>
</html>
