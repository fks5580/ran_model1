package replyboard;

import java.sql.Timestamp;

public class replyboardBean {
    private int reply_no;
    private int no;
    private String reply_writer;
    private String reply_pw;
    private Timestamp reply_date;
    private String reply_content;
	public int getReply_no() {
        return reply_no;
    }
    public void setReply_no(int reply_no) {
        this.reply_no = reply_no;
    }
    public int getNo() {
        return no;
    }
    public void setNo(int no) {
        this.no = no;
    }
    public String getReply_writer() {
        return reply_writer;
    }
    public void setReply_writer(String reply_writer) {
        this.reply_writer = reply_writer;
    }
    public Timestamp getReply_date() {
        return reply_date;
    }
    public void setReply_date(Timestamp reply_date) {
        this.reply_date = reply_date;
    }
    public String getReply_content() {
        return reply_content;
    }
    public void setReply_content(String reply_content) {
        this.reply_content = reply_content;
    }
    public String getReply_pw() {
        return reply_pw;
    }
    public void setReply_pw(String reply_pw) {
        this.reply_pw = reply_pw;
    }
            
                
}
