package Ajit;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.*;

@WebServlet("/adminRegister")
public class AdminRegisterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("register.jsp").forward(request, response); 
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String age = request.getParameter("age");
        String address = request.getParameter("address");
        String city = request.getParameter("city");

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            // Connect to your DB (example: MySQL)
            Class.forName("com.mysql.cj.jdbc.Driver");//in firstbit ->user
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/firstbit", "root", "Ajit@3003");

            String sql = "INSERT INTO user (email, password, age, address, city) VALUES (?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            stmt.setString(2, password);
            stmt.setInt(3, Integer.parseInt(age));
            stmt.setString(4, address);
            stmt.setString(5, city);

            int rows = stmt.executeUpdate();

            if (rows > 0) {
                response.sendRedirect("adminLogin.jsp"); 
            } else {
                request.setAttribute("errormsg", "Registration failed. Try again.");
                request.getRequestDispatcher("adminRegister.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errormsg", "Error: " + e.getMessage());
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } finally {
            try { if (stmt != null) stmt.close(); } catch (Exception ignored) {}
            try { if (conn != null) conn.close(); } catch (Exception ignored) {}
        }
    }
}
