/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import DAO.CategoryDAO;
import model.Category;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author admin
 */
public class CategoryService {

    private CategoryDAO categoryDAO;

    public CategoryService(Connection conn) {
        this.categoryDAO = new CategoryDAO(conn);
    }

    public List<Category> getAllCategories() throws SQLException {
        return categoryDAO.getAllCategories();
    }

    public Category getCategoryById(int id) throws SQLException {
        return categoryDAO.getCategoryById(id);
    }

    public boolean addCategory(Category category) throws SQLException {
        // Thêm logic kiểm tra tên trùng, validate nếu cần
        return categoryDAO.insertCategory(category);
    }

    public boolean updateCategory(Category category) throws SQLException {
        return categoryDAO.updateCategory(category);
    }

    public boolean deleteCategory(int id) throws SQLException {
        return categoryDAO.deleteCategory(id);
    }
}
