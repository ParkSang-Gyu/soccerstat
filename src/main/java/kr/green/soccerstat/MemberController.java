package kr.green.soccerstat;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.green.soccerstat.service.MemberService;


/**
 * Handles requests for the application home page.
 */
@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value= {"/login"},method = RequestMethod.GET)
	public ModelAndView listGet(ModelAndView mv) throws Exception{
	    
	    mv.setViewName("/member/login");
	    
	    return mv;
	}
	
	@RequestMapping(value= {"/searchId"},method = RequestMethod.GET)
	public ModelAndView searchIdGet(ModelAndView mv) throws Exception{
	    
	    mv.setViewName("/member/searchId");
	    
	    return mv;
	}
	
	@RequestMapping(value= {"/searchPw"},method = RequestMethod.GET)
	public ModelAndView searchPwGet(ModelAndView mv) throws Exception{
	    
	    mv.setViewName("/member/searchPw");
	    
	    return mv;
	}
	
	@RequestMapping(value= {"/signin"},method = RequestMethod.GET)
	public ModelAndView signinGet(ModelAndView mv) throws Exception{
	    
	    mv.setViewName("/member/signin");
	    
	    return mv;
	}
	
	@RequestMapping(value= {"/modify"},method = RequestMethod.GET)
	public ModelAndView modifyGet(ModelAndView mv) throws Exception{
	    
	    mv.setViewName("/member/modify");
	    
	    return mv;
	}
}
