package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.ProductService;
import service.impl.ProductServiceImpl;

@WebServlet("/product")
public class ProductServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final int PAGE_SIZE = 6;
    private final ProductService productService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int page = 1;
        try {
            String pageParam = request.getParameter("page");
            if (pageParam != null) {
                page = Math.max(1, Integer.parseInt(pageParam));
            }
        } catch (NumberFormatException ignored) {
            page = 1;
        }

        long totalProducts = productService.count();
        int totalPages = (int) Math.ceil(totalProducts / (double) PAGE_SIZE);
        if (totalPages > 0 && page > totalPages) {
            page = totalPages;
        }

        request.setAttribute("products", productService.getPage(page, PAGE_SIZE));
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("totalProducts", totalProducts);
        request.getRequestDispatcher("/views/product.jsp").forward(request, response);
    }
}
