package controller;

import model.User;
import service.UserService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private final UserService userService = new UserService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String fullname = req.getParameter("fullname");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String repass = req.getParameter("password_confirmation");
        String gender = req.getParameter("gender");

        String err = userService.validateRegistration(fullname, email, password, repass, gender);
        if (err != null) {
            req.setAttribute("error", err);
            req.getRequestDispatcher("register.jsp").forward(req, resp);
            return;
        }

        User u = new User();
        u.setFullname(fullname);
        u.setEmail(email);
        u.setPassword(password);
        u.setGender(gender);
        u.setRole("user");

        boolean ok = userService.register(u);
        if (ok) {
            req.setAttribute("success", "Đăng ký thành công! Vui lòng đăng nhập.");
        } else {
            req.setAttribute("error", "Lỗi hệ thống, vui lòng thử lại.");
        }
        req.getRequestDispatcher("registration.jsp").forward(req, resp);
    }
}