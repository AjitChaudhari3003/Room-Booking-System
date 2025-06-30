<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Ajit.Room, Ajit.DataBaseConnectivity" %>
<%
    String errorMessage = null;
    Room selectedRoom = null;

    String roomIdStr = request.getParameter("roomId");
    if (roomIdStr == null) {
        roomIdStr = (String) session.getAttribute("pendingRoomId");
    }
    if (roomIdStr == null) {
        selectedRoom = (Room) session.getAttribute("selectedRoom");
    }

    if (roomIdStr != null) {
        try {
            int roomId = Integer.parseInt(roomIdStr);
            DataBaseConnectivity db = new DataBaseConnectivity();
            selectedRoom = db.getRoomById(roomId);

            if (selectedRoom != null) {
                session.setAttribute("selectedRoom", selectedRoom);
                session.removeAttribute("pendingRoomId");
            } else {
                errorMessage = "Room not found for the given ID.";
            }
        } catch (NumberFormatException e) {
            errorMessage = "Invalid room ID provided.";
        }
    } else if (selectedRoom == null) {
        errorMessage = "No room selected. Please <a href='index.jsp'>go back</a> and choose a room.";
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Bill Payment</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f7fa;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            padding: 20px;
        }

        .form-container {
            background-color: #ffffff;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.08);
            width: 100%;
            max-width: 450px;
            transition: transform 0.3s ease;
        }

        .form-container:hover {
            transform: translateY(-5px);
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 15px;
            font-weight: 600;
        }

        .room-image {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-radius: 8px;
            margin-bottom: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .price-info {
            text-align: center;
            font-size: 18px;
            font-weight: bold;
            color: #27ae60;
            margin-bottom: 25px;
            padding: 10px;
            background-color: #f8f9fa;
            border-radius: 6px;
        }

        label {
            font-weight: 600;
            display: block;
            margin-bottom: 8px;
            color: #34495e;
        }

        input[type="text"], input[type="date"] {
            width: 100%;
            padding: 12px 15px;
            margin-bottom: 18px;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            box-sizing: border-box;
            font-size: 15px;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus, input[type="date"]:focus {
            border-color: #3498db;
            outline: none;
            box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.1);
        }

        input[type="submit"] {
            width: 100%;
            padding: 14px;
            margin-top: 10px;
            background-color: #27ae60;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 600;
            font-size: 16px;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        input[type="submit"]:hover {
            background-color: #219653;
            transform: translateY(-2px);
        }

        input[type="submit"]:active {
            transform: translateY(0);
        }

        .error {
            color: #e74c3c;
            font-size: 14px;
            margin: -10px 0 15px 0;
            padding: 8px 12px;
            background-color: #fde8e8;
            border-radius: 4px;
            display: none;
        }

        .error.show {
            display: block;
        }

        .back-link {
            text-align: center;
            margin-top: 20px;
        }

        .back-link a {
            color: #3498db;
            text-decoration: none;
            font-weight: 500;
        }

        .back-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<% if (selectedRoom != null) { %>
    <div class="form-container">
        <h2>Pay for: <%= selectedRoom.getName() %></h2>

        <img src="<%= selectedRoom.getImage() %>" alt="Room Image" class="room-image" />

        <div class="price-info">Price: ₹<%= selectedRoom.getPricePerHour() %> </div>

        <form action="Bill" method="post" onsubmit="return validateForm()">
            <input type="hidden" name="roomId" value="<%= selectedRoom.getId() %>">

            <label for="card_number">Card Number:</label>
            <input type="text" name="card_number" id="card_number" placeholder="1234 5678 9012 3456" required>
            <div id="cardError" class="error"></div>

            <label for="cvv">CVV:</label>
            <input type="text" name="cvv" id="cvv" placeholder="123" required maxlength="3" pattern="\d{3}">
            <div id="cvvError" class="error"></div>

            <label for="expiry_date">Expiry Date:</label>
            <input type="date" name="expiry_date" id="expiry_date" required min="<%= new java.text.SimpleDateFormat("YYYY-MM-DD").format(new java.util.Date()) %>">
            <div id="expiryError" class="error"></div>

            <input type="submit" value="Pay Now">
        </form>

        <div class="back-link">
            <a href="index.jsp">← Back to room selection</a>
        </div>
    </div>
<% } else if (errorMessage != null) { %>
    <div class="form-container">
        <h2>Payment Error</h2>
        <div class="error show"><%= errorMessage %></div>
        <div class="back-link">
            <a href="index.jsp">← Back to room selection</a>
        </div>
    </div>
<% } %>

<script>
function validateForm() {
    let isValid = true;

    const cardNumber = document.getElementById("card_number").value.replace(/\s/g, '');
    const cardError = document.getElementById("cardError");

    if (!/^\d{16}$/.test(cardNumber)) {
        cardError.textContent = "Please enter a valid 16-digit card number";
        cardError.classList.add("show");
        isValid = false;
    } else {
        cardError.classList.remove("show");
    }

    const cvv = document.getElementById("cvv").value;
    const cvvError = document.getElementById("cvvError");

    if (!/^\d{3}$/.test(cvv)) {
        cvvError.textContent = "Please enter a valid 3-digit CVV";
        cvvError.classList.add("show");
        isValid = false;
    } else {
        cvvError.classList.remove("show");
    }

    return isValid;
}

document.getElementById("card_number").addEventListener("input", function(e) {
    let value = e.target.value.replace(/\s/g, '');
    if (value.length > 0) {
        value = value.match(new RegExp('.{1,4}', 'g')).join(' ');
    }
    e.target.value = value;
});
</script>
</body>
</html>
