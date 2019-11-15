package kr.green.soccerstat.vo;

public class ScheduleVO {

	private int scheduleNo;
	private String league;
	private String season;
	private int round;
	private int year;
	private String date;
	private String time;
	private String status;
	private String home;
	private String score;
	private String away;
	private int homeG;
	private int awayG;
	public int getScheduleNo() {
		return scheduleNo;
	}
	public void setScheduleNo(int scheduleNo) {
		this.scheduleNo = scheduleNo;
	}
	public String getLeague() {
		return league;
	}
	public void setLeague(String league) {
		this.league = league;
	}
	public String getSeason() {
		return season;
	}
	public void setSeason(String season) {
		this.season = season;
	}
	public int getRound() {
		return round;
	}
	public void setRound(int round) {
		this.round = round;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getHome() {
		return home;
	}
	public void setHome(String home) {
		this.home = home;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public String getAway() {
		return away;
	}
	public void setAway(String away) {
		this.away = away;
	}
	public int getHomeG() {
		return homeG;
	}
	public void setHomeG(int homeG) {
		this.homeG = homeG;
	}
	public int getAwayG() {
		return awayG;
	}
	public void setAwayG(int awayG) {
		this.awayG = awayG;
	}
	@Override
	public String toString() {
		return "ScheduleVO [scheduleNo=" + scheduleNo + ", league=" + league + ", season=" + season + ", round=" + round
				+ ", year=" + year + ", date=" + date + ", time=" + time + ", status=" + status + ", home=" + home
				+ ", score=" + score + ", away=" + away + ", homeG=" + homeG + ", awayG=" + awayG + "]";
	}
	
	
}
