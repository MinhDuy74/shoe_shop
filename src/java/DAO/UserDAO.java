package dao;

import model.User;
import DAO.connection.MyConnection;
import DAO.connection.PasswordUtil;

import java.sql.*;

public class UserDAO {

    public boolean emailExists(String email) {
        String sql = "SELECT 1 FROM users WHERE email = ?";
        try (Connection c = MyConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (Exception e) { e.printStackTrace(); }
        return false;
    }

    public boolean usernameExists(String username) {
        String sql = "SELECT 1 FROM users WHERE username = ?";
        try (Connection c = MyConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (Exception e) { e.printStackTrace(); }
        return false;
    }

    public boolean register(User u) {
        String sql = "INSERT INTO users(username,password,email,role) VALUES (?,?,?,?)";
        try (Connection c = MyConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, u.getFullname());
            ps.setString(2, PasswordUtil.hash(u.getPassword()));
            ps.setString(3, u.getEmail());
            ps.setString(4, u.getRole() == null ? "user" : u.getRole());
            return ps.executeUpdate() > 0;
        } catch (Exception e) { e.printStackTrace(); }
        return false;
    }

    public User login(String email, String passwordPlain) {
        String sql = "SELECT * FROM users WHERE email=? AND password=?";
        String hashed = PasswordUtil.hash(passwordPlain);
        try (Connection c = MyConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, email);
            ps.setString(2, hashed);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User u = new User();
                u.setUser_id(rs.getInt("user_id"));
                u.setFullname(rs.getString("username"));
                u.setEmail(rs.getString("email"));
                u.setRole(rs.getString("role"));
                // gender nếu sau này thêm cột
                return u;
            }
        } catch (Exception e) { e.printStackTrace(); }
        return null;
    }
}