<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Room</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #f3f0ff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .delete-container {
            background: white;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 4px 14px rgba(100, 90, 230, 0.3);
            text-align: center;
            width: 350px;
        }
        input[type="number"] {
            width: 100%;
            padding: 12px 8px;
            margin-top: 10px;
            border-radius: 8px;
            border: 1px solid #aaa;
            font-size: 16px;
        }
        input[type="submit"] {
            margin-top: 20px;
            background-color: #5b42f3;
            color: white;
            border: none;
            padding: 12px;
            width: 100%;
            font-size: 16px;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #3e2ab8;
        }
    </style>
</head>
<body>
    <div class="delete-container">
        <h2>Delete Room</h2>
        <form action="DeleteRoomServlet" method="get">
            <label for="id">Enter Room ID to Delete:</label>
            <input type="number" name="id" id="id" placeholder="Room ID" required min="1" />
            <input type="submit" value="Delete Room" />
        </form>
    </div>
</body>
</html>
