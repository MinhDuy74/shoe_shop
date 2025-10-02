package service;

import dao.UserDAO;
import model.User;

public class UserService {
    private final UserDAO userDAO = new UserDAO();

    public String validateRegistration(String fullname, String email, String pass, String repass, String gender) {
        if (isBlank(fullname) || isBlank(email) || isBlank(pass) || isBlank(repass) || isBlank(gender))
            return "Vui lòng nhập đầy đủ thông tin!";
        if (!pass.equals(repass))
            return "Mật khẩu nhập lại không khớp!";
        if (userDAO.emailExists(email))
            return "Email đã tồn tại!";
        if (userDAO.usernameExists(fullname))
            return "Tên người dùng đã tồn tại!";
        return null;
    }

    public boolean register(User u) {
        return userDAO.register(u);
    }

    public User login(String email, String password) {
        if (isBlank(email) || isBlank(password)) return null;
        return userDAO.login(email, password);
    }

    private boolean isBlank(String s) {
        return s == null || s.trim().isEmpty();
    }
}