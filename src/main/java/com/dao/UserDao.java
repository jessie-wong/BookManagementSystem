package com.dao;

import com.entity.Rooter;
import com.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDao {
    //查找用户信息
    User selectUserByName(String name);

    User selectUserByNameWithBook(String name);

    //更新信息
    int updateUserInfo(@Param("user") User user, @Param("name") String name);

    //更新可借阅天数
    int updateUserDay(@Param("day")int day,@Param("name") String name);

    //添加用户
    int addUser(@Param("user") User user);

    //查看用户信息
    List<User> showUsers();
}
