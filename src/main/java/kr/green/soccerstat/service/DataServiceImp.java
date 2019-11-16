package kr.green.soccerstat.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.soccerstat.dao.DataDAO;
import kr.green.soccerstat.vo.PlayerVO;
import kr.green.soccerstat.vo.ScheduleVO;
import kr.green.soccerstat.vo.TeamInfoVO;
import kr.green.soccerstat.vo.TeamTableVO;

@Service
public class DataServiceImp implements DataService{

	@Autowired
	DataDAO dataDao;
	
	@Override
	public ArrayList<ScheduleVO> getSchedule(ScheduleVO sVo) {
		
		return dataDao.getSchedule(sVo);
	}

	@Override
	public ArrayList<TeamTableVO> getTable(TeamTableVO ttvo, String currentSeason) {
		
		return dataDao.getTable(ttvo,currentSeason);
	}

	@Override
	public ArrayList<ScheduleVO> getSchedule1(Integer year, String cDate) {
		
		return dataDao.getSchedule1(year, cDate);
	}

	@Override
	public ArrayList<ScheduleVO> getAllLeague(ScheduleVO sVo, String league) {
		
		return dataDao.getAllLeague(sVo,league);
	}

	@Override
	public ArrayList<TeamTableVO> getLeagueTable(TeamTableVO ttvo, String currentSeason, String league) {
		
		return dataDao.getLeagueTable(ttvo,currentSeason,league);
	}

	@Override
	public ArrayList<PlayerVO> getPlayerStat(PlayerVO pVo, String currentSeason, String league) {
		
		return dataDao.getPlayerStat(pVo,currentSeason,league);
	}

	@Override
	public ArrayList<TeamTableVO> getSortLeague(TeamTableVO ttvo, String currentSeason, String league,
			String sortData) {
		
		return dataDao.getSortLeague(ttvo,currentSeason,league,sortData);
	}

	@Override
	public ArrayList<PlayerVO> getSortPlayer(PlayerVO pVo, String currentSeason, String league, String sortP) {
		
		return dataDao.getSortPlayer(pVo,currentSeason,league,sortP);
	}

	@Override
	public TeamInfoVO getTeamInfo(String team) {
		
		return dataDao.getTeamInfo(team);
	}

	@Override
	public TeamTableVO getTeamStat(String team, String currentSeason) {
		
		return dataDao.getTeamStat(team,currentSeason);
	}

	@Override
	public ArrayList<PlayerVO> getSquad(PlayerVO pVo, String team, String currentSeason) {
		
		return dataDao.getSquad(pVo,team,currentSeason);
	}

	@Override
	public ArrayList<PlayerVO> getSortStat(String sortData, String team, String currentSeason) {
		
		return dataDao.getSortStat(sortData,team,currentSeason);
	}

	@Override
	public PlayerVO getPlayerInfo(String player) {
		
		return dataDao.getPlayerInfo(player);
	}

	@Override
	public PlayerVO getNowStat(String player, String currentSeason) {
		
		return dataDao.getNowStat(player,currentSeason);
	}

	@Override
	public ArrayList<PlayerVO> getTotalStat(PlayerVO pVo, String player) {
		
		return dataDao.getTotalStat(pVo,player);
	}

	@Override
	public ArrayList<PlayerVO> getSum(PlayerVO pVo, String player) {
		
		return dataDao.getSum(pVo,player);
	}

	@Override
	public ArrayList<String> getSeasonList(String league) {
		
		return dataDao.getSeasonList(league);
	}

	@Override
	public ArrayList<String> getTeamList(String season, String league) {
		
		return dataDao.getTeamList(season,league);
	}

	@Override
	public ArrayList<String> getPlayerList(String team, String season, String league) {
		
		return dataDao.getPlayerList(team,season,league);
	}

	@Override
	public PlayerVO getCompareStat(String playerName) {
		
		return dataDao.getCompareStat(playerName);
	}

}
