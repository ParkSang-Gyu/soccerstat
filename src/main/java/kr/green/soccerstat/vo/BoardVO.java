package kr.green.soccerstat.vo;

public class BoardVO {

	private int listNo;
	private String title;
	private String penName;
	private String day;
	private int count;
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
	public String getPenName() {
		return penName;
	}
	public void setPenName(String penName) {
		this.penName = penName;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "BoardVO [listNo=" + listNo + ", title=" + title + ", penName=" + penName + ", day=" + day + ", count="
				+ count + "]";
	}
	
	
}
