package kr.green.soccerstat;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.green.soccerstat.dao.DataDAO;
import kr.green.soccerstat.vo.PlayerVO;
import kr.green.soccerstat.vo.ScheduleVO;
import kr.green.soccerstat.vo.TeamInfoVO;
import kr.green.soccerstat.vo.TeamTableVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	DataDAO dataDao;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value= {"/"},method = RequestMethod.GET)
	public ModelAndView mainGet(ModelAndView mv, ScheduleVO sVo, TeamTableVO ttvo, String currentSeason) throws Exception{
		logger.info("메인화면 진입 성공");
		currentSeason = "2019-20";
		
		ArrayList<ScheduleVO> schedule = dataDao.getSchedule(sVo);
	    ArrayList<TeamTableVO> table = dataDao.getTable(ttvo,currentSeason);
	    
	    mv.addObject("schedule", schedule);
	    mv.addObject("table", table);
	    mv.addObject("currentSeason", currentSeason);
	    mv.setViewName("/main/home");
	    
	    return mv;
	}
	
	@RequestMapping(value = {"/main/home"}, method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> mainPost(Integer year, String cDate) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		 
		map.put("year", year);
		map.put("cDate", cDate);
 
		ArrayList<ScheduleVO> schedules = dataDao.getSchedule1(year, cDate);
 
		map.put("schedules", schedules);
 
		return map;
	}
	
	@RequestMapping(value= {"/league"}, method = RequestMethod.GET)
	public ModelAndView eplGet(ModelAndView mv, ScheduleVO sVo, String league, TeamTableVO ttvo, String currentSeason, PlayerVO pVo) throws Exception{
		currentSeason = "2019-20";
	  
		ArrayList<ScheduleVO> allLeague = dataDao.getAllLeague(sVo, league);
		ArrayList<TeamTableVO> leagueTable = dataDao.getLeagueTable(ttvo, currentSeason, league);
		ArrayList<PlayerVO> playerStat = dataDao.getPlayerStat(pVo, currentSeason, league);
		
		mv.addObject("allLeague", allLeague);
		mv.addObject("leagueTable",leagueTable);
		mv.addObject("playerStat", playerStat);
		mv.addObject("currentSeason", currentSeason);
		mv.addObject("league", league);
		mv.setViewName("/league/league");
	  
		return mv;
	}
	
	@RequestMapping(value = {"/league/league"}, method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> leagueSchedulePost(Integer year, String cDate, String sortData, String currentSeason, String league){
		Map<Object, Object> map = new HashMap<Object, Object>();
		currentSeason = "2019-20";	
		
		map.put("year", year);
		map.put("cDate", cDate);
		map.put("league", league);
		
		ArrayList<ScheduleVO> schedules = dataDao.getLeagueSchedule(year, cDate,league);
		
		map.put("schedules", schedules);
		System.out.println(schedules);
		
		return map;
	}
	
	@RequestMapping(value = {"/leagueSortT"}, method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> leagueSortTPost(String sortData, TeamTableVO ttvo, String currentSeason, String league){
		Map<Object, Object> map = new HashMap<Object, Object>();
		currentSeason = "2019-20";	
		
		map.put("sortData", sortData);
		map.put("league", league);
		
		ArrayList<TeamTableVO> sortLeague = dataDao.getSortLeague(ttvo, currentSeason, league, sortData);
		
		map.put("sortLeague", sortLeague);
		
		return map;
	}
	
	@RequestMapping(value = {"/leagueSortP"}, method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> leagueSortPPost(String currentSeason, String league, PlayerVO pVo, String sortP){
		Map<Object, Object> map = new HashMap<Object, Object>();
		currentSeason = "2019-20";	
		
		map.put("league", league);
		map.put("sortP", sortP);
		
		ArrayList<PlayerVO> sortPlayer = dataDao.getSortPlayer(pVo, currentSeason, league, sortP);
		
		map.put("sortPlayer", sortPlayer);
		
		return map;
	}
	
	@RequestMapping(value= {"/tournament"}, method = RequestMethod.GET)
	public ModelAndView tournamentGet(ModelAndView mv) throws Exception{
	
		mv.setViewName("/tournament/tournament");
		
	    return mv;
	}
	
	@RequestMapping(value= {"/team"}, method = RequestMethod.GET)
	public ModelAndView teamGet(ModelAndView mv, String currentSeason, PlayerVO pVo, String team) throws Exception{
		currentSeason = "2019-20";
		
		mv.addObject("team", team);
		
		TeamInfoVO teamInfo = dataDao.getTeamInfo(team);
		TeamTableVO teamStat = dataDao.getTeamStat(team,currentSeason);
		ArrayList<PlayerVO> squad = dataDao.getSquad(pVo,team,currentSeason);
		
		mv.addObject("teamInfo", teamInfo);
		mv.addObject("teamStat", teamStat);
		mv.addObject("squad", squad);
		mv.setViewName("/team/team");
		
	    return mv;
	}
	
	@RequestMapping(value = {"/team"}, method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> teamPost(String sortData, String team, String currentSeason){
		Map<Object, Object> map = new HashMap<Object, Object>();
		currentSeason = "2019-20";
		
		map.put("sortData", sortData);
		map.put("team", team);
		
		ArrayList<PlayerVO> sortStat = dataDao.getSortStat(sortData,team,currentSeason);
		
		map.put("sortStat", sortStat);
		
		return map;
	}
	
	@RequestMapping(value= {"/player"}, method = RequestMethod.GET)
	public ModelAndView playerGet(ModelAndView mv, String currentSeason, PlayerVO pVo, String player) throws Exception{
		currentSeason = "2019-20";
		
		mv.addObject("player", player);
		
		PlayerVO playerInfo = dataDao.getPlayerInfo(player);
		PlayerVO nowStat = dataDao.getNowStat(player,currentSeason);
		ArrayList<PlayerVO> totalStat = dataDao.getTotalStat(pVo,player);
		
		mv.addObject("playerInfo", playerInfo);
		mv.addObject("nowStat", nowStat);
		mv.addObject("totalStat", totalStat);
		mv.setViewName("/player/player");
		
	    return mv;
	}
	
	@RequestMapping(value = {"/player"}, method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> playerPost(PlayerVO pVo, String player){
		Map<Object, Object> map = new HashMap<Object, Object>();
		
		map.put("player", player);
		
		ArrayList<PlayerVO> sum = dataDao.getSum(pVo,player);
		
		map.put("sum", sum);
		
		return map;
	}
	
	@RequestMapping(value= {"/comparison"}, method = RequestMethod.GET)
	public ModelAndView comparisonGet(ModelAndView mv) throws Exception{
		
		mv.setViewName("/comparison/comparison");
		
	    return mv;
	}
	
	@RequestMapping(value = "/comparison", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> comparisonPost(PlayerVO pVo, String league, String season, String team, String playerName) {
		
		Map<Object, Object> map = new HashMap<Object, Object>();
					 
		map.put("league", league);
		map.put("season", season);
		map.put("team", team);
		map.put("playerName", playerName);
		
		ArrayList<String> seasonList = dataDao.getSeasonList(league);
		ArrayList<String> teamList = dataDao.getTeamList(season,league);
		ArrayList<String> playerList = dataDao.getPlayerList(team,season,league);
		ArrayList<PlayerVO> compareStat = dataDao.getCompareStat(pVo,season,playerName);
		
		map.put("seasonList", seasonList);
		map.put("teamList", teamList);
		map.put("playerList", playerList);
		map.put("compareStat", compareStat);
		
		return map;
	}
	
	@RequestMapping(value= {"/privacy"})
	public ModelAndView privacyGet(ModelAndView mv) throws Exception{
	    mv.setViewName("/main/privacy");
	    
	    return mv;
	}
	
	@RequestMapping(value= {"/adalliance"})
	public ModelAndView adallianceGet(ModelAndView mv) throws Exception{
	    mv.setViewName("/main/adalliance");
	    
	    return mv;
	}
	
	@RequestMapping(value= {"/termsOfUse"})
	public ModelAndView termsOfUseGet(ModelAndView mv) throws Exception{
	    mv.setViewName("/main/termsOfUse");
	    
	    return mv;
	}
}
