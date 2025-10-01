package controller;

import model.Shoe;
import model.Category;
import service.ShoeService;
import service.CategoryService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/shoes")
public class ShoeServlet extends HttpServlet {
    private ShoeService shoeService;
    private CategoryService categoryService;

    @Override
    public void init() throws ServletException {
        try {
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/shoe_shop_fix", "root", "your_password");
            shoeService = new ShoeService(conn);
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
                List<Shoe> shoes = shoeService.getAllShoes();
                request.setAttribute("shoes", shoes);
                request.getRequestDispatcher("/shoe-list.jsp").forward(request, response);
            } else if (action.equals("edit")) {
                int id = Integer.parseInt(request.getParameter("id"));
                Shoe shoe = shoeService.getShoeById(id);
                List<Category> categories = categoryService.getAllCategories();
                request.setAttribute("shoe", shoe);
                request.setAttribute("categories", categories);
                request.getRequestDispatcher("/shoe-edit.jsp").forward(request, response);
            } else if (action.equals("delete")) {
                int id = Integer.parseInt(request.getParameter("id"));
                shoeService.deleteShoe(id);
                response.sendRedirect("shoes");
            } else if (action.equals("add")) {
                List<Category> categories = categoryService.getAllCategories();
                request.setAttribute("categories", categories);
                request.getRequestDispatcher("/shoe-add.jsp").forward(request, response);
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
            int categoryId = Integer.parseInt(request.getParameter("categoryId"));
            Category category = categoryService.getCategoryById(categoryId);

            if (action == null || action.equals("add")) {
                Shoe shoe = new Shoe();
                shoe.setName(request.getParameter("name"));
                shoe.setDescription(request.getParameter("description"));
                shoe.setPrice(Double.parseDouble(request.getParameter("price")));
                shoe.setColor(request.getParameter("color"));
                shoe.setSize(request.getParameter("size"));
                shoe.setImageUrl(request.getParameter("imageUrl"));
                shoe.setStock(Integer.parseInt(request.getParameter("stock")));
                shoe.setStatus(request.getParameter("status"));
                shoe.setCategory(category);
                shoeService.addShoe(shoe);
                response.sendRedirect("shoes");
            } else if (action.equals("update")) {
                int shoeId = Integer.parseInt(request.getParameter("shoeId"));
                Shoe shoe = new Shoe(
                    shoeId,
                    request.getParameter("name"),
                    request.getParameter("description"),
                    Double.parseDouble(request.getParameter("price")),
                    request.getParameter("color"),
                    request.getParameter("size"),
                    request.getParameter("imageUrl"),
                    Integer.parseInt(request.getParameter("stock")),
                    request.getParameter("status"),
                    category
                );
                shoeService.updateShoe(shoe);
                response.sendRedirect("shoes");
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}