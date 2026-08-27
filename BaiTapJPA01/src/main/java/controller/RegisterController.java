package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import service.UserService;
import service.impl.UserServiceImpl;

@WebServlet("/register")
public class RegisterController
        extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private final UserService userService =
            new UserServiceImpl();

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession(false);

        if (session != null
                && session.getAttribute("username") != null) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/home");

            return;
        }

        request.getRequestDispatcher(
                "/views/register.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String username =
                request.getParameter("username");

        String password =
                request.getParameter("password");

        String confirmPassword =
                request.getParameter("confirmPassword");

        String fullname =
                request.getParameter("fullname");

        String studentId =
                request.getParameter("studentId");

        String email =
                request.getParameter("email");

        String phone =
                request.getParameter("phone");


        // Kiểm tra dữ liệu rỗng
        if (username == null
                || username.isBlank()
                || password == null
                || password.isBlank()
                || fullname == null
                || fullname.isBlank()) {

            request.setAttribute(
                    "error",
                    "Vui lòng nhập đầy đủ thông tin bắt buộc!");

            request.getRequestDispatcher(
                    "/views/register.jsp")
                    .forward(request, response);

            return;
        }


        // Kiểm tra nhập lại mật khẩu
        if (!password.equals(confirmPassword)) {

            request.setAttribute(
                    "error",
                    "Mật khẩu xác nhận không khớp!");

            request.getRequestDispatcher(
                    "/views/register.jsp")
                    .forward(request, response);

            return;
        }


        // Username đã tồn tại
        if (userService.checkExistUsername(username)) {

            request.setAttribute(
                    "error",
                    "Tên đăng nhập đã tồn tại!");

            request.getRequestDispatcher(
                    "/views/register.jsp")
                    .forward(request, response);

            return;
        }


        // Email đã tồn tại
        if (userService.checkExistEmail(email)) {

            request.setAttribute(
                    "error",
                    "Email đã được sử dụng!");

            request.getRequestDispatcher(
                    "/views/register.jsp")
                    .forward(request, response);

            return;
        }


        boolean success =
                userService.register(
                        username,
                        password,
                        email,
                        fullname,
                        phone,
                        studentId);


        if (success) {

            request.setAttribute(
                    "success",
                    "Đăng ký thành công! Bạn có thể đăng nhập.");

            request.getRequestDispatcher(
                    "/views/login.jsp")
                    .forward(request, response);

        } else {

            request.setAttribute(
                    "error",
                    "Đăng ký thất bại!");

            request.getRequestDispatcher(
                    "/views/register.jsp")
                    .forward(request, response);
        }
    }
}