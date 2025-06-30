<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Ajit.Room" %>
<%
    String username = (String) request.getAttribute("username");
    Room room = (Room) request.getAttribute("room");
    
    if (username == null || room == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Payment Receipt</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .receipt {
            width: 100%;
            max-width: 600px;
            margin: 20px;
            background: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            color: #28a745;
            margin-bottom: 30px;
            font-size: 28px;
        }
        .success-icon {
            text-align: center;
            font-size: 60px;
            color: #28a745;
            margin-bottom: 20px;
        }
        .details {
            margin-top: 20px;
            border-top: 1px solid #eee;
            padding-top: 20px;
        }
        .detail-row {
            display: flex;
            margin-bottom: 15px;
            padding-bottom: 15px;
            border-bottom: 1px solid #f5f5f5;
        }
        .detail-label {
            font-weight: bold;
            color: #555;
            width: 150px;
        }
        .detail-value {
            color: #333;
            flex-grow: 1;
        }
        .thank-you {
            text-align: center;
            margin-top: 30px;
            font-style: italic;
            color: #666;
        }
        .print-btn {
            display: block;
            width: 100%;
            padding: 12px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 30px;
            text-align: center;
            text-decoration: none;
        }
        .print-btn:hover {
            background-color: #0069d9;
        }
    </style>
</head>
<body>
    <div class="receipt">
        <div class="success-icon">✓</div>
        <h2>Payment Successful</h2>
        
        <div class="details">
            <div class="detail-row">
                <span class="detail-label">Username:</span>
                <span class="detail-value"><%= username %></span>
            </div>
            <div class="detail-row">
                <span class="detail-label">Room ID:</span>
                <span class="detail-value"><%= room.getId() %></span>
            </div>
            <div class="detail-row">
                <span class="detail-label">Room Name:</span>
                <span class="detail-value"><%= room.getName() %></span>
            </div>
            <div class="detail-row">
                <span class="detail-label">Location:</span>
                <span class="detail-value"><%= room.getLocation() %></span>
            </div>
            <div class="detail-row">
                <span class="detail-label">AC Type:</span>
                <span class="detail-value"><%= room.getAc_type() %></span>
            </div>
            <div class="detail-row">
                <span class="detail-label">Features:</span>
                <span class="detail-value"><%= room.getFeatures() %></span>
            </div>
            <div class="detail-row">
                <span class="detail-label">Price :</span>
                <span class="detail-value">₹<%= room.getPricePerHour() %></span>
            </div>
        </div>
        
        <p class="thank-you">Thank you for your booking!</p>
        
        <button class="print-btn" onclick="window.location.href='index.jsp'">Done</button>
    </div>
</body>
</html>
