/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import DAO.UserDAO;
import model.User;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author admin
 */
public class UserService {

    private UserDAO userDAO;

    public UserService(Connection conn) {
        this.userDAO = new UserDAO(conn);
    }

    public List<User> getAllUsers() throws SQLException {
        return userDAO.getAllUsers();
    }

    public User getUserById(int id) throws SQLException {
        return userDAO.getUserById(id);
    }

    public User getUserByUsername(String username) throws SQLException {
        return userDAO.getUserByUsername(username);
    }

    public boolean addUser(User user) throws SQLException {
        // Có thể kiểm tra validate, password hash ở đây
        return userDAO.insertUser(user);
    }

    public boolean updateUser(User user) throws SQLException {
        return userDAO.updateUser(user);
    }

    public boolean deleteUser(int id) throws SQLException {
        return userDAO.deleteUser(id);
    }
}
