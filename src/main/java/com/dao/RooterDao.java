package com.dao;

import com.entity.Rooter;
import org.apache.ibatis.annotations.Param;

public interface RooterDao {
    //查找管理员信息
    Rooter selectRooterByName(String name);
    //更新信息
    int updateRooterInfo(@Param("rooter") Rooter rooter,@Param("name") String name);
}
