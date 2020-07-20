package com.service;

import com.entity.BookBorrowingStatus;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BookBorrowingStatusService {
    //查看借阅情况
    List<BookBorrowingStatus> queryBorrowingInfo();
    //查看某书籍的借阅情况
    BookBorrowingStatus queryBorrowingInfoByBook(long bookid);
    //查看某用户的借阅情况
    List<BookBorrowingStatus> queryBorrowingInfoByUser(String username);
    //用户借阅书籍
    int borrowingBook(String username, long book_id, String status);
    //用户还书
    int returnBook(String user_name, long book_id);
    BookBorrowingStatus queryByBookIdAndName(long bookId,String userName);
}
