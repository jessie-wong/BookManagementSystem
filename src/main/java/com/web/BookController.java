package com.web;

import com.entity.BookBorrowingStatus;
import com.entity.BookInfo;
import com.service.BookBorrowingStatusService;
import com.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.awt.print.Book;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/book")
public class BookController {
    @Autowired
    private BookService bookService;
    @Autowired
    private BookBorrowingStatusService bookBorrowingStatusService;

    @RequestMapping(method = RequestMethod.GET)
    public String borrowing(Model model){
        List<BookInfo> books = bookService.selectBookInfo();
        model.addAttribute("books",books);
        return "borrowBook";
    }
    @RequestMapping(value = "findBook",method = RequestMethod.POST)
    public String find(String type, String searchContent1,String searchContent2,Model model) {
        List<BookInfo> books = new ArrayList<BookInfo>();
        try{
            if (type.equals("book_id")) {
                books.add(bookService.selectBookInfoById(Long.parseLong(searchContent2)));
            } else if (type.equals("book_name")) {
                books = bookService.selectBookInfoByName(searchContent2);
            } else if(type.equals("book_type")){
                books = bookService.selectBookInfoByType(searchContent1);
            }else{
                books = bookService.selectBookInfo();
            }
        } catch (Exception e) {
            books = bookService.selectBookInfo();
            model.addAttribute("error", "输入错误！");
        }
        model.addAttribute("books",books);
        return "borrowBook";
    }

    @ResponseBody
    @RequestMapping(value = "borrowing",method = RequestMethod.POST)
    public int borrowBook(String book_id, HttpSession session){
        String username = (String)session.getAttribute("user");
        try {
            BookBorrowingStatus bookBorrowingStatus = bookBorrowingStatusService.queryByBookIdAndName(Long.parseLong(book_id), username);
            if(bookBorrowingStatus != null && bookBorrowingStatus.getBook_state().equals("0")){
                return 1;
            }else {
                int result = bookBorrowingStatusService.borrowingBook(username, Long.parseLong(book_id), "0");
                return 0;
            }
        }catch (Exception e) {
            e.printStackTrace();
            return 2;
        }
    }
    @ResponseBody
    @RequestMapping(value = "reserve",method = RequestMethod.POST)
    public int reservBook(String book_id, HttpSession session){
        String username = (String)session.getAttribute("user");
        try {
            BookBorrowingStatus bookBorrowingStatus = bookBorrowingStatusService.queryByBookIdAndName(Long.parseLong(book_id), username);
            if(bookBorrowingStatus != null){
                return 1;
            }else {
                bookBorrowingStatusService.borrowingBook(username, Long.parseLong(book_id), "1");
                return 0;
            }
        }catch (Exception e) {
            e.printStackTrace();
            return 2;
        }
    }

    @RequestMapping(value = "returnBook",method = RequestMethod.GET)
    public String returnBook(HttpSession session,Model model) {
        String username = (String)session.getAttribute("user");
        List<BookBorrowingStatus> bookBorrow = bookBorrowingStatusService.queryBorrowingInfoByUser(username);
        model.addAttribute("books",bookBorrow);
        return "returnBook";
    }

    @ResponseBody
    @RequestMapping(value = "returnBook",method = RequestMethod.POST)
    public int returnBook(String book_id,HttpSession session){
        String username = (String)session.getAttribute("user");
        try {
            bookBorrowingStatusService.returnBook(username, Long.parseLong(book_id));
            return 0;
        }catch (Exception e) {
            e.printStackTrace();
            return 2;
        }
    }
}
