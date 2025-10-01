/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import DAO.ShoeDAO;
import model.Shoe;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
/**
 *
 * @author admin
 */
public class ShoeService {
    private ShoeDAO shoeDAO;

    public ShoeService(Connection conn) {
        this.shoeDAO = new ShoeDAO(conn);
    }

    public List<Shoe> getAllShoes() throws SQLException {
        return shoeDAO.getAllShoes();
    }

    public Shoe getShoeById(int id) throws SQLException {
        return shoeDAO.getShoeById(id);
    }

    public boolean addShoe(Shoe shoe) throws SQLException {
        // Validate logic ở đây nếu cần
        return shoeDAO.insertShoe(shoe);
    }

    public boolean updateShoe(Shoe shoe) throws SQLException {
        return shoeDAO.updateShoe(shoe);
    }

    public boolean deleteShoe(int id) throws SQLException {
        return shoeDAO.deleteShoe(id);
    }
}
