<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Room</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #f3f0ff;
            display: flex;
            justify-content: center;
            padding-top: 40px;
        }
        .form-container {
            background: white;
            padding: 25px 30px;
            border-radius: 10px;
            box-shadow: 0 4px 14px rgba(100, 90, 230, 0.3);
            width: 400px;
        }
        h2 {
            color: #5b42f3;
            margin-bottom: 20px;
            text-align: center;
        }
        input[type=text], input[type=number], input[type=double], input[type=url] {
            width: 100%;
            padding: 10px 12px;
            margin-bottom: 15px;
            border: 1px solid #b1a7f3;
            border-radius: 6px;
            font-size: 15px;
        }
        input[type=submit] {
            width: 100%;
            background: #5b42f3;
            color: white;
            padding: 12px;
            font-size: 16px;
            border: none;
            border-radius: 7px;
            cursor: pointer;
            transition: background 0.3s ease;
        }
        input[type=submit]:hover {
            background: #3a22c8;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Add New Room</h2>
    <form action="AddRoomServlet" method="post">
        <input type="text" name="name" placeholder="Room Name" required>
        <input type="text" name="location" placeholder="Location" required>
        <input type="number" name="capacity" placeholder="Capacity" required>
        <input type="text" name="features" placeholder="Features (comma separated)">
        <input type="text" name="ac_type" placeholder="AC Type">
        <input type="number" step="0.01" name="pricePerHour" placeholder="Price Per Hour" required>
        <input type="url" name="image" placeholder="Image URL" required>
        <input type="submit" value="Add Room">
    </form>
</div>

</body>
</html>
