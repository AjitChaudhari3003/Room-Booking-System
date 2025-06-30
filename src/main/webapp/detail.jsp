<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Ajit.Room, java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Room Details</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            padding: 20px;
        }

        .main-card {
            max-width: 900px;
            margin: auto;
            border-radius: 8px;
            overflow: hidden;
        }

        .main-card img {
            width: 100%;
            height: 300px;
            object-fit: cover;
        }

        .image-gallery {
            max-width: 900px;
            margin: 30px auto;
        }

        .image-box {
            border: 3px solid #007bff;
            border-radius: 10px;
            margin-bottom: 20px;
            overflow: hidden;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        .image-box img {
            width: 100%;
            height: 300px;
            object-fit: cover;
        }

        .caption {
            text-align: center;
            padding: 10px;
            font-weight: bold;
            color: #333;
            background-color: #f0f8ff;
            font-family: 'Segoe UI', sans-serif;
        }

        .btn-book {
            width: 100%;
        }
    </style>
</head>
<body>

<%
    Room r = (Room) session.getAttribute("selectedRoom");
    List<String> roomImages = (List<String>) session.getAttribute("roomImages");
    List<String> imageNames = List.of("Bedroom", "Kitchen", "Washroom", "Living Room");

    if (r == null) {
%>
    <div class="alert alert-danger text-center">No room selected.</div>
<%
    } else {
%>

<div class="card shadow main-card mb-4">
    <img src="<%= r.getImage() %>" class="card-img-top" alt="Room Image">
    <div class="card-body">
        <h3 class="card-title"><%= r.getName() %></h3>
        <p class="card-text"><strong>Location:</strong> <%= r.getLocation() %></p>
        <p class="card-text"><strong>Capacity:</strong> <%= r.getCapacity() %></p>
        <p class="card-text"><strong>Features:</strong> <%= r.getFeatures() %></p>
        <p class="card-text"><strong>Price:</strong> ₹<%= r.getPricePerHour() %></p>

        <form action="Bill.jsp" method="get">
            <input type="hidden" name="roomId" value="<%= r.getId() %>">
            <button type="submit" class="btn btn-primary btn-book mt-3">Book</button>
        </form>
    </div>
</div>

<% if (roomImages != null && !roomImages.isEmpty()) { %>
    <div class="image-gallery">
        <h4 class="text-center mb-4">Explore More</h4>
        <% for(int i = 0; i < roomImages.size(); i++) { %>
            <div class="image-box">
                <img src="<%= roomImages.get(i) %>" alt="Room Extra Image">
                <div class="caption"><%= imageNames.get(i) %></div>
            </div>
        <% } %>
    </div>
<% } %>

<% } %>

</body>
</html>
