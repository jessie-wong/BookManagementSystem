package com.service;

import com.entity.Rooter;
import org.apache.ibatis.annotations.Param;

public interface RooterService {
    //查找管理员信息
    Rooter getRooterInfoByName(String name);
    //更新信息
    int updateRooterInfo(Rooter rooter, String name);
}
