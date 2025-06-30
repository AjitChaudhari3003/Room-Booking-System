package Ajit;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/admin")
public class AdminLoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) 
            throws ServletException, IOException {

        String user = req.getParameter("username");
        String pass = req.getParameter("password");

        UserAuthentication obj = new UserAuthentication();
        boolean result = obj.checkUser(user, pass);

        if (result) {
            HttpSession session = req.getSession(true);
            session.setAttribute("currentAdmin", user);
            res.sendRedirect("admin.jsp");
        } else {
            req.setAttribute("errormsg", "Invalid Username or Password");
            RequestDispatcher rd = req.getRequestDispatcher("adminLogin.jsp");
            rd.forward(req, res);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        doGet(request, response);
    }
}
