package Ajit;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/Bill")
public class Bill extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get session
        HttpSession session = request.getSession(false);
        String currentUser = (String) session.getAttribute("currentuser");
        String roomIdParam = request.getParameter("roomId");

        try {
            int roomId = Integer.parseInt(roomIdParam);
            DataBaseConnectivity db = new DataBaseConnectivity();
            Room room = db.getRoomById(roomId);

            // Assume payment is successful, set data for receipt
            request.setAttribute("username", currentUser);
            request.setAttribute("room", room);

            // Forward to receipt.jsp
            request.getRequestDispatcher("receipt.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            // Optional: redirect to an error page or display message
            response.sendRedirect("error.jsp");
        }
    }
}
