package service.impl;

import java.sql.Date;

import dao.UserDao;
import dao.impl.UserDaoImpl;
import entity.User;
import service.UserService;

public class UserServiceImpl implements UserService {

    private final UserDao userDao =
            new UserDaoImpl();

    @Override
    public User login(
            String username,
            String password) {

        User user =
                userDao.get(username);

        if (user != null
                && password.equals(user.getPassword())) {

            return user;
        }

        return null;
    }

    @Override
    public boolean register(
            String username,
            String password,
            String email,
            String fullname,
            String phone,
            String studentId) {

        if (userDao.checkExistUsername(username)) {
            return false;
        }

        Date date =
                new Date(System.currentTimeMillis());

        User user =
                new User(
                        email,
                        username,
                        fullname,
                        password,
                        null,

                        // Theo bài giảng: tài khoản mới role = 5
                        5,

                        phone,
                        studentId,
                        date);

        userDao.insert(user);

        return true;
    }

    @Override
    public boolean checkExistEmail(String email) {
        return userDao.checkExistEmail(email);
    }

    @Override
    public boolean checkExistUsername(String username) {
        return userDao.checkExistUsername(username);
    }

    @Override
    public boolean checkExistPhone(String phone) {
        return userDao.checkExistPhone(phone);
    }
}