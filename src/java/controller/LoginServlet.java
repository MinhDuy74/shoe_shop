package controller;

import model.User;
import service.UserService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private final UserService userService = new UserService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        User user = userService.login(email, password);
        if (user == null) {
            req.setAttribute("error", "Sai email hoặc mật khẩu!");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
            return;
        }
        HttpSession session = req.getSession();
        session.setAttribute("user", user);
        if ("admin".equalsIgnoreCase(user.getRole())) {
            resp.sendRedirect("admin_dashboard.jsp");
        } else {
            resp.sendRedirect("index.jsp");
        }
    }
}