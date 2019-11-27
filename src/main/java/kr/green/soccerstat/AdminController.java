package kr.green.soccerstat;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.green.soccerstat.pagination.Criteria;
import kr.green.soccerstat.pagination.PageMaker;
import kr.green.soccerstat.service.BoardService;
import kr.green.soccerstat.service.MemberService;
import kr.green.soccerstat.service.PageMakerService;
import kr.green.soccerstat.vo.BoardVO;
import kr.green.soccerstat.vo.MemberVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class AdminController {
	
	@Autowired
	MemberService memberService;
	@Autowired
	PageMakerService pageMakerService;
	@Autowired
	BoardService boardService;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@RequestMapping(value="/admin/user/list", method=RequestMethod.GET)
	public String adminUserListGet(Model model,Criteria cri) {
		
		cri.setPerPageNum(10);
		//리스트를 현재 페이지 정보를 기준으로 가져와야함
		ArrayList<MemberVO> list = memberService.getAllMember(cri);
		//totalCount를 db에서 검색해서 가져와야함
		int totalCount = memberService.getTotalCount();
		//jsp에서 페이지네이션 링크를 board/list가 아닌 admin/user/list로 수정해야함
		
		PageMaker pm = pageMakerService.getPageMaker(10, cri, totalCount);
		
		model.addAttribute("pageMaker",pm);
		model.addAttribute("list",list);
		return "admin/user/list";
	}
	
	@RequestMapping(value="/admin/user/update", method=RequestMethod.GET)
	public String adminUserUpdateGet(Model model,Criteria cri,MemberVO mVo) {
		
		memberService.updateAuthority(mVo);
		model.addAttribute("page", cri.getPage());
		return "redirect:/admin/user/list";
	}
	
	@RequestMapping(value="/admin/board/list", method=RequestMethod.GET)
	public String adminBoardListGet(Model model,Criteria cri) {
		
		logger.info("게시판 관리 화면");
		ArrayList<BoardVO> boardList = boardService.getBoardListAll(cri);
		int totalCount = boardService.getTotalCountAll(cri);
		
		PageMaker pm = pageMakerService.getPageMaker(10, cri, totalCount);
		
		model.addAttribute("pageMaker", pm);
		model.addAttribute("list", boardList);
		
		return "admin/board/list";
	}
	
	@RequestMapping(value="/admin/board/update", method=RequestMethod.GET)
	public String adminBoardUpdateGet(Model model,Criteria cri,BoardVO bVo) {
		
		boardService.updateValid(bVo);
		model.addAttribute("page", cri.getPage());
		return "redirect:/admin/board/list";
	}
	
}
