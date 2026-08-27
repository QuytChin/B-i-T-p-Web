package dao;

import entity.User;

public interface UserDao {

    void insert(User user);

    User get(String username);

    boolean checkExistEmail(String email);

    boolean checkExistUsername(String username);

    boolean checkExistPhone(String phone);
}