package Ajit;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/DeleteRoomServlet")
public class DeleteRoomServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        boolean deleted = false;
        if (idStr != null && !idStr.isEmpty()) {
            try {
                int id = Integer.parseInt(idStr);
                DataBaseConnectivity db = new DataBaseConnectivity();
                deleted = db.deleteRoom(id);
            } catch (NumberFormatException e) {
                deleted = false;
            }
        }

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        out.println("<!DOCTYPE html><html><head><title>Delete Room</title>");
        out.println("<style>");
        out.println("body { font-family: 'Poppins', sans-serif; background: #f3f0ff; display: flex; justify-content: center; padding-top: 40px; }");
        out.println(".message-box { background: white; padding: 30px 40px; border-radius: 10px; box-shadow: 0 4px 14px rgba(100, 90, 230, 0.3); text-align: center; width: 350px; color: #5b42f3; }");
        out.println("a { display: inline-block; margin-top: 20px; color: #5b42f3; text-decoration: none; font-weight: bold; }");
        out.println("a:hover { text-decoration: underline; }");
        out.println("</style></head><body>");
        out.println("<div class='message-box'>");
        out.println("<h2>" + (deleted ? "Room deleted successfully!" : "Room deletion failed or ID missing!") + "</h2>");
        out.println("<a href='admin.jsp'>Go back to Dashboard</a> | <a href='index.jsp'>Go back to Home</a>");
        out.println("</div></body></html>");
    }
}
