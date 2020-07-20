package com.dao;

import com.entity.BookBorrowingStatus;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BookBorrowingStatusDao {
    //查看借阅情况
    List<BookBorrowingStatus> queryBorrowingInfo();
    //查看某书籍的借阅情况
    BookBorrowingStatus queryBorrowingInfoByBook(long bookid);
    //查看某用户的借阅情况
    List<BookBorrowingStatus> queryBorrowingInfoByUser(String username);
    //用户借阅书籍
    int borrowingBook(@Param("username") String username,@Param("book_id") long book_id,@Param("status") String status);
    //用户还书
    int returnBook(@Param("user_name") String user_name, @Param("book_id") long book_id);

    BookBorrowingStatus queryByBookIdAndName(@Param("bookId") long bookId,@Param("userName") String userName);
}
