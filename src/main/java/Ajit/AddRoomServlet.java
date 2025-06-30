package Ajit;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/AddRoomServlet")
public class AddRoomServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form parameters
        String name = request.getParameter("name");
        String location = request.getParameter("location");
        int capacity = Integer.parseInt(request.getParameter("capacity"));
        String features = request.getParameter("features");
        String ac_type = request.getParameter("ac_type");
        double pricePerHour = Double.parseDouble(request.getParameter("pricePerHour"));
        String image = request.getParameter("image");

        // Create Room object
        Room room = new Room();
        room.setName(name);
        room.setLocation(location);
        room.setCapacity(capacity);
        room.setFeatures(features);
        room.setAc_type(ac_type);
        room.setPricePerHour(pricePerHour);
        room.setImage(image);

        // Insert room using DB method
        DataBaseConnectivity db = new DataBaseConnectivity();
        boolean success = db.addRoom(room);

        if (success) {
            response.sendRedirect("admin.jsp"); // Redirect to list page or success page
        } else {
            response.getWriter().println("Error adding room");
        }
    }
}
