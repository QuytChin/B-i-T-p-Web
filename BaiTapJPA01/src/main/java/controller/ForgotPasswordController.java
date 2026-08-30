package controller;

import java.io.IOException;

import entity.User;
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

@WebServlet("/forgot-password")
public class ForgotPasswordController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final long OTP_EXPIRE_MILLIS = 5 * 60 * 1000L;
    private final UserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/views/forgot-password.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String email = request.getParameter("email");
        email = email == null ? "" : email.trim();

        User user = userService.findByEmail(email);
        if (user == null) {
            request.setAttribute("error", "Không tìm thấy tài khoản sử dụng email này.");
            request.getRequestDispatcher("/views/forgot-password.jsp").forward(request, response);
            return;
        }

        String otp = OtpUtil.generateOtp();
        try {
            MailUtil.sendOtp(email, "OTP đặt lại mật khẩu", otp);
        } catch (Exception e) {
            request.setAttribute("error",
                    "Không gửi được OTP. Kiểm tra cấu hình Gmail/App Password. Chi tiết: " + e.getMessage());
            request.getRequestDispatcher("/views/forgot-password.jsp").forward(request, response);
            return;
        }

        HttpSession session = request.getSession();
        session.setAttribute("resetEmail", email);
        session.setAttribute("resetOtp", otp);
        session.setAttribute("resetOtpExpires", System.currentTimeMillis() + OTP_EXPIRE_MILLIS);
        response.sendRedirect(request.getContextPath() + "/reset-password");
    }
}
