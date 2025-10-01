/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author ADMIN
 */
public class MyConnection {
    private static final String URL = "jdbc:mysql://localhost:3306/shoe_shop_fix?useSSL=false";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "12345678";
    
    public static Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (ClassNotFoundException e) {
            System.err.println("ClassNotFoundException Error!");
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return connection;
    }
}
