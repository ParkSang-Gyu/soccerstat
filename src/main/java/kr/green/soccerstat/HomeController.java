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

import kr.green.soccerstat.service.DataService;
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
	DataService dataService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value= {"/"},method = RequestMethod.GET)
	public ModelAndView mainGet(ModelAndView mv, ScheduleVO sVo, TeamTableVO ttvo, String currentSeason) throws Exception{
		currentSeason = "2019-20";
		
		ArrayList<ScheduleVO> schedule = dataService.getSchedule(sVo);
	    ArrayList<TeamTableVO> table = dataService.getTable(ttvo,currentSeason);
	    
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
 
		ArrayList<ScheduleVO> schedules = dataService.getSchedule1(year, cDate);
 
		map.put("schedules", schedules);
 
		return map;
	}
	
	@RequestMapping(value= {"/league"}, method = RequestMethod.GET)
	public ModelAndView eplGet(ModelAndView mv, ScheduleVO sVo, String league, TeamTableVO ttvo, String currentSeason, PlayerVO pVo) throws Exception{
		currentSeason = "2019-20";
	  
		ArrayList<ScheduleVO> allLeague = dataService.getAllLeague(sVo, league);
		ArrayList<TeamTableVO> leagueTable = dataService.getLeagueTable(ttvo, currentSeason, league);
		ArrayList<PlayerVO> playerStat = dataService.getPlayerStat(pVo, currentSeason, league);
		
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
	public Map<Object, Object> leaguePost(Integer year, String cDate, String sortData, TeamTableVO ttvo, String currentSeason, String league){
		Map<Object, Object> map = new HashMap<Object, Object>();
		currentSeason = "2019-20";	
		
		map.put("year", year);
		map.put("cDate", cDate);
		map.put("sortData", sortData);
		map.put("league", league);
		
		ArrayList<ScheduleVO> schedules = dataService.getSchedule1(year, cDate);
		ArrayList<TeamTableVO> sortLeague = dataService.getSortLeague(ttvo, currentSeason, league, sortData);
		
		map.put("schedules", schedules);
		map.put("sortLeague", sortLeague);
		
		return map;
	}
	
	@RequestMapping(value = {"/league"}, method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> leaguePost(String currentSeason, String league, PlayerVO pVo, String sortP){
		Map<Object, Object> map = new HashMap<Object, Object>();
		currentSeason = "2019-20";	
		
		map.put("league", league);
		map.put("sortP", sortP);
		System.out.println(sortP);
		
		ArrayList<PlayerVO> sortPlayer = dataService.getSortPlayer(pVo, currentSeason, league, sortP);
		
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
		
		TeamInfoVO teamInfo = dataService.getTeamInfo(team);
		TeamTableVO teamStat = dataService.getTeamStat(team,currentSeason);
		ArrayList<PlayerVO> squad = dataService.getSquad(pVo,team,currentSeason);
		
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
		
		ArrayList<PlayerVO> sortStat = dataService.getSortStat(sortData,team,currentSeason);
		
		map.put("sortStat", sortStat);
		
		return map;
	}
	
	@RequestMapping(value= {"/player"}, method = RequestMethod.GET)
	public ModelAndView playerGet(ModelAndView mv, String currentSeason, PlayerVO pVo, String player) throws Exception{
		currentSeason = "2019-20";
		
		mv.addObject("player", player);
		
		PlayerVO playerInfo = dataService.getPlayerInfo(player);
		PlayerVO nowStat = dataService.getNowStat(player,currentSeason);
		//ArrayList<PlayerVO> squad = dataService.getSquad(pVo,team,currentSeason);
		
		mv.addObject("playerInfo", playerInfo);
		mv.addObject("nowStat", nowStat);
		//mv.addObject("squad", squad);
		mv.setViewName("/player/player");
		
	    return mv;
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
