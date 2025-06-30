package Ajit;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

//@WebServlet("/UpdateRoomServlet")

public class UpdateRoomServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            DataBaseConnectivity db = new DataBaseConnectivity();
            Room existingRoom = db.getRoomById(id);

            if (existingRoom == null) {
                response.sendRedirect("searchRoom.jsp?error=Room+not+found&searchName=");
                return;
            }

            Room updatedRoom = new Room();
            updatedRoom.setId(id);

            String name = request.getParameter("name");
            updatedRoom.setName(name != null && !name.trim().isEmpty() ? name.trim() : existingRoom.getName());

            String location = request.getParameter("location");
            updatedRoom.setLocation(location != null && !location.trim().isEmpty() ? location.trim() : existingRoom.getLocation());

            String capacityStr = request.getParameter("capacity");
            updatedRoom.setCapacity(capacityStr != null && !capacityStr.trim().isEmpty() ? Integer.parseInt(capacityStr) : existingRoom.getCapacity());

            String priceStr = request.getParameter("pricePerHour");
            updatedRoom.setPricePerHour(priceStr != null && !priceStr.trim().isEmpty() ? Double.parseDouble(priceStr) : existingRoom.getPricePerHour());

            String image = request.getParameter("image");
            updatedRoom.setImage(image != null && !image.trim().isEmpty() ? image.trim() : existingRoom.getImage());

            boolean success = db.updateRoom(updatedRoom);

            if (success) {
                response.sendRedirect("index.jsp?success=Room+updated+successfully");
            } else {
                response.sendRedirect("searchRoom.jsp?error=Update+failed&searchName=" + existingRoom.getName());
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("searchRoom.jsp?error=Server+error");
        }
    }
}
