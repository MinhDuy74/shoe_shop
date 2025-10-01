/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import model.Order;
import model.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author admin
 */
public class OrderDAO {

    private Connection conn;
    private UserDAO userDAO;

    public OrderDAO(Connection conn) {
        this.conn = conn;
        this.userDAO = new UserDAO(conn);
    }

    public List<Order> getAllOrders() throws SQLException {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT * FROM orders";
        try (PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                User user = userDAO.getUserById(rs.getInt("user_id"));
                Order order = new Order(
                        rs.getInt("order_id"),
                        user,
                        rs.getTimestamp("order_date"),
                        rs.getString("status"),
                        rs.getDouble("total_amount")
                );
                list.add(order);
            }
        }
        return list;
    }

    public Order getOrderById(int id) throws SQLException {
        String sql = "SELECT * FROM orders WHERE order_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    User user = userDAO.getUserById(rs.getInt("user_id"));
                    return new Order(
                            rs.getInt("order_id"),
                            user,
                            rs.getTimestamp("order_date"),
                            rs.getString("status"),
                            rs.getDouble("total_amount")
                    );
                }
            }
        }
        return null;
    }

    public boolean insertOrder(Order order) throws SQLException {
        String sql = "INSERT INTO orders (user_id, order_date, status, total_amount) VALUES (?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, order.getUser().getUserId());
            ps.setTimestamp(2, new Timestamp(order.getOrderDate().getTime()));
            ps.setString(3, order.getStatus());
            ps.setDouble(4, order.getTotalAmount());
            int affected = ps.executeUpdate();
            if (affected > 0) {
                try (ResultSet rs = ps.getGeneratedKeys()) {
                    if (rs.next()) {
                        order.setOrderId(rs.getInt(1));
                    }
                }
            }
            return affected > 0;
        }
    }

    public boolean updateOrder(Order order) throws SQLException {
        String sql = "UPDATE orders SET user_id=?, order_date=?, status=?, total_amount=? WHERE order_id=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, order.getUser().getUserId());
            ps.setTimestamp(2, new Timestamp(order.getOrderDate().getTime()));
            ps.setString(3, order.getStatus());
            ps.setDouble(4, order.getTotalAmount());
            ps.setInt(5, order.getOrderId());
            return ps.executeUpdate() > 0;
        }
    }

    public boolean deleteOrder(int id) throws SQLException {
        String sql = "DELETE FROM orders WHERE order_id=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        }
    }
}
