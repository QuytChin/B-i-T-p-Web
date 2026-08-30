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

@WebServlet("/verify-otp")
public class VerifyOtpController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final UserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("registerOtp") == null) {
            response.sendRedirect(request.getContextPath() + "/register");
            return;
        }
        request.setAttribute("email", session.getAttribute("pendingEmail"));
        request.getRequestDispatcher("/views/verify-otp.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("registerOtp") == null) {
            response.sendRedirect(request.getContextPath() + "/register");
            return;
        }

        String enteredOtp = request.getParameter("otp");
        String expectedOtp = (String) session.getAttribute("registerOtp");
        Long expires = (Long) session.getAttribute("registerOtpExpires");

        if (expires == null || System.currentTimeMillis() > expires) {
            request.setAttribute("error", "OTP đã hết hạn. Vui lòng đăng ký lại để nhận OTP mới.");
            request.getRequestDispatcher("/views/verify-otp.jsp").forward(request, response);
            return;
        }
        if (enteredOtp == null || !expectedOtp.equals(enteredOtp.trim())) {
            request.setAttribute("error", "Mã OTP không đúng.");
            request.setAttribute("email", session.getAttribute("pendingEmail"));
            request.getRequestDispatcher("/views/verify-otp.jsp").forward(request, response);
            return;
        }

        boolean success = userService.register(
                (String) session.getAttribute("pendingUsername"),
                (String) session.getAttribute("pendingPassword"),
                (String) session.getAttribute("pendingEmail"),
                (String) session.getAttribute("pendingFullname"),
                (String) session.getAttribute("pendingPhone"),
                (String) session.getAttribute("pendingStudentId"));

        clearPending(session);

        if (success) {
            request.setAttribute("success", "Kích hoạt tài khoản thành công. Bạn có thể đăng nhập.");
            request.getRequestDispatcher("/views/login.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Không thể tạo tài khoản. Username hoặc email có thể đã tồn tại.");
            request.getRequestDispatcher("/views/register.jsp").forward(request, response);
        }
    }

    private void clearPending(HttpSession session) {
        session.removeAttribute("registerOtp");
        session.removeAttribute("registerOtpExpires");
        session.removeAttribute("pendingUsername");
        session.removeAttribute("pendingPassword");
        session.removeAttribute("pendingEmail");
        session.removeAttribute("pendingFullname");
        session.removeAttribute("pendingPhone");
        session.removeAttribute("pendingStudentId");
    }
}
