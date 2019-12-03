package kr.green.soccerstat.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.soccerstat.vo.PlayerVO;
import kr.green.soccerstat.vo.ScheduleVO;
import kr.green.soccerstat.vo.TeamInfoVO;
import kr.green.soccerstat.vo.TeamTableVO;

public interface DataDAO {

	ArrayList<ScheduleVO> getSchedule(ScheduleVO sVo);

	ArrayList<TeamTableVO> getTable(@Param("ttvo")TeamTableVO ttvo, @Param("currentSeason")String currentSeason);

	ArrayList<ScheduleVO> getSchedule1(@Param("year")Integer year, @Param("cDate")String cDate);

	ArrayList<ScheduleVO> getAllLeague(@Param("sVo")ScheduleVO sVo, @Param("league")String league);

	ArrayList<TeamTableVO> getLeagueTable(@Param("ttvo")TeamTableVO ttvo, @Param("currentSeason")String currentSeason, @Param("league")String league);

	ArrayList<PlayerVO> getPlayerStat(@Param("pVo")PlayerVO pVo, @Param("currentSeason")String currentSeason, @Param("league")String league);

	ArrayList<ScheduleVO> getLeagueSchedule(@Param("year")Integer year, @Param("cDate")String cDate, @Param("league")String league);
	
	ArrayList<TeamTableVO> getSortLeague(@Param("ttvo")TeamTableVO ttvo, @Param("currentSeason")String currentSeason, @Param("league")String league, @Param("sortData")String sortData);

	ArrayList<PlayerVO> getSortPlayer(@Param("pVo")PlayerVO pVo, @Param("currentSeason")String currentSeason, @Param("league")String league, @Param("sortP")String sortP);

	TeamInfoVO getTeamInfo(String team);

	TeamTableVO getTeamStat(@Param("team")String team, @Param("currentSeason")String currentSeason);

	ArrayList<PlayerVO> getSquad(@Param("pVo")PlayerVO pVo, @Param("team")String team, @Param("currentSeason")String currentSeason);

	ArrayList<PlayerVO> getSortStat(@Param("sortData")String sortData, @Param("team")String team, @Param("currentSeason")String currentSeason);

	PlayerVO getPlayerInfo(String player);

	PlayerVO getNowStat(@Param("player")String player, @Param("currentSeason")String currentSeason);

	ArrayList<PlayerVO> getTotalStat(@Param("pVo")PlayerVO pVo, @Param("player")String player);

	ArrayList<PlayerVO> getSum(@Param("pVo")PlayerVO pVo, @Param("player")String player);

	ArrayList<String> getSeasonList(String league);
  
	ArrayList<String> getTeamList(@Param("season")String season, @Param("league")String league);
  
	ArrayList<String> getPlayerList(@Param("team")String team, @Param("season")String season, @Param("league")String league);
  
	ArrayList<PlayerVO> getCompareStat(@Param("pVo")PlayerVO pVo, @Param("season")String season, @Param("playerName")String playerName);
	 

}
