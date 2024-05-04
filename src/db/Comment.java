package db;

import java.sql.Timestamp;

public class Comment {
    private int id;
    private News news;

    private User user;

    private String content_comment;

    private Timestamp date;

    public Comment() {
    }

    public Comment(int id, News news, User user, String content_comment, Timestamp date) {
        this.id = id;
        this.news = news;
        this.user = user;
        this.content_comment = content_comment;
        this.date = date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public News getNews() {
        return news;
    }

    public void setNews(News news) {
        this.news = news;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getContent_comment() {
        return content_comment;
    }

    public void setContent_comment(String content_comment) {
        this.content_comment = content_comment;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }
}
