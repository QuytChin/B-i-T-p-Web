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

@WebServlet("/admin/product/add")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 25)
public class ProductAddController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final ProductService productService = new ProductServiceImpl();
    private final CategoryService categoryService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("categories", categoryService.getAll());
        request.getRequestDispatcher("/views/admin/add-product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        try {
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            BigDecimal price = new BigDecimal(request.getParameter("price"));
            int categoryId = Integer.parseInt(request.getParameter("categoryId"));

            Category category = categoryService.get(categoryId);
            if (category == null) {
                throw new IllegalArgumentException("Danh mục không tồn tại");
            }

            Part imagePart = request.getPart("image");
            String image = UploadUtil.saveImage(imagePart, "product");

            Product product = new Product();
            product.setName(name);
            product.setDescription(description);
            product.setPrice(price);
            product.setImage(image);
            product.setCategory(category);
            productService.insert(product);

            response.sendRedirect(request.getContextPath() + "/admin/product/list");
        } catch (Exception e) {
            request.setAttribute("error", "Không thể thêm sản phẩm: " + e.getMessage());
            request.setAttribute("categories", categoryService.getAll());
            request.getRequestDispatcher("/views/admin/add-product.jsp").forward(request, response);
        }
    }
}
