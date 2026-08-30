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

@WebServlet("/reset-password")
public class ResetPasswordController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final UserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("resetOtp") == null) {
            response.sendRedirect(request.getContextPath() + "/forgot-password");
            return;
        }
        request.setAttribute("email", session.getAttribute("resetEmail"));
        request.getRequestDispatcher("/views/reset-password.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("resetOtp") == null) {
            response.sendRedirect(request.getContextPath() + "/forgot-password");
            return;
        }

        String otp = request.getParameter("otp");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String expectedOtp = (String) session.getAttribute("resetOtp");
        String email = (String) session.getAttribute("resetEmail");
        Long expires = (Long) session.getAttribute("resetOtpExpires");

        if (expires == null || System.currentTimeMillis() > expires) {
            showError(request, response, email, "OTP đã hết hạn. Vui lòng gửi yêu cầu mới.");
            return;
        }
        if (otp == null || !expectedOtp.equals(otp.trim())) {
            showError(request, response, email, "Mã OTP không đúng.");
            return;
        }
        if (password == null || password.isBlank() || !password.equals(confirmPassword)) {
            showError(request, response, email, "Mật khẩu mới và mật khẩu xác nhận không khớp.");
            return;
        }

        boolean success = userService.resetPassword(email, password);
        if (!success) {
            showError(request, response, email, "Không thể cập nhật mật khẩu.");
            return;
        }

        session.removeAttribute("resetEmail");
        session.removeAttribute("resetOtp");
        session.removeAttribute("resetOtpExpires");
        request.setAttribute("success", "Đổi mật khẩu thành công. Hãy đăng nhập bằng mật khẩu mới.");
        request.getRequestDispatcher("/views/login.jsp").forward(request, response);
    }

    private void showError(HttpServletRequest request, HttpServletResponse response,
            String email, String message) throws ServletException, IOException {
        request.setAttribute("email", email);
        request.setAttribute("error", message);
        request.getRequestDispatcher("/views/reset-password.jsp").forward(request, response);
    }
}
