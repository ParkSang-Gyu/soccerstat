package kr.green.soccerstat;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.green.soccerstat.service.MemberService;
import kr.green.soccerstat.vo.MemberVO;


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
	public ModelAndView loginGet(ModelAndView mv) throws Exception{
	    
	    mv.setViewName("/member/login");
	    
	    return mv;
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPost(Model model, MemberVO mVo) {
		
		logger.info("로그인 진행중");
		MemberVO user = memberService.login(mVo);
		if(user != null) {
			model.addAttribute("user", user);
			logger.info("로그인 성공");
			return "redirect:/list";
		}
		return "redirect:/login";		
	}
	
	@RequestMapping(value="/logout")
	public String signout(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		logger.info("로그아웃 성공");
		return "redirect:/list";
	}
	
	@RequestMapping(value= {"/signin"}, method = RequestMethod.GET)
	public ModelAndView signinGet(ModelAndView mv) throws Exception{
	    
	    mv.setViewName("/member/signin");
	    
	    return mv;
	}
	
	@RequestMapping(value = "/signin", method = RequestMethod.POST)
	public String signinPost(MemberVO mVo) {
		logger.info("회원가입 진행중");
		if(memberService.signin(mVo)) {
			logger.info("회원가입 성공");
			return "redirect:/";
		}else {
			return "redirect:/signin";
		}
	}
	
	@RequestMapping(value ="/confirm")
	@ResponseBody
	public Map<Object, Object> idcheck(@RequestBody String id){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    
	    //변수 id에 저장된 아이디가 회원 아이디인지 아닌지 확인하여 isMember변수에 
	    //담아 보낸다.
	    boolean isMember = memberService.isMember(id);
	    map.put("isMember", isMember);
	    return map;
	}
	
	@RequestMapping(value= {"/retouch"},method = RequestMethod.GET)
	public ModelAndView retouchGet(ModelAndView mv) throws Exception{
	    
	    mv.setViewName("/member/retouch");
	    
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
	
	
	
}
