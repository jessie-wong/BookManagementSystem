package com.web;

import com.dao.RooterDao;
import com.dao.UserDao;
import com.entity.Rooter;
import com.entity.User;
import com.service.RooterService;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpSession;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

@Controller
@RequestMapping("/")
public class LoginController {
    @Autowired
    private UserService userService;
    @Autowired
    private RooterService rooterService;
    @RequestMapping(method = GET)
    public String index(){
        return "redirect:login";
    }

    @RequestMapping(value = "login",method = GET)
    public String login1(){
        return "login";
    }

    @RequestMapping(value="login")
    @ResponseBody
    public int login2(String name,String password,String type,HttpSession session){
        if(type.equals("user")){
            User user = userService.getUserByName(name);
            if(user == null || !user.getUser_password().equals(password)){
                return 3;
            }else{
                session.setAttribute("user",name);
                return 0;
            }
        }else {
            Rooter rooter = rooterService.getRooterInfoByName(name);
            if (rooter == null || !rooter.getAdmin_password().equals(password)) {
                return 3;
            } else {
                session.setAttribute("rooter", name);
                return 1;
            }
        }
    }
}
