package service;

import entity.User;

public interface UserService {

    User login(
            String username,
            String password);

    boolean register(
            String username,
            String password,
            String email,
            String fullname,
            String phone,
            String studentId);

    User findByEmail(
            String email);

    User findByUsername(
            String username);

    boolean updateProfile(
            String username,
            String fullname,
            String phone,
            String avatar);

    boolean resetPassword(
            String email,
            String newPassword);

    boolean checkExistEmail(
            String email);

    boolean checkExistUsername(
            String username);

    boolean checkExistPhone(
            String phone);
}