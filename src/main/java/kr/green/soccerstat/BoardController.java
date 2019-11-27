package kr.green.soccerstat;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.green.soccerstat.pagination.Criteria;
import kr.green.soccerstat.pagination.PageMaker;
import kr.green.soccerstat.service.BoardService;
import kr.green.soccerstat.service.MemberService;
import kr.green.soccerstat.service.PageMakerService;
import kr.green.soccerstat.utils.UploadFileUtils;
import kr.green.soccerstat.vo.BoardVO;
import kr.green.soccerstat.vo.FileVO;
import kr.green.soccerstat.vo.MemberVO;


/**
 * Handles requests for the application home page.
 */
@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;
	@Autowired
	MemberService memberService;
	@Autowired
	PageMakerService pageMakerService;
	@Resource
	private String uploadPath;
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public ModelAndView listGet(ModelAndView mv, Criteria cri) {
		
		cri.setPerPageNum(10);
		ArrayList<BoardVO> boardList = boardService.getBoardList(cri);
		int totalCount = boardService.getTotalCount(cri);
		
		PageMaker pm = pageMakerService.getPageMaker(5, cri, totalCount);
		
		mv.addObject("pageMaker", pm);
		mv.addObject("list", boardList);
		mv.setViewName("/board/list");
		
		return mv;
	}
	@RequestMapping(value="/display", method=RequestMethod.GET)
	public ModelAndView displayGet(ModelAndView mv,Integer num) {
		//조회수 증가
		boardService.updateViews(num);
		BoardVO bVo = boardService.getBoard(num);
		ArrayList<FileVO> files = boardService.getFiles(num);
		
		mv.addObject("board", bVo);
		mv.addObject("files", files);
		mv.setViewName("/board/display");
		
		return mv;
	}
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public ModelAndView modifyGet(ModelAndView mv,Integer num, HttpServletRequest r) {
		
		if(!boardService.isWriter(num,r)) {
			mv.setViewName("/board/list");
			return mv;
		}
		BoardVO bVo = boardService.getBoard(num);
		
		mv.addObject("board", bVo);
		mv.setViewName("/board/modify");
		
		return mv;
	}
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modifyPost(Model model,BoardVO bVo, HttpServletRequest r,MultipartFile file2) throws IOException, Exception  {
		
		if(file2.getOriginalFilename().length() != 0) {
			String file = UploadFileUtils.uploadFile(
							uploadPath, 
							file2.getOriginalFilename(),
							file2.getBytes());;
			bVo.setFile(file);
		}
		//첨부파일에 추가한 파일이 없는 경우
		else {
			if(bVo.getFile().length() == 0) {
				bVo.setFile("");
			}else {
				BoardVO tmp = boardService.getBoard(bVo.getNum());
				bVo.setFile(tmp.getFile());	
			}
			
		}
		boardService.updateBoard(bVo,r);
		
		model.addAttribute("num", bVo.getNum());
		
		return "redirect:/board/display";
	}
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public ModelAndView registerGet(ModelAndView mv,MemberVO mVo) {
		
		MemberVO user = memberService.login(mVo);
		if(user != null) {
			mv.addObject("user", user);
			mv.setViewName("/board/register");
			return mv;
		}else {
			mv.setViewName("/board/list");
			return mv;
		}
	}
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String registerPost(MultipartFile[] file2,BoardVO boardVo) throws IOException, Exception {
		
		int num = boardService.registerBoard(boardVo);
		for(MultipartFile tmp : file2)
			if(tmp.getOriginalFilename().length() != 0) {
				String file = UploadFileUtils.uploadFile(
								uploadPath, 
								tmp.getOriginalFilename(),
								tmp.getBytes());;
				boardService.addFile(file,num);
			}

		return "redirect:/board/list";
	}
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public ModelAndView deleteGet(ModelAndView mv,Integer num,HttpServletRequest r) {
		
		if(boardService.isWriter(num,r)) {
			boardService.deleteBoard(num);
		}
		
		mv.setViewName("/board/list");
		
		return mv;
	}
	
	@RequestMapping("/download")
	public ResponseEntity<byte[]> downloadFile(String fileName)throws Exception{
	    
		InputStream in = null;
	    ResponseEntity<byte[]> entity = null;
	    try{
	        HttpHeaders headers = new HttpHeaders();
	        in = new FileInputStream(uploadPath+fileName);

	        fileName = fileName.substring(fileName.indexOf("_")+1);
	        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
	        headers.add("Content-Disposition",  "attachment; filename=\"" 
				+ new String(fileName.getBytes("UTF-8"), "ISO-8859-1")+"\"");
	        entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),headers,HttpStatus.CREATED);
	    }catch(Exception e) {
	        e.printStackTrace();
	        entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
	    }finally {
	        in.close();
	    }
	    return entity;
	}
}
