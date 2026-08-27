package service;

import entity.User;

public class LoginService {

    public boolean checkLogin(User user) {

        return "chienzumba".equals(user.getUsername())
                && "722006".equals(user.getPassword());
    }
}