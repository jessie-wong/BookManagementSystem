package com.service;

import com.entity.BookInfo;

import java.util.List;

public interface BookService {
    //查看所有书籍
    List<BookInfo> selectBookInfo();
    //根据书籍ID更新书籍信息
    int updateBookInfoById(BookInfo book_info);
    //增加书籍
    String insertBook(BookInfo bookInfo);
    //删除书籍
    int deleteBookById(long id);

    BookInfo selectBookInfoById(long id);

    List<BookInfo> selectBookInfoByName(String bookname);

    List<BookInfo> selectBookInfoByType(String type);
}
