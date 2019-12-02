package kr.green.soccerstat.vo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ReplyVO {

	private int num;
	private int board_num;
	private String content;
	private String writer;
	private String id;
	private Date registered;
	private int recommend;
	private String valid;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getReplyNum() {
		return num;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRegistered() {
		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
		
		return f.format(registered);
	}
	public void setRegistered(Date registered) {
		this.registered = registered;
	}
	public void setRegistered(String registered) {
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");

		try {
			this.registered = transFormat.parse(registered);
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
	public int getRecommend() {
		return recommend;
	}
	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}
	public String getValid() {
		return valid;
	}
	public void setValid(String valid) {
		this.valid = valid;
	}
	
	@Override
	public String toString() {
		return "ReplyVO [num=" + num + ", board_num=" + board_num + ", content=" + content + ", writer=" + writer
				+ ", id=" + id + ", registered=" + registered + ", recommend=" + recommend + ", valid=" + valid + "]";
	}
	
	
}
