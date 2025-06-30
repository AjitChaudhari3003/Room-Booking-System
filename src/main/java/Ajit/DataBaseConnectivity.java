package Ajit;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DataBaseConnectivity {

    public List<Room> getAllRooms() {
        List<Room> rooms = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/rooms", "root", "Ajit@3003");

            String sql = "SELECT * FROM room";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Room r = new Room();
                r.setId(rs.getInt("id"));
                r.setName(rs.getString("name"));
                r.setLocation(rs.getString("location"));
                r.setCapacity(rs.getInt("capacity"));
                r.setFeatures(rs.getString("features"));
                r.setAc_type(rs.getString("ac_type"));
                r.setPricePerHour(rs.getDouble("price_per_hour"));
                r.setImage(rs.getString("image"));
                rooms.add(r);
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rooms;
    }

    public Room getRoomById(int id) {
        Room room = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/rooms", "root", "Ajit@3003");

            String sql = "SELECT * FROM room WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                room = new Room();
                room.setId(rs.getInt("id"));
                room.setName(rs.getString("name"));
                room.setLocation(rs.getString("location"));
                room.setCapacity(rs.getInt("capacity"));
                room.setFeatures(rs.getString("features"));
                room.setAc_type(rs.getString("ac_type"));
                room.setPricePerHour(rs.getDouble("price_per_hour"));
                room.setImage(rs.getString("image"));
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return room;
    }

    // Add Room
    public boolean addRoom(Room room) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/rooms", "root", "Ajit@3003");

            String sql = "INSERT INTO room (name, location, capacity, features, ac_type, price_per_hour, image) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setString(1, room.getName());
            stmt.setString(2, room.getLocation());
            stmt.setInt(3, room.getCapacity());
            stmt.setString(4, room.getFeatures());
            stmt.setString(5, room.getAc_type());
            stmt.setDouble(6, room.getPricePerHour());
            stmt.setString(7, room.getImage());

            int rows = stmt.executeUpdate();
            conn.close();
            return rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    public boolean updateRoom(Room room) {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/rooms", "root", "Ajit@3003");

            String sql = "UPDATE room SET name=?, location=?, capacity=?, price_per_hour=?, image=? WHERE id=?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, room.getName());
            stmt.setString(2, room.getLocation());
            stmt.setInt(3, room.getCapacity());
            stmt.setDouble(4, room.getPricePerHour());
            stmt.setString(5, room.getImage());
            stmt.setInt(6, room.getId());

            int rows = stmt.executeUpdate();
            return rows > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // Delete Room
    public boolean deleteRoom(int id) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/rooms", "root", "Ajit@3003");

            String sql = "DELETE FROM room WHERE id=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);

            int rows = stmt.executeUpdate();
            conn.close();
            return rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public Room getRoomByName(String name) {
        Room room = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/rooms", "root", "Ajit@3003");
            
            String sql = "SELECT * FROM room WHERE name = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, name);
            
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                room = new Room();
                room.setId(rs.getInt("id"));
                room.setName(rs.getString("name"));
                room.setLocation(rs.getString("location"));
                room.setCapacity(rs.getInt("capacity"));
                room.setPricePerHour(rs.getDouble("price_per_hour"));
                room.setImage(rs.getString("image"));
            }
            
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return room;
    }
}
