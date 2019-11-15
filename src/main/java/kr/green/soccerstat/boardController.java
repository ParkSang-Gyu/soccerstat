package kr.green.soccerstat;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.green.soccerstat.service.BoardService;


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
	public ModelAndView listGet(ModelAndView mv) throws Exception{
	    
	    mv.setViewName("/board/list");
	    
	    return mv;
	}
	
}
