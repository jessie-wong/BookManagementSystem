package com.service.Impl;

import com.dao.BookBorrowingStatusDao;
import com.dao.BookInfoDao;
import com.entity.BookBorrowingStatus;
import com.entity.BookInfo;
import com.service.BookBorrowingStatusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class BookBorrowingStatusServiceImpl implements BookBorrowingStatusService {
    @Autowired
    BookBorrowingStatusDao bookBorrowingStatusDao;
    @Autowired
    BookInfoDao bookInfoDao;

    public List<BookBorrowingStatus> queryBorrowingInfo() {
        return bookBorrowingStatusDao.queryBorrowingInfo();
    }

    public BookBorrowingStatus queryBorrowingInfoByBook(long bookid) {
        return bookBorrowingStatusDao.queryBorrowingInfoByBook(bookid);
    }

    public List<BookBorrowingStatus> queryBorrowingInfoByUser(String username) {
        return bookBorrowingStatusDao.queryBorrowingInfoByUser(username);
    }

    @Transactional
    public int borrowingBook(String username, long book_id, String status) {
        int number = bookInfoDao.selectBookInfoById(book_id).getNumber();
        if(number > 0){
            //取消预约
            bookBorrowingStatusDao.returnBook(username,book_id);
            //借书
            return bookBorrowingStatusDao.borrowingBook(username,book_id,status);
        }else{
            return -1;
        }
    }
    @Transactional
    public int returnBook(String user_name, long book_id) {
        return bookBorrowingStatusDao.returnBook(user_name,book_id);
    }

    public BookBorrowingStatus queryByBookIdAndName(long bookId, String userName) {
        return bookBorrowingStatusDao.queryByBookIdAndName(bookId,userName);
    }
}
