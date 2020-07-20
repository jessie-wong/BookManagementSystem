package com.entity;

public class BookBorrowingStatus {
    private long book_id;
    private String user_name;
    private String appoint_time;
    private String book_state;
    private BookInfo bookInfo;

    public BookBorrowingStatus() {
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public long getBook_id() {
        return book_id;
    }

    public void setBook_id(long book_id) {
        this.book_id = book_id;
    }

    public String getAppoint_time() {
        return appoint_time;
    }

    public void setAppoint_time(String appoint_time) {
        this.appoint_time = appoint_time;
    }

    public String getBook_state() {
        return book_state;
    }

    public void setBook_state(String book_state) {
        this.book_state = book_state;
    }

    public BookInfo getBookInfo() {
        return bookInfo;
    }

    public void setBookInfo(BookInfo bookInfo) {
        this.bookInfo = bookInfo;
    }

    public BookBorrowingStatus(long book_id, String user_name, String appoint_time, String book_state) {
        this.book_id = book_id;
        this.user_name = user_name;
        this.appoint_time = appoint_time;
        this.book_state = book_state;
    }

    @Override
    public String toString() {
        return "BookBorrowingStatus{" +
                "book_id=" + book_id +
                ", user_name='" + user_name + '\'' +
                ", appoint_time='" + appoint_time + '\'' +
                ", book_state='" + book_state + '\'' +
                ", bookInfo=" + bookInfo +
                '}';
    }
}
