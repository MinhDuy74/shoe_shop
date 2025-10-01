package controller;

import model.Order;
import model.OrderDetail;
import model.Shoe;
import service.OrderDetailService;
import service.OrderService;
import service.ShoeService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/orderdetails")
public class OrderDetailServlet extends HttpServlet {
    private OrderDetailService orderDetailService;
    private OrderService orderService;
    private ShoeService shoeService;

    @Override
    public void init() throws ServletException {
        try {
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/shoe_shop_fix", "root", "your_password");
            orderDetailService = new OrderDetailService(conn);
            orderService = new OrderService(conn);
            shoeService = new ShoeService(conn);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            if (action == null || action.equals("list")) {
                int orderId = Integer.parseInt(request.getParameter("orderId"));
                Order order = orderService.getOrderById(orderId);
                List<OrderDetail> orderDetails = orderDetailService.getOrderDetailsByOrder(order);
                request.setAttribute("orderDetails", orderDetails);
                request.setAttribute("order", order);
                request.getRequestDispatcher("/order-detail-list.jsp").forward(request, response);
            } else if (action.equals("edit")) {
                int id = Integer.parseInt(request.getParameter("id"));
                OrderDetail orderDetail = orderDetailService.getOrderDetailById(id);
                List<Shoe> shoes = shoeService.getAllShoes();
                request.setAttribute("orderDetail", orderDetail);
                request.setAttribute("shoes", shoes);
                request.getRequestDispatcher("/order-detail-edit.jsp").forward(request, response);
            } else if (action.equals("delete")) {
                int id = Integer.parseInt(request.getParameter("id"));
                orderDetailService.deleteOrderDetail(id);
                // Quay lại trang danh sách order details của order hiện tại
                int orderId = Integer.parseInt(request.getParameter("orderId"));
                response.sendRedirect("orderdetails?orderId=" + orderId);
            } else if (action.equals("add")) {
                int orderId = Integer.parseInt(request.getParameter("orderId"));
                List<Shoe> shoes = shoeService.getAllShoes();
                request.setAttribute("orderId", orderId);
                request.setAttribute("shoes", shoes);
                request.getRequestDispatcher("/order-detail-add.jsp").forward(request, response);
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            int orderId = Integer.parseInt(request.getParameter("orderId"));
            Order order = orderService.getOrderById(orderId);
            int shoeId = Integer.parseInt(request.getParameter("shoeId"));
            Shoe shoe = shoeService.getShoeById(shoeId);
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            double price = Double.parseDouble(request.getParameter("price"));

            if (action == null || action.equals("add")) {
                OrderDetail orderDetail = new OrderDetail(0, order, shoe, quantity, price);
                orderDetailService.addOrderDetail(orderDetail);
                response.sendRedirect("orderdetails?orderId=" + orderId);
            } else if (action.equals("update")) {
                int orderDetailId = Integer.parseInt(request.getParameter("orderDetailId"));
                OrderDetail orderDetail = new OrderDetail(orderDetailId, order, shoe, quantity, price);
                orderDetailService.addOrderDetail(orderDetail);
                response.sendRedirect("orderdetails?orderId=" + orderId);
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}