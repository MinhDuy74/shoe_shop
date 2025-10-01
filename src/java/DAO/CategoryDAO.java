/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import model.Category;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class CategoryDAO {

    private Connection conn;

    public CategoryDAO(Connection conn) {
        this.conn = conn;
    }

    public List<Category> getAllCategories() throws SQLException {
        List<Category> list = new ArrayList<>();
        String sql = "SELECT * FROM categories";
        try (PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Category c = new Category(
                        rs.getInt("category_id"),
                        rs.getString("category_name")
                );
                list.add(c);
            }
        }
        return list;
    }

    public Category getCategoryById(int id) throws SQLException {
        String sql = "SELECT * FROM categories WHERE category_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Category(
                            rs.getInt("category_id"),
                            rs.getString("category_name")
                    );
                }
            }
        }
        return null;
    }

    public boolean insertCategory(Category category) throws SQLException {
        String sql = "INSERT INTO categories (category_name) VALUES (?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, category.getCategoryName());
            return ps.executeUpdate() > 0;
        }
    }

    public boolean updateCategory(Category category) throws SQLException {
        String sql = "UPDATE categories SET category_name = ? WHERE category_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, category.getCategoryName());
            ps.setInt(2, category.getCategoryId());
            return ps.executeUpdate() > 0;
        }
    }

    public boolean deleteCategory(int id) throws SQLException {
        String sql = "DELETE FROM categories WHERE category_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        }
    }
}
