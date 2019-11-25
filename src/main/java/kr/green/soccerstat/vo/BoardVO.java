package kr.green.soccerstat.vo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class BoardVO {

	private int num;
	private String title;
	private String contents;
	private String writer;
	private Date registered;
	private String file;
	private int views;
	private String valid;
	
	
	public String getValid() {
		return valid;
	}
	public void setValid(String valid) {
		this.valid = valid;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
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
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
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
	public String getFile(){
		return file;
	}
	public String getFileName() {
		//UUID가 제거되도록 코드를 작성
		//c52c5637-b875-41fe-a1ed-d24cf6caad2c_다운로드.jpg
		//=>다운로드.jpg
		if(file == null)
			return "";
		int index = file.indexOf("_");
		return file.substring(index+1);
	}
	public void setFile(String file) {
		this.file = file;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	@Override
	public String toString() {
		return "BoardVO [num=" + num + ", title=" + title + ", contents=" + contents + ", writer=" + writer
				+ ", registered=" + registered + ", file=" + file + ", views=" + views + ", valid=" + valid + "]";
	}
	
	
	
}
