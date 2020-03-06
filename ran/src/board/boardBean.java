package board;

import java.sql.Timestamp;

public class boardBean {
	private int no;
	private String title;
	private String writer;
	private String writerpw;
	private String content;
	private Timestamp date;
	private int readcount;
	private int main_seq;
	private int sub_seq;
	private int main_tab;
	
	
	public int getMain_seq() {
		return main_seq;
	}
	public void setMain_seq(int main_seq) {
		this.main_seq = main_seq;
	}
	public int getSub_seq() {
		return sub_seq;
	}
	public void setSub_seq(int sub_seq) {
		this.sub_seq = sub_seq;
	}
	public int getMain_tab() {
		return main_tab;
	}
	public void setMain_tab(int main_tab) {
		this.main_tab = main_tab;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getWriterpw() {
		return writerpw;
	}
	public void setWriterpw(String writerpw) {
		this.writerpw = writerpw;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	
	
}
