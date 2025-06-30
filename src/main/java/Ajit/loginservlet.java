package Ajit;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

// This is server layer
@WebServlet("/login")
public class loginservlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) 
            throws ServletException, IOException {
            
        String user = req.getParameter("name");
        String pass = req.getParameter("password"); 

        UserAuthentication obj = new UserAuthentication();
        boolean result = obj.checkUser(user, pass);
        
        if (result) {
            HttpSession ses = req.getSession(true);
            ses.setAttribute("currentuser", user);
            ses.setAttribute("cupass", pass);
            
            // Check for pending roomId after successful login
            String pendingRoomId = (String) ses.getAttribute("pendingRoomId");
            if (pendingRoomId != null) {
                ses.removeAttribute("pendingRoomId"); // Clean up
                res.sendRedirect("Bill.jsp?roomId=" + pendingRoomId);
            } else {
                res.sendRedirect("Bill.jsp");
            }
        } else {
            req.setAttribute("errormsg", "Invalid Username or password");
            RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
            rd.forward(req, res);
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doGet(request, response);
    }
}