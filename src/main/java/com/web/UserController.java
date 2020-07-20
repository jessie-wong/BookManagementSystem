package com.web;

import com.entity.User;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;


@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping(method = RequestMethod.GET)
    public String user(){
        return "redirect:/book";
    }


    @RequestMapping(value = "info",method = RequestMethod.GET)
    public String showUser(HttpSession session, Model model){
        String username = (String)session.getAttribute("user");
        User user = userService.getUserByNameWithBook(username);
        model.addAttribute("userinfo",user);
        return "userInfo";
    }

    @RequestMapping(value = "logout",method = RequestMethod.GET)
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/login";
    }
}
