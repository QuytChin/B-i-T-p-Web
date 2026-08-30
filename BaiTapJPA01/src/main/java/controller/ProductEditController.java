package controller;

import java.io.IOException;
import java.math.BigDecimal;

import entity.Category;
import entity.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import service.CategoryService;
import service.ProductService;
import service.impl.CategoryServiceImpl;
import service.impl.ProductServiceImpl;
import util.UploadUtil;

@WebServlet("/admin/product/edit")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 25)
public class ProductEditController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final ProductService productService = new ProductServiceImpl();
    private final CategoryService categoryService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.get(id);
        if (product == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }
        request.setAttribute("product", product);
        request.setAttribute("categories", categoryService.getAll());
        request.getRequestDispatcher("/views/admin/edit-product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.get(id);
        if (product == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        try {
            product.setName(request.getParameter("name"));
            product.setDescription(request.getParameter("description"));
            product.setPrice(new BigDecimal(request.getParameter("price")));

            int categoryId = Integer.parseInt(request.getParameter("categoryId"));
            Category category = categoryService.get(categoryId);
            if (category == null) {
                throw new IllegalArgumentException("Danh mục không tồn tại");
            }
            product.setCategory(category);

            Part imagePart = request.getPart("image");
            String newImage = UploadUtil.saveImage(imagePart, "product");
            if (newImage != null) {
                product.setImage(newImage);
            }

            productService.update(product);
            response.sendRedirect(request.getContextPath() + "/admin/product/list");
        } catch (Exception e) {
            request.setAttribute("error", "Không thể cập nhật sản phẩm: " + e.getMessage());
            request.setAttribute("product", product);
            request.setAttribute("categories", categoryService.getAll());
            request.getRequestDispatcher("/views/admin/edit-product.jsp").forward(request, response);
        }
    }
}
