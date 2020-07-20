package com.service.Impl;

import com.dao.RooterDao;
import com.entity.Rooter;
import com.service.RooterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

@Service
public class RooterServiceImpl implements RooterService {
    @Autowired
    private RooterDao rooterDao;

    public Rooter getRooterInfoByName(String name) {
        return rooterDao.selectRooterByName(name);
    }

    public int updateRooterInfo(Rooter rooter, String name) {
        return rooterDao.updateRooterInfo(rooter,name);
    }
}
