package kr.green.soccerstat;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.green.soccerstat.service.BoardService;
import kr.green.soccerstat.vo.BoardVO;


/**
 * Handles requests for the application home page.
 */
@Controller
public class boardController {
	
	@Autowired
	BoardService boardService;
	
	private static final Logger logger = LoggerFactory.getLogger(boardController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value= {"/list"},method = RequestMethod.GET)
	public ModelAndView listGet(ModelAndView mv,BoardVO bVo) throws Exception{
	    
		ArrayList<BoardVO> list = boardService.getList(bVo);
		
		mv.addObject("list", list);
	    mv.setViewName("/board/list");
	    
	    return mv;
	}
	
	@RequestMapping(value= {"/display"},method = RequestMethod.GET)
	public ModelAndView displayGet(ModelAndView mv) throws Exception{
	    
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
