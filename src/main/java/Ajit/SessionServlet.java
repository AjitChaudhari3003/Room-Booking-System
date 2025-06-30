package Ajit;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
@WebServlet("/book")
public class SessionServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession ses = request.getSession(false);
        
        // Get the roomId from the request
        String roomId = request.getParameter("roomId");
        
        if (ses == null) {
            // Store roomId in session before redirecting to login
            ses = request.getSession(true);
            ses.setAttribute("pendingRoomId", roomId);
            response.sendRedirect("login.jsp");
        } else {
            // Store roomId in session before redirecting to bill
            ses.setAttribute("pendingRoomId", roomId);
            response.sendRedirect("Bill.jsp");
        }
    }
}