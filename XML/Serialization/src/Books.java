/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author admin
 */
public class Books {
    private String bookTitle;
    private String authorName;
    private String pubDate;

    public Books(String bookTitle, String authorName, String pubDate) {
        this.bookTitle = bookTitle;
        this.authorName = authorName;
        this.pubDate = pubDate;
    }

    public Books(){
    }
    
    public String getBookTitle() {
        return bookTitle;
    }

    public String getAuthorName() {
        return authorName;
    }

    public String getPubDate() {
        return pubDate;
    }

    public void setBookTitle(String bookTitle) {
        this.bookTitle = bookTitle;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }

    public void setPubDate(String pubDate) {
        this.pubDate = pubDate;
    }
    
    
}
