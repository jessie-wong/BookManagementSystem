package com.service.Impl;

import com.dao.UserDao;
import com.entity.User;
import com.service.ErrorHandler;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;
    @Autowired
    @Qualifier("userErrorHandler")
    private ErrorHandler errorHandler;

    public User getUserByName(String name) {
        return userDao.selectUserByName(name);
    }

    public User getUserByNameWithBook(String name) {
        User user = userDao.selectUserByNameWithBook(name);
        user.updateOverDue();
        userDao.updateUserInfo(user,user.getUser_name());
        return user;
    }

    public int updateUserInfo(User user, String name) {
        return userDao.updateUserInfo(user,name);
    }

    @Transactional
    public String addUser(User user) {
        int result = 0;
        if(user == null) return "用户为空！";
        User oldUser = userDao.selectUserByName(user.getUser_name());
        if(oldUser != null) result = -1;
        else result = userDao.addUser(user);
        return errorHandler.transferCode(result);
    }

    public int updateUserDay(int day, String name) {
        return userDao.updateUserDay(day,name);
    }

    public List<User> showUsers() {
        return userDao.showUsers();
    }
}
