package kr.green.soccerstat;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.green.soccerstat.pagination.Criteria;
import kr.green.soccerstat.pagination.PageMaker;
import kr.green.soccerstat.service.BoardService;
import kr.green.soccerstat.vo.BoardVO;


/**
 * Handles requests for the application home page.
 */
@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	@RequestMapping(value= {"/list"},method = RequestMethod.GET)
	public ModelAndView listGet(ModelAndView mv, Criteria cri) throws Exception{
	    
		ArrayList<BoardVO> list = boardService.getList(cri);
		
		PageMaker pm = new PageMaker();
		pm.setCriteria(cri);
		pm.setDisplayPageNum(2);
		int totalCount = boardService.getCountBoardList(cri);
		pm.setTotalCount(totalCount);
		
		mv.addObject("list", list);
		mv.addObject("pageMaker", pm);
	    mv.setViewName("/board/list");
	    
	    return mv;
	}
	
	@RequestMapping(value= {"/display"},method = RequestMethod.GET)
	public ModelAndView displayGet(ModelAndView mv, int listNum) throws Exception{
	    
		mv.addObject("listNum", listNum);
		
		BoardVO display = boardService.getDisplay(listNum);
		
		mv.addObject("display", display);
	    mv.setViewName("/board/display");
	    
	    return mv;
	}
	
	@RequestMapping(value= {"/bmodify"},method = RequestMethod.GET)
	public ModelAndView bmodifyGet(ModelAndView mv) throws Exception{
	    
	    mv.setViewName("/board/bmodify");
	    
	    return mv;
	}
	
	@RequestMapping(value= {"/register"},method = RequestMethod.GET)
	public ModelAndView registerGet(ModelAndView mv) throws Exception{
	    
	    mv.setViewName("/board/register");
	    
	    return mv;
	}
}
