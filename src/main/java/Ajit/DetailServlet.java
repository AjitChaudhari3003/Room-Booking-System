package Ajit;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/detail")
public class DetailServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int roomId = Integer.parseInt(request.getParameter("roomId"));
        DataBaseConnectivity db = new DataBaseConnectivity();
        Room room = db.getRoomById(roomId);

        // Hardcoded images list for room id=1
        List<String> images = new ArrayList<>();
        if (roomId == 1) {
            images.add("https://images.unsplash.com/photo-1583847268964-b28dc8f51f92?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80"); // bedroom
            images.add("https://images.unsplash.com/photo-1556911220-bff31c812dba?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80"); // kitchen
            images.add("https://images.unsplash.com/photo-1584622650111-993a426fbf0a?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80"); // washroom
            images.add("https://images.unsplash.com/photo-1556020685-ae41abfc9365?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80"); // living room
        }

        HttpSession session = request.getSession();
        session.setAttribute("selectedRoom", room);
        session.setAttribute("roomImages", images);

        response.sendRedirect("detail.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        doGet(request, response);
    }
}