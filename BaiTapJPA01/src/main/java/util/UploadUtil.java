package util;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;

import jakarta.servlet.http.Part;

public final class UploadUtil {

    private UploadUtil() {
    }

    public static String saveImage(Part part, String folder) throws IOException {
        if (part == null || part.getSize() <= 0) {
            return null;
        }

        String submittedName = part.getSubmittedFileName();
        if (submittedName == null || submittedName.isBlank()) {
            return null;
        }

        String originalName = Paths.get(submittedName).getFileName().toString();
        String extension = "";
        int dot = originalName.lastIndexOf('.');
        if (dot >= 0) {
            extension = originalName.substring(dot);
        }

        String fileName = System.currentTimeMillis() + "_" + Math.abs(originalName.hashCode()) + extension;
        Path uploadDir = Paths.get(Constants.UPLOAD_DIRECTORY, folder);
        File dir = uploadDir.toFile();
        if (!dir.exists()) {
            dir.mkdirs();
        }

        Path target = uploadDir.resolve(fileName);
        part.write(target.toString());

        return folder + "/" + fileName;
    }
}
