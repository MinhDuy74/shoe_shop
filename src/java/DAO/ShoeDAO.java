/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import model.Shoe;
import model.Category;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class ShoeDAO {

    private Connection conn;
    private CategoryDAO categoryDAO;

    public ShoeDAO(Connection conn) {
        this.conn = conn;
        this.categoryDAO = new CategoryDAO(conn);
    }

    public List<Shoe> getAllShoes() throws SQLException {
        List<Shoe> list = new ArrayList<>();
        String sql = "SELECT * FROM shoes";
        try (PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Category category = categoryDAO.getCategoryById(rs.getInt("category_id"));
                Shoe shoe = new Shoe(
                        rs.getInt("shoe_id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getDouble("price"),
                        rs.getString("color"),
                        rs.getString("size"),
                        rs.getString("image_url"),
                        rs.getInt("stock"),
                        rs.getString("status"),
                        category
                );
                list.add(shoe);
            }
        }
        return list;
    }

    public Shoe getShoeById(int id) throws SQLException {
        String sql = "SELECT * FROM shoes WHERE shoe_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Category category = categoryDAO.getCategoryById(rs.getInt("category_id"));
                    return new Shoe(
                            rs.getInt("shoe_id"),
                            rs.getString("name"),
                            rs.getString("description"),
                            rs.getDouble("price"),
                            rs.getString("color"),
                            rs.getString("size"),
                            rs.getString("image_url"),
                            rs.getInt("stock"),
                            rs.getString("status"),
                            category
                    );
                }
            }
        }
        return null;
    }

    public boolean insertShoe(Shoe shoe) throws SQLException {
        String sql = "INSERT INTO shoes (name, description, price, color, size, image_url, stock, status, category_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, shoe.getName());
            ps.setString(2, shoe.getDescription());
            ps.setDouble(3, shoe.getPrice());
            ps.setString(4, shoe.getColor());
            ps.setString(5, shoe.getSize());
            ps.setString(6, shoe.getImageUrl());
            ps.setInt(7, shoe.getStock());
            ps.setString(8, shoe.getStatus());
            ps.setInt(9, shoe.getCategory().getCategoryId());
            return ps.executeUpdate() > 0;
        }
    }

    public boolean updateShoe(Shoe shoe) throws SQLException {
        String sql = "UPDATE shoes SET name=?, description=?, price=?, color=?, size=?, image_url=?, stock=?, status=?, category_id=? WHERE shoe_id=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, shoe.getName());
            ps.setString(2, shoe.getDescription());
            ps.setDouble(3, shoe.getPrice());
            ps.setString(4, shoe.getColor());
            ps.setString(5, shoe.getSize());
            ps.setString(6, shoe.getImageUrl());
            ps.setInt(7, shoe.getStock());
            ps.setString(8, shoe.getStatus());
            ps.setInt(9, shoe.getCategory().getCategoryId());
            ps.setInt(10, shoe.getShoeId());
            return ps.executeUpdate() > 0;
        }
    }

    public boolean deleteShoe(int id) throws SQLException {
        String sql = "DELETE FROM shoes WHERE shoe_id=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        }
    }
}
