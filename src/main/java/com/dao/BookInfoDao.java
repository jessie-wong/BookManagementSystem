package com.dao;

import com.entity.BookInfo;
import org.apache.ibatis.annotations.Param;

import java.awt.print.Book;
import java.util.List;

public interface BookInfoDao {
    //查看所有书籍
    List<BookInfo> selectBookInfo();
    //根据书籍ID更新书籍信息
    int updateBookInfoById(@Param("book_info") BookInfo book_info);
    //增加书籍
    int insertBook(@Param("book_info") BookInfo book_info);
    //删除书籍
    int deleteBookById(long id);

    BookInfo selectBookInfoById(long id);
    List<BookInfo> selectBookInfoByName(String bookname);
    List<BookInfo> selectBookInfoByType(String type);
}
