package Ajit;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SearchRoomServlet")
public class SearchRoomServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String roomName = request.getParameter("roomName");
        
        DataBaseConnectivity db = new DataBaseConnectivity();
        Room room = db.getRoomByName(roomName);
        
        if (room != null) {
            request.setAttribute("room", room);
            request.getRequestDispatcher("updateRoomForm.jsp").forward(request, response);
        } else {
            response.sendRedirect("searchRoom.jsp?error=Room+not+found");
        }
    }
}