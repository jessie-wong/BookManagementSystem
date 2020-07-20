package com.web;

import com.entity.BookInfo;
import com.entity.User;
import com.service.BookService;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import java.awt.*;
import java.awt.print.Book;

@Controller
@RequestMapping("/rooter")
public class RooterController {
    @Autowired
    private UserService userService;
    @Autowired
    private BookService bookService;

    @RequestMapping(method = RequestMethod.GET)
    public String showRooter(){
        return "redirect:/rooter/addUser";
    }

    @RequestMapping(value = "addUser",method = RequestMethod.GET)
    public String addUser(){
        return "addUser";
    }

    @RequestMapping(value = "addUser",method = RequestMethod.POST)
    public String addUser(User user,Model model){
        model.addAttribute("error",userService.addUser(user));
        return "addUser";
    }

    @RequestMapping(value = "updateUser",method = RequestMethod.GET)
    public String showUsers(Model model){
        try {
            model.addAttribute("users", userService.showUsers());
        }catch (Exception e){
            e.printStackTrace();
        }
        return "updateUser";
    }

    @ResponseBody
    @RequestMapping(value = "updateUser",method = RequestMethod.POST)
    public int updateUser(String newDay,String username){
        return userService.updateUserDay(Integer.parseInt(newDay),username);
    }

    @RequestMapping(value = "addBook",method = RequestMethod.GET)
    public String addBook(){
        return "addBook";
    }

    @RequestMapping(value = "addBook",method = RequestMethod.POST)
    public String addBook(BookInfo bookInfo,Model model){
        model.addAttribute("error",bookService.insertBook(bookInfo));
        return "addBook";
    }

    @RequestMapping(value = "updateBook",method = RequestMethod.GET)
    public String updateBook(Model model){
        model.addAttribute("books",bookService.selectBookInfo());
        return "updateBook";
    }

    @ResponseBody
    @RequestMapping(value = "updateBook",method = RequestMethod.POST)
    public BookInfo updateBook(BookInfo book,Model model){
        try {
            bookService.updateBookInfoById(book);
            model.addAttribute("books", bookService.selectBookInfo());
        }catch (Exception e){
            e.printStackTrace();
        }
        return bookService.selectBookInfoById(book.getBook_id());
    }
}
