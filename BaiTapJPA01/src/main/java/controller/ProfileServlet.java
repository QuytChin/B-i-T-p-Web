package controller;

import java.io.IOException;

import entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import service.UserService;
import service.impl.UserServiceImpl;
import util.UploadUtil;

@WebServlet("/profile")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 10
)
public class ProfileServlet extends HttpServlet {

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

        if (session == null
                || session.getAttribute("username") == null) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/login");

            return;
        }

        String username =
                (String) session.getAttribute("username");

        User user =
                userService.findByUsername(username);

        if (user == null) {

            session.invalidate();

            response.sendRedirect(
                    request.getContextPath()
                    + "/login");

            return;
        }

        request.setAttribute("user", user);

        Object message =
                session.getAttribute("profileMessage");

        if (message != null) {

            request.setAttribute(
                    "message",
                    message);

            session.removeAttribute(
                    "profileMessage");
        }

        request.getRequestDispatcher(
                "/views/profile.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        HttpSession session =
                request.getSession(false);

        if (session == null
                || session.getAttribute("username") == null) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/login");

            return;
        }

        String username =
                (String) session.getAttribute("username");

        String fullname =
                request.getParameter("fullname");

        String phone =
                request.getParameter("phone");

        if (fullname != null) {
            fullname = fullname.trim();
        }

        if (phone != null) {
            phone = phone.trim();
        }

        if (fullname == null
                || fullname.isBlank()) {

            session.setAttribute(
                    "profileMessage",
                    "Họ và tên không được để trống!");

            response.sendRedirect(
                    request.getContextPath()
                    + "/profile");

            return;
        }

        User user =
                userService.findByUsername(username);

        if (user == null) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/login");

            return;
        }

        String avatar = user.getAvatar();

        Part imagePart =
                request.getPart("images");

        if (imagePart != null
                && imagePart.getSize() > 0) {

            String contentType =
                    imagePart.getContentType();

            if (contentType == null
                    || !contentType.startsWith("image/")) {

                session.setAttribute(
                        "profileMessage",
                        "File upload phải là hình ảnh!");

                response.sendRedirect(
                        request.getContextPath()
                        + "/profile");

                return;
            }

            String newAvatar =
                    UploadUtil.saveImage(
                            imagePart,
                            "user");

            if (newAvatar != null) {
                avatar = newAvatar;
            }
        }

        boolean success =
                userService.updateProfile(
                        username,
                        fullname,
                        phone,
                        avatar);

        if (success) {

            session.setAttribute(
                    "fullname",
                    fullname);

            session.setAttribute(
                    "phone",
                    phone);

            session.setAttribute(
                    "avatar",
                    avatar);

            session.setAttribute(
                    "profileMessage",
                    "Cập nhật thông tin thành công!");

        } else {

            session.setAttribute(
                    "profileMessage",
                    "Không thể cập nhật thông tin!");
        }

        response.sendRedirect(
                request.getContextPath()
                + "/profile");
    }
}