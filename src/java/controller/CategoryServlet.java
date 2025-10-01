package controller;

import model.Category;
import service.CategoryService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/categories")
public class CategoryServlet extends HttpServlet {
    private CategoryService categoryService;

    @Override
    public void init() throws ServletException {
        try {
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/shoe_shop_fix", "root", "your_password");
            categoryService = new CategoryService(conn);
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
                List<Category> categories = categoryService.getAllCategories();
                request.setAttribute("categories", categories);
                request.getRequestDispatcher("/category-list.jsp").forward(request, response);
            } else if (action.equals("edit")) {
                int id = Integer.parseInt(request.getParameter("id"));
                Category category = categoryService.getCategoryById(id);
                request.setAttribute("category", category);
                request.getRequestDispatcher("/category-edit.jsp").forward(request, response);
            } else if (action.equals("delete")) {
                int id = Integer.parseInt(request.getParameter("id"));
                categoryService.deleteCategory(id);
                response.sendRedirect("categories");
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
                String name = request.getParameter("categoryName");
                Category category = new Category();
                category.setCategoryName(name);
                categoryService.addCategory(category);
                response.sendRedirect("categories");
            } else if (action.equals("update")) {
                int id = Integer.parseInt(request.getParameter("categoryId"));
                String name = request.getParameter("categoryName");
                Category category = new Category(id, name);
                categoryService.updateCategory(category);
                response.sendRedirect("categories");
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}