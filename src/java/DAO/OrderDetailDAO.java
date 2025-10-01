/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import model.OrderDetail;
import model.Order;
import model.Shoe;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class OrderDetailDAO {

    private Connection conn;
    private ShoeDAO shoeDAO;

    public OrderDetailDAO(Connection conn) {
        this.conn = conn;
        this.shoeDAO = new ShoeDAO(conn);
    }

    // Trả về list OrderDetail cho 1 Order đã biết (truyền sẵn order)
    public List<OrderDetail> getOrderDetailsByOrder(Order order) throws SQLException {
        List<OrderDetail> list = new ArrayList<>();
        String sql = "SELECT * FROM order_details WHERE order_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, order.getOrderId());
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Shoe shoe = shoeDAO.getShoeById(rs.getInt("shoe_id"));
                    OrderDetail od = new OrderDetail(
                            rs.getInt("order_detail_id"),
                            order, // dùng object order đã có sẵn, tránh truy vấn lặp lại
                            shoe,
                            rs.getInt("quantity"),
                            rs.getDouble("price")
                    );
                    list.add(od);
                }
            }
        }
        return list;
    }

    // Nếu lấy order detail riêng lẻ (không truyền order), chỉ nên set orderId hoặc lấy order nếu thực sự cần
    public OrderDetail getOrderDetailById(int orderDetailId) throws SQLException {
        String sql = "SELECT * FROM order_details WHERE order_detail_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, orderDetailId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    // Tránh vòng lặp: chỉ lấy orderId, không lấy full Order
                    int orderId = rs.getInt("order_id");
                    Shoe shoe = shoeDAO.getShoeById(rs.getInt("shoe_id"));
                    Order order = new Order();
                    order.setOrderId(orderId);
                    return new OrderDetail(
                            rs.getInt("order_detail_id"),
                            order,
                            shoe,
                            rs.getInt("quantity"),
                            rs.getDouble("price")
                    );
                }
            }
        }
        return null;
    }

    public boolean insertOrderDetail(OrderDetail orderDetail) throws SQLException {
        String sql = "INSERT INTO order_details (order_id, shoe_id, quantity, price) VALUES (?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, orderDetail.getOrder().getOrderId());
            ps.setInt(2, orderDetail.getShoe().getShoeId());
            ps.setInt(3, orderDetail.getQuantity());
            ps.setDouble(4, orderDetail.getPrice());
            return ps.executeUpdate() > 0;
        }
    }

    public boolean deleteOrderDetail(int orderDetailId) throws SQLException {
        String sql = "DELETE FROM order_details WHERE order_detail_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, orderDetailId);
            return ps.executeUpdate() > 0;
        }
    }
}
