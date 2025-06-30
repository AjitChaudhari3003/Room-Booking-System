<%@ page language="java" contentType="text/html; charset=UTF-8" session="true" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, Ajit.*" %>
<%
    DataBaseConnectivity db = new DataBaseConnectivity();
    List<Room> roomList = db.getAllRooms();
    String username = (String) session.getAttribute("username");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Room Booking</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet" />
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Room Booking</a>
        <div class="ms-auto d-flex align-items-center">
            <% if (username != null) { %>
                <span class="text-white me-3 fw-bold">
                    <i class="bi bi-person-circle me-1"></i><%= username %>
                </span>
                <a href="cart.jsp" class="btn btn-outline-light btn-sm me-2">
                    <i class="bi bi-cart"></i> Cart
                </a>
                <a href="logout.jsp" class="btn btn-outline-light btn-sm">Logout</a>
            <% } else { %>
                <a href="userlogin" class="btn btn-outline-light me-2">Login as User</a>
                <a href="adminLogin.jsp" class="btn btn-outline-warning">Login as Admin</a>
            <% } %>
        </div>
    </div>
</nav>

<!-- Login Required Alert -->
<div class="alert alert-warning text-center m-0 rounded-0" role="alert">
    <strong>Note:</strong> Login is required for room booking.
</div>
<%
    String successMsg = request.getParameter("success");
    if (successMsg != null) {
%>
    <div style="margin: 20px auto; width: 80%; padding: 12px; border: 1px solid #b4e2b4; background-color: #e8fbe8; color: #2e7d32; border-radius: 8px; text-align: center; font-weight: bold;">
        <%= successMsg %>
    </div>
<%
    }
%>

<div class="container mt-4">
    <!-- Filter Dropdown -->
    <div class="row mb-3">
        <div class="col-md-3">
            <label for="acFilter" class="form-label fw-bold">Filter by AC Type:</label>
            <select class="form-select" id="acFilter" onchange="filterRooms(this.value)">
                <option value="All">All</option>
                <option value="AC">AC</option>
                <option value="Non-AC">Non-AC</option>
            </select>
        </div>
    </div>

    <h1 class="mb-4 text-center">Available Rooms</h1>
    <div class="row" id="roomContainer">
        <% for(Room room : roomList) { %>
            <div class="col-md-4 mb-4 room-card" data-ac-type="<%= room.getAc_type() %>">
                <div class="card h-100 shadow-sm">
                    <img src="<%= room.getImage() %>" class="card-img-top" alt="Room Image" style="height: 200px; object-fit: cover;" />
                    <div class="card-body d-flex flex-column">
                        <h5 class="card-title"><%= room.getName() %></h5>
                        <p class="card-text mb-1"><strong>Location:</strong> <%= room.getLocation() %></p>
                        <p class="card-text mb-1"><strong>AC/Non-AC:</strong> <%= room.getAc_type() %></p>
                        <p class="card-text mt-auto"><strong>Price:</strong> ₹<%= room.getPricePerHour() %></p>
                    </div>
                    <div class="card-footer text-center">
                        <form action="book" method="get" class="d-inline">
                            <input type="hidden" name="roomId" value="<%= room.getId() %>"/>
                            <button type="submit" class="btn btn-primary btn-sm me-2">Book</button>
                        </form>
                        <form action="detail" method="get" class="d-inline">
                            <input type="hidden" name="roomId" value="<%= room.getId() %>"/>
                            <button type="submit" class="btn btn-outline-secondary btn-sm">See Details</button>
                        </form>
                    </div>
                </div>
            </div>
        <% } %>
    </div>
</div>

<script>
    function filterRooms(type) {
        const cards = document.querySelectorAll('.room-card');
        cards.forEach(card => {
            const acType = card.getAttribute('data-ac-type').trim().toLowerCase();
            if (type === "All" || acType === type.toLowerCase()) {
                card.style.display = 'block';
            } else {
                card.style.display = 'none';
            }
        });
    }

    window.onload = () => filterRooms('All');
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
