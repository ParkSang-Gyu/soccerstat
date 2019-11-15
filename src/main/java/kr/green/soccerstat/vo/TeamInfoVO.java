package kr.green.soccerstat.vo;

public class TeamInfoVO {

	private String team;
	private String league;
	private String coach;
	private String stadium;
	private String hometown;
	private int est;
	private String season1819;
	private String season1920;
	public String getTeam() {
		return team;
	}
	public void setTeam(String team) {
		this.team = team;
	}
	public String getLeague() {
		return league;
	}
	public void setLeague(String league) {
		this.league = league;
	}
	public String getCoach() {
		return coach;
	}
	public void setCoach(String coach) {
		this.coach = coach;
	}
	public String getStadium() {
		return stadium;
	}
	public void setStadium(String stadium) {
		this.stadium = stadium;
	}
	public String getHometown() {
		return hometown;
	}
	public void setHometown(String hometown) {
		this.hometown = hometown;
	}
	public int getEst() {
		return est;
	}
	public void setEst(int est) {
		this.est = est;
	}
	public String getSeason1819() {
		return season1819;
	}
	public void setSeason1819(String season1819) {
		this.season1819 = season1819;
	}
	public String getSeason1920() {
		return season1920;
	}
	public void setSeason1920(String season1920) {
		this.season1920 = season1920;
	}
	@Override
	public String toString() {
		return "TeamInfoVO [team=" + team + ", league=" + league + ", coach=" + coach + ", stadium=" + stadium
				+ ", hometown=" + hometown + ", est=" + est + ", season1819=" + season1819 + ", season1920="
				+ season1920 + "]";
	}
	
	
}
