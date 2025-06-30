package Ajit;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LogindatabaseConnectivity  {
//Datapersitance layer
	public boolean isvalid(String user, String pass) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/firstbit", "root", "Ajit@3003");

			PreparedStatement ps = con.prepareStatement("SELECT * FROM user WHERE email=? AND password=?");
			ps.setString(1, user);
			ps.setString(2, pass);

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				return true;
			} else {
				return false;
			}

		} catch (ClassNotFoundException | SQLException e) {

			e.printStackTrace();
		}
		return false;
	}

}
