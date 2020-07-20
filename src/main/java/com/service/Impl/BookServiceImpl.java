package com.service.Impl;

import com.dao.BookInfoDao;
import com.entity.BookInfo;
import com.service.BookService;
import com.service.ErrorHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookServiceImpl implements BookService {
    @Autowired
    private BookInfoDao bookInfoDao;
    @Autowired
    @Qualifier("bookErrorHandler")
    private ErrorHandler errorHandler;

    public List<BookInfo> selectBookInfo() {
        return bookInfoDao.selectBookInfo();
    }

    public int updateBookInfoById(BookInfo book_info) {
        return bookInfoDao.updateBookInfoById(book_info);
    }

    public String insertBook(BookInfo bookInfo) {
        return errorHandler.transferCode(bookInfoDao.insertBook(bookInfo));
    }

    public int deleteBookById(long id) {
        return bookInfoDao.deleteBookById(id);
    }

    public BookInfo selectBookInfoById(long id){
        return bookInfoDao.selectBookInfoById(id);
    }

    public List<BookInfo> selectBookInfoByName(String bookname){
        return bookInfoDao.selectBookInfoByName(bookname);
    }

    public List<BookInfo> selectBookInfoByType(String type) {
        return bookInfoDao.selectBookInfoByType(type);
    }
}
