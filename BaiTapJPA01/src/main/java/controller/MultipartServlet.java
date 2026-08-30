package controller;

import static util.Constants.UPLOAD_DIRECTORY;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import util.Constants;

@WebServlet(name = "MultiPartServlet", urlPatterns = { "/multiPartServlet" })
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 5 * 5)
public class MultipartServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private String getFileName(Part part) {
        String submitted = part.getSubmittedFileName();
        if (submitted != null && !submitted.isBlank()) {
            return new File(submitted).getName();
        }
        return Constants.DEFAULT_FILENAME;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String uploadPath = UPLOAD_DIRECTORY;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        try {
            Part part = request.getPart("multiPartServlet");
            String fileName = getFileName(part);
            part.write(uploadPath + File.separator + fileName);
            request.setAttribute("message", "File " + fileName + " has uploaded successfully!");
        } catch (FileNotFoundException fne) {
            request.setAttribute("message", "There was an error: " + fne.getMessage());
        }

        getServletContext().getRequestDispatcher("/views/result.jsp").forward(request, response);
    }
}
