package kr.green.soccerstat.vo;

public class FileVO {

	private int num;//첨부파일 번호 : 자동 증가
	private int board;//게시글 번호
	private String name;//파일 경로 및 이름
	private String state;//파일 상태(I:게시, D:삭제)
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getBoard() {
		return board;
	}
	public void setBoard(int board) {
		this.board = board;
	}
	public String getName() {
		return name;
	}
	public String getFileName() {
		if(name == null)
			return "";
		int index = name.indexOf("_");
		return name.substring(index+1);
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
}
