package dao;

import entity.User;

public interface UserDao {
    void insert(User user);
    void update(User user);
    User get(String username);
    User getByEmail(String email);
    boolean checkExistEmail(String email);
    boolean checkExistUsername(String username);
    boolean checkExistPhone(String phone);
}
