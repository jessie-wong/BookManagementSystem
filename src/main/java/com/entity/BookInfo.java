package com.entity;

public class BookInfo {
    private long book_id;
    private String book_name;
    private int number;
    private String type;
    private String press;
    private String author;

    public BookInfo() {
    }

    public long getBook_id() {
        return book_id;
    }

    public void setBook_id(long book_id) {
        this.book_id = book_id;
    }

    public String getBook_name() {
        return book_name;
    }

    public void setBook_name(String book_name) {
        this.book_name = book_name;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getPress() {
        return press;
    }

    public void setPress(String press) {
        this.press = press;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public BookInfo(long book_id, String book_name, int number, String type, String press, String author) {
        this.book_id = book_id;
        this.book_name = book_name;
        this.number = number;
        this.type = type;
        this.press = press;
        this.author = author;
    }
}
