package com.service;

import com.entity.User;

import java.util.List;

public interface UserService {
    //查找用户信息
    User getUserByName(String name);

    //查找用户信息
    User getUserByNameWithBook(String name);

    //更新信息
    int updateUserInfo(User user, String name);

    //添加用户
    String addUser(User user);

    int updateUserDay(int day,String name);

    //查看用户信息
    List<User> showUsers();
}
