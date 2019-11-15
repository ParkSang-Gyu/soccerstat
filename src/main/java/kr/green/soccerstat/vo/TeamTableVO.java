package kr.green.soccerstat.vo;

public class TeamTableVO {

	private int teamNo;
	private String team;
	private String league;
	private String season;
	private int ranked;
	private int win;
	private int draw;
	private int lose;
	private int goalF;
	private int goalA;
	private int goalD;
	private int points;
	private int offside;
	private int corner;
	private int possession;
	private int shoot;
	private int shootOT;
	private double ps;
	private int yc;
	private int rc;
	private int foul;
	public int getTeamNo() {
		return teamNo;
	}
	public void setTeamNo(int teamNo) {
		this.teamNo = teamNo;
	}
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
	public String getSeason() {
		return season;
	}
	public void setSeason(String season) {
		this.season = season;
	}
	public int getRanked() {
		return ranked;
	}
	public void setRanked(int ranked) {
		this.ranked = ranked;
	}
	public int getWin() {
		return win;
	}
	public void setWin(int win) {
		this.win = win;
	}
	public int getDraw() {
		return draw;
	}
	public void setDraw(int draw) {
		this.draw = draw;
	}
	public int getLose() {
		return lose;
	}
	public void setLose(int lose) {
		this.lose = lose;
	}
	public int getGoalF() {
		return goalF;
	}
	public void setGoalF(int goalF) {
		this.goalF = goalF;
	}
	public int getGoalA() {
		return goalA;
	}
	public void setGoalA(int goalA) {
		this.goalA = goalA;
	}
	public int getGoalD() {
		return goalD;
	}
	public void setGoalD(int goalD) {
		this.goalD = goalD;
	}
	public int getPoints() {
		return points;
	}
	public void setPoints(int points) {
		this.points = points;
	}
	public int getOffside() {
		return offside;
	}
	public void setOffside(int offside) {
		this.offside = offside;
	}
	public int getCorner() {
		return corner;
	}
	public void setCorner(int corner) {
		this.corner = corner;
	}
	public int getPossession() {
		return possession;
	}
	public void setPossession(int possession) {
		this.possession = possession;
	}
	public int getShoot() {
		return shoot;
	}
	public void setShoot(int shoot) {
		this.shoot = shoot;
	}
	public int getShootOT() {
		return shootOT;
	}
	public void setShootOT(int shootOT) {
		this.shootOT = shootOT;
	}
	public double getPs() {
		return ps;
	}
	public void setPs(double ps) {
		this.ps = ps;
	}
	public int getYc() {
		return yc;
	}
	public void setYc(int yc) {
		this.yc = yc;
	}
	public int getRc() {
		return rc;
	}
	public void setRc(int rc) {
		this.rc = rc;
	}
	public int getFoul() {
		return foul;
	}
	public void setFoul(int foul) {
		this.foul = foul;
	}
	@Override
	public String toString() {
		return "TeamTableVO [teamNo=" + teamNo + ", team=" + team + ", league=" + league + ", season=" + season
				+ ", ranked=" + ranked + ", win=" + win + ", draw=" + draw + ", lose=" + lose + ", goalF=" + goalF
				+ ", goalA=" + goalA + ", goalD=" + goalD + ", points=" + points + ", offside=" + offside + ", corner="
				+ corner + ", possession=" + possession + ", shoot=" + shoot + ", shootOT=" + shootOT + ", ps=" + ps
				+ ", yc=" + yc + ", rc=" + rc + ", foul=" + foul + "]";
	}
	
	
}
