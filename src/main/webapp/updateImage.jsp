<%@ page import="Ajit.DataBaseConnectivity, Ajit.Room" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Room Search and Update</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #f3f0ff, #e3dcff);
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 650px;
            margin: auto;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(90, 80, 160, 0.2);
            padding: 30px 40px;
        }
        h1 {
            text-align: center;
            color: #5b42f3;
            margin-bottom: 30px;
        }
        h2 {
            color: #4a3cd1;
            margin-bottom: 15px;
        }
        .search-box, .update-form {
            margin-bottom: 30px;
        }
        label {
            font-weight: 500;
            color: #444;
        }
        input[type="text"],
        input[type="number"],
        input[type="url"] {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #b3aaff;
            border-radius: 8px;
            font-size: 15px;
            margin-bottom: 10px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background: #6b4ce6;
            border: none;
            border-radius: 8px;
            color: white;
            font-size: 16px;
            cursor: pointer;
            margin-top: 10px;
            transition: background 0.3s ease;
        }
        input[type="submit"]:hover {
            background: #4e33cc;
        }
        .current-value {
            color: #6b6b6b;
            font-size: 13px;
            font-style: italic;
            margin-bottom: 15px;
        }
        .message {
            padding: 12px 16px;
            border-radius: 6px;
            margin-bottom: 20px;
            font-weight: bold;
            text-align: center;
        }
        .success {
            background-color: #dff5e1;
            color: #257944;
            border: 1px solid #b9ecc9;
        }
        .error {
            background-color: #fce2e2;
            color: #a33c3c;
            border: 1px solid #f5b8b8;
        }
        .home-link {
            display: inline-block;
            background-color: #6b4ce6;
            color: white;
            padding: 10px 18px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: bold;
            transition: background 0.3s ease, transform 0.2s ease;
            box-shadow: 0 4px 10px rgba(107, 76, 230, 0.3);
            margin-top: 20px;
            font-size: 16px;
        }
        .home-link i {
            margin-right: 8px;
        }
        .home-link:hover {
            background-color: #4e33cc;
            transform: translateY(-2px);
        }
    </style>
</head>
<%
    Room room = null;
    String searchName = request.getParameter("searchName");
    String message = null;

    if (searchName != null && !searchName.trim().isEmpty()) {
        DataBaseConnectivity db = new DataBaseConnectivity();
        room = db.getRoomByName(searchName);
        message = room == null ? "Room not found" : null;
    }

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        int id = Integer.parseInt(request.getParameter("id"));
        DataBaseConnectivity db = new DataBaseConnectivity();
        Room existingRoom = db.getRoomById(id);

        Room updatedRoom = new Room();
        updatedRoom.setId(id);
        updatedRoom.setName(getUpdatedValue(request.getParameter("name"), existingRoom.getName()));
        updatedRoom.setLocation(getUpdatedValue(request.getParameter("location"), existingRoom.getLocation()));
        updatedRoom.setCapacity(getUpdatedValue(request.getParameter("capacity"), existingRoom.getCapacity()));
        updatedRoom.setPricePerHour(getUpdatedValue(request.getParameter("pricePerHour"), existingRoom.getPricePerHour()));
        updatedRoom.setImage(getUpdatedValue(request.getParameter("image"), existingRoom.getImage()));

        boolean success = db.updateRoom(updatedRoom);
        message = success ? "Room updated successfully" : "Update failed";
        room = db.getRoomById(id);
    }
%>
<%!
    private String getUpdatedValue(String newValue, String currentValue) {
        return (newValue != null && !newValue.trim().isEmpty()) ? newValue.trim() : currentValue;
    }

    private int getUpdatedValue(String newValue, int currentValue) {
        try {
            return (newValue != null && !newValue.trim().isEmpty()) ? Integer.parseInt(newValue) : currentValue;
        } catch (NumberFormatException e) {
            return currentValue;
        }
    }

    private double getUpdatedValue(String newValue, double currentValue) {
        try {
            return (newValue != null && !newValue.trim().isEmpty()) ? Double.parseDouble(newValue) : currentValue;
        } catch (NumberFormatException e) {
            return currentValue;
        }
    }
%>
<body>
<div class="container">
    <h1>Room Search & Update</h1>

    <% if (message != null) { %>
        <div class="message <%= message.toLowerCase().contains("fail") ? "error" : "success" %>">
            <%= message %>
        </div>
    <% } %>

    <div class="search-box">
        <h2>Search Room</h2>
        <form method="get">
            <input type="text" name="searchName" placeholder="Enter room name"
                   value="<%= searchName != null ? searchName : "" %>" required>
            <input type="submit" value="Search">
        </form>
    </div>

    <% if (room != null) { %>
    <div class="update-form">
        <h2>Update Room: <%= room.getName() %></h2>
        <form method="post">
            <input type="hidden" name="id" value="<%= room.getId() %>">

            <label>Room Name:</label>
            <input type="text" name="name" placeholder="Leave blank to keep current value">
            <div class="current-value">Current: <%= room.getName() %></div>

            <label>Location:</label>
            <input type="text" name="location" placeholder="Leave blank to keep current value">
            <div class="current-value">Current: <%= room.getLocation() %></div>

            <label>Capacity:</label>
            <input type="number" name="capacity" min="1" placeholder="Leave blank to keep current value">
            <div class="current-value">Current: <%= room.getCapacity() %></div>

            <label>Price Per Hour:</label>
            <input type="number" step="0.01" name="pricePerHour" min="0" placeholder="Leave blank to keep current value">
            <div class="current-value">Current: <%= room.getPricePerHour() %></div>

            <label>Image URL:</label>
            <input type="url" name="image" placeholder="Leave blank to keep current value">
            <div class="current-value">Current: <%= room.getImage() %></div>

            <input type="submit" value="Update Room">
        </form>
        
            <div style="text-align: center;">
    <a class="home-link" href="index.jsp">
        <i class="fas fa-sign-out-alt"></i> Go to Home
    </a>
</div>

       
    </div>
    <% } %>
</div>
</body>
</html>
