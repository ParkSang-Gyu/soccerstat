package kr.green.soccerstat.vo;

import java.util.Date;

public class BoardVO {

	private int listNo;
	private String title;
	private String contents;
	private String id;
	private String writer;
	private Date bDate;
	private int view;
	private int recCnt;
	private int replyNo;
	private String rId;
	private String rWriter;
	private Date rDate;
	private String reply;
	public int getListNo() {
		return listNo;
	}
	public void setListNo(int listNo) {
		this.listNo = listNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getbDate() {
		return bDate;
	}
	public void setbDate(Date bDate) {
		this.bDate = bDate;
	}
	public int getView() {
		return view;
	}
	public void setView(int view) {
		this.view = view;
	}
	public int getRecCnt() {
		return recCnt;
	}
	public void setRecCnt(int recCnt) {
		this.recCnt = recCnt;
	}
	public int getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}
	public String getrId() {
		return rId;
	}
	public void setrId(String rId) {
		this.rId = rId;
	}
	public String getrWriter() {
		return rWriter;
	}
	public void setrWriter(String rWriter) {
		this.rWriter = rWriter;
	}
	public Date getrDate() {
		return rDate;
	}
	public void setrDate(Date rDate) {
		this.rDate = rDate;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	
	@Override
	public String toString() {
		return "BoardVO [listNo=" + listNo + ", title=" + title + ", contents=" + contents + ", id=" + id + ", writer="
				+ writer + ", bDate=" + bDate + ", view=" + view + ", recCnt=" + recCnt + ", replyNo=" + replyNo
				+ ", rId=" + rId + ", rWriter=" + rWriter + ", rDate=" + rDate + ", reply=" + reply + "]";
	}
	
}
