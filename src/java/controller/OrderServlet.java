package controller;

import model.Order;
import model.User;
import service.OrderService;
import service.UserService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

@WebServlet("/orders")
public class OrderServlet extends HttpServlet {
    private OrderService orderService;
    private UserService userService;

    @Override
    public void init() throws ServletException {
        try {
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/shoe_shop_fix", "root", "your_password");
            orderService = new OrderService(conn);
            userService = new UserService(conn);
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
                List<Order> orders = orderService.getAllOrders();
                request.setAttribute("orders", orders);
                request.getRequestDispatcher("/order-list.jsp").forward(request, response);
            } else if (action.equals("edit")) {
                int id = Integer.parseInt(request.getParameter("id"));
                Order order = orderService.getOrderById(id);
                List<User> users = userService.getAllUsers();
                request.setAttribute("order", order);
                request.setAttribute("users", users);
                request.getRequestDispatcher("/order-edit.jsp").forward(request, response);
            } else if (action.equals("delete")) {
                int id = Integer.parseInt(request.getParameter("id"));
                orderService.deleteOrder(id);
                response.sendRedirect("orders");
            } else if (action.equals("add")) {
                List<User> users = userService.getAllUsers();
                request.setAttribute("users", users);
                request.getRequestDispatcher("/order-add.jsp").forward(request, response);
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
            int userId = Integer.parseInt(request.getParameter("userId"));
            User user = userService.getUserById(userId);
            Date orderDate = new Date(); // Hoặc lấy từ request nếu có
            String status = request.getParameter("status");
            double totalAmount = Double.parseDouble(request.getParameter("totalAmount"));

            if (action == null || action.equals("add")) {
                Order order = new Order(0, user, orderDate, status, totalAmount);
                orderService.addOrder(order);
                response.sendRedirect("orders");
            } else if (action.equals("update")) {
                int orderId = Integer.parseInt(request.getParameter("orderId"));
                Order order = new Order(orderId, user, orderDate, status, totalAmount);
                orderService.updateOrder(order);
                response.sendRedirect("orders");
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}