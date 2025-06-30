package Ajit;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

// This is server layer
@WebServlet("/userlogin")
public class UserloginServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) 
            throws ServletException, IOException {

        System.out.println("Request Method: " + req.getMethod());
        System.out.println("On server side");

        // Retrieve user input
        String user = req.getParameter("name");
        String pass = req.getParameter("password"); 

        UserAuthentication obj = new UserAuthentication();
        boolean result = obj.checkUser(user, pass);

//        res.setContentType("text/html");
        //PrintWriter out = res.getWriter();
//        HttpSession ses = req.getSession();
        		
        if (result) {
        	HttpSession ses = req.getSession(true);
        	
           ses.setAttribute("currentuser", user);
           ses.setAttribute("cupass", pass);
//           
//           ses.setAttribute("Success", "Welcome "+user);
            res.sendRedirect("index.jsp");
//        	out.println("Valid User");
        } else {
            req.setAttribute("errormsg", "Inavalid Username or password");
            RequestDispatcher rd= req.getRequestDispatcher("login.jsp");
            rd.forward(req, res);
            res.sendRedirect("login.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        doGet(req, res); // Forward POST to GET logic
    }
}
