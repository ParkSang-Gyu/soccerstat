package kr.green.soccerstat.service;

import java.util.ArrayList;

import kr.green.soccerstat.vo.PlayerVO;
import kr.green.soccerstat.vo.ScheduleVO;
import kr.green.soccerstat.vo.TeamInfoVO;
import kr.green.soccerstat.vo.TeamTableVO;

public interface DataService {

	ArrayList<ScheduleVO> getSchedule(ScheduleVO sVo);

	ArrayList<TeamTableVO> getTable(TeamTableVO ttvo, String currentSeason);

	ArrayList<ScheduleVO> getSchedule1(Integer year, String cDate);

	ArrayList<ScheduleVO> getAllLeague(ScheduleVO sVo, String league);

	ArrayList<TeamTableVO> getLeagueTable(TeamTableVO ttvo, String currentSeason, String league);

	ArrayList<PlayerVO> getPlayerStat(PlayerVO pVo, String currentSeason, String league);

	ArrayList<TeamTableVO> getSortLeague(TeamTableVO ttvo, String currentSeason, String league, String sortData);

	ArrayList<PlayerVO> getSortPlayer(PlayerVO pVo, String currentSeason, String league, String sortP);

	TeamInfoVO getTeamInfo(String team);

	TeamTableVO getTeamStat(String team, String currentSeason);

	ArrayList<PlayerVO> getSquad(PlayerVO pVo, String team, String currentSeason);

	ArrayList<PlayerVO> getSortStat(String sortData, String team, String currentSeason);

	PlayerVO getPlayerInfo(String player);

	PlayerVO getNowStat(String player, String currentSeason);

}
