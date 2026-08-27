package controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import entity.Category;
import service.CategoryService;
import service.impl.CategoryServiceImpl;

@WebServlet("/admin/category/list")
public class CategoryListController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private final CategoryService cateService =
            new CategoryServiceImpl();

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        List<Category> cateList =
                cateService.getAll();

        request.setAttribute(
                "cateList",
                cateList);

        request.getRequestDispatcher(
                "/views/admin/list-category.jsp")
                .forward(request, response);
    }
}