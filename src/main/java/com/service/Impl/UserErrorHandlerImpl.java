package com.service.Impl;

import com.service.ErrorHandler;
import org.springframework.stereotype.Component;

@Component("userErrorHandler")
public class UserErrorHandlerImpl implements ErrorHandler {
    public String transferCode(int code) {
        String result= "";
        switch(code){
            case -1:
                result = "用户名重复！";break;
            case 0:
                result = "添加失败！";break;
            case 1:
                result = "添加成功！";break;
        }
        return result;
    }
}
