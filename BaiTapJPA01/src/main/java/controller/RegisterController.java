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
import util.MailUtil;
import util.OtpUtil;

@WebServlet("/register")
public class RegisterController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final long OTP_EXPIRE_MILLIS = 5 * 60 * 1000L;
    private final UserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("username") != null) {
            response.sendRedirect(request.getContextPath() + "/home");
            return;
        }
        request.getRequestDispatcher("/views/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String username = trim(request.getParameter("username"));
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String fullname = trim(request.getParameter("fullname"));
        String studentId = trim(request.getParameter("studentId"));
        String email = trim(request.getParameter("email"));
        String phone = trim(request.getParameter("phone"));

        if (isBlank(username) || isBlank(password) || isBlank(fullname) || isBlank(email)) {
            showError(request, response, "Vui lòng nhập username, họ tên, email và mật khẩu.");
            return;
        }
        if (!password.equals(confirmPassword)) {
            showError(request, response, "Mật khẩu xác nhận không khớp!");
            return;
        }
        if (userService.checkExistUsername(username)) {
            showError(request, response, "Tên đăng nhập đã tồn tại!");
            return;
        }
        if (userService.checkExistEmail(email)) {
            showError(request, response, "Email đã được sử dụng!");
            return;
        }

        String otp = OtpUtil.generateOtp();
        try {
            MailUtil.sendOtp(email, "OTP kích hoạt tài khoản", otp);
        } catch (Exception e) {
            showError(request, response,
                    "Không gửi được OTP. Kiểm tra cấu hình Gmail/App Password. Chi tiết: " + e.getMessage());
            return;
        }

        HttpSession session = request.getSession();
        session.setAttribute("registerOtp", otp);
        session.setAttribute("registerOtpExpires", System.currentTimeMillis() + OTP_EXPIRE_MILLIS);
        session.setAttribute("pendingUsername", username);
        session.setAttribute("pendingPassword", password);
        session.setAttribute("pendingEmail", email);
        session.setAttribute("pendingFullname", fullname);
        session.setAttribute("pendingPhone", phone);
        session.setAttribute("pendingStudentId", studentId);

        response.sendRedirect(request.getContextPath() + "/verify-otp");
    }

    private void showError(HttpServletRequest request, HttpServletResponse response, String message)
            throws ServletException, IOException {
        request.setAttribute("error", message);
        request.getRequestDispatcher("/views/register.jsp").forward(request, response);
    }

    private static String trim(String value) {
        return value == null ? null : value.trim();
    }

    private static boolean isBlank(String value) {
        return value == null || value.isBlank();
    }
}
