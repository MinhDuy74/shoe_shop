/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import DAO.OrderDetailDAO;
import model.OrderDetail;
import model.Order;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author admin
 */
public class OrderDetailService {

    private OrderDetailDAO orderDetailDAO;

    public OrderDetailService(Connection conn) {
        this.orderDetailDAO = new OrderDetailDAO(conn);
    }

    public List<OrderDetail> getOrderDetailsByOrder(Order order) throws SQLException {
        return orderDetailDAO.getOrderDetailsByOrder(order);
    }

    public OrderDetail getOrderDetailById(int id) throws SQLException {
        return orderDetailDAO.getOrderDetailById(id);
    }

    public boolean addOrderDetail(OrderDetail orderDetail) throws SQLException {
        // Kiểm tra logic ở đây nếu cần
        return orderDetailDAO.insertOrderDetail(orderDetail);
    }

    public boolean deleteOrderDetail(int id) throws SQLException {
        return orderDetailDAO.deleteOrderDetail(id);
    }
}
