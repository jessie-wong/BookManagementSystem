package com.entity;

import com.util.DateUtil;

import java.awt.print.Book;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class User {
    private String user_name;
    private String user_password;
    private String phone_number;
    private int day;
    private int overdue = 0;
    private List<BookBorrowingStatus> bookList;
    public User() {
    }

    public User(String user_name, String user_password, String phone_number, int day, int overdue) {
        this.user_name = user_name;
        this.user_password = user_password;
        this.phone_number = phone_number;
        this.day = day;
        this.overdue = overdue;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_password() {
        return user_password;
    }

    public void setUser_password(String user_password) {
        this.user_password = user_password;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public int getDay() {
        return day;
    }

    public void setDay(int day) {
        this.day = day;
    }

    public int getOverdue() {
        return overdue;
    }

    public void setOverdue(int overdue) {
        this.overdue = overdue;
    }

    public List<BookBorrowingStatus> getBookList() {
        return bookList;
    }

    public void setBookList(List<BookBorrowingStatus> bookList) {
        this.bookList = bookList;
    }

    @Override
    public String toString() {
        return "User{" +
                "user_name='" + user_name + '\'' +
                ", user_password='" + user_password + '\'' +
                ", phone_number='" + phone_number + '\'' +
                ", day=" + day +
                ", overdue=" + overdue +
                ",booklist="+bookList+
                '}';
    }

    public void updateOverDue() {
        if(this != null){
            int over = 0;
            for(BookBorrowingStatus status : bookList){
                Date date = new Date(); // this object contains the current date value
                SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
                int diff = DateUtil.daysBetween(status.getAppoint_time(), formatter.format(date));
                if(diff > day) {
                    over++;
                    status.setBook_state("已逾期");
                }
            }
            this.overdue = over;
        }
    }
}
