package controller;

import model.User;
import service.UserService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/users")
public class UserServlet extends HttpServlet {
    private UserService userService;

    @Override
    public void init() throws ServletException {
        try {
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/shoe_shop_fix", "root", "your_password");
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
                List<User> users = userService.getAllUsers();
                request.setAttribute("users", users);
                request.getRequestDispatcher("/user-list.jsp").forward(request, response);
            } else if (action.equals("edit")) {
                int id = Integer.parseInt(request.getParameter("id"));
                User user = userService.getUserById(id);
                request.setAttribute("user", user);
                request.getRequestDispatcher("/user-edit.jsp").forward(request, response);
            } else if (action.equals("delete")) {
                int id = Integer.parseInt(request.getParameter("id"));
                userService.deleteUser(id);
                response.sendRedirect("users");
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
            if (action == null || action.equals("add")) {
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String email = request.getParameter("email");
                String role = request.getParameter("role");
                User user = new User(0, username, password, email, role);
                userService.addUser(user);
                response.sendRedirect("users");
            } else if (action.equals("update")) {
                int userId = Integer.parseInt(request.getParameter("userId"));
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String email = request.getParameter("email");
                String role = request.getParameter("role");
                User user = new User(userId, username, password, email, role);
                userService.updateUser(user);
                response.sendRedirect("users");
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}