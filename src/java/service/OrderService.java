/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import DAO.OrderDAO;
import model.Order;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author admin
 */
public class OrderService {

    private OrderDAO orderDAO;

    public OrderService(Connection conn) {
        this.orderDAO = new OrderDAO(conn);
    }

    public List<Order> getAllOrders() throws SQLException {
        return orderDAO.getAllOrders();
    }

    public Order getOrderById(int id) throws SQLException {
        return orderDAO.getOrderById(id);
    }

    public boolean addOrder(Order order) throws SQLException {
        // Có thể kiểm tra logic nghiệp vụ ở đây
        return orderDAO.insertOrder(order);
    }

    public boolean updateOrder(Order order) throws SQLException {
        return orderDAO.updateOrder(order);
    }

    public boolean deleteOrder(int id) throws SQLException {
        return orderDAO.deleteOrder(id);
    }
}
