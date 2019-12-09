package kr.green.soccerstat.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.soccerstat.dao.BoardDAO;
import kr.green.soccerstat.vo.BoardVO;
import kr.green.soccerstat.vo.MemberVO;
import kr.green.soccerstat.vo.ReplyVO;

@Service
public class BoardServiceImp implements BoardService{

	@Autowired
	BoardDAO boardDao;
	
	@Override
	public BoardVO getBoard(Integer num) {
		
		if(num == null)
			return null;
		return boardDao.getBoard(num);
	}

	@Override
	public void updateViews(Integer num) {
		
		//boardDao.updateViews(num);
		BoardVO tmp = boardDao.getBoard(num);
		if(tmp != null) {
			int oldViews = tmp.getViews();
			tmp.setViews(oldViews+1);
			boardDao.updateBoard(tmp);
		}
	}
	
	@Override
	public void updateBoard(BoardVO bVo, HttpServletRequest r) {
		
		MemberVO user = (MemberVO)r.getSession().getAttribute("user");
		if(user == null || bVo == null)	return ;
		if(bVo.getWriter() != null && bVo.getWriter().equals(user.getId())) {
			boardDao.updateBoard(bVo);
		}
	}

	@Override
	public int registerBoard(BoardVO boardVo) {
		
		boardDao.registerBoard(boardVo);
		return boardDao.getMaxBoardNum(); 
	}

	@Override
	public void deleteBoard(Integer num) {
		
		if(num == null || num <= 0)	return;
		boardDao.deleteBoard(num);
	}

	@Override
	public boolean isWriter(Integer num, HttpServletRequest r) {
		
		BoardVO board = boardDao.getBoard(num);
		MemberVO user = (MemberVO)r.getSession().getAttribute("user");
		if(board != null && user != null 
				&& board.getId().equals(user.getId())) {
			return true;
		}
		return false;
	}

	@Override
	public void addFile(String file, int num) {
		
		boardDao.insertFile(file,num);
	}

	@Override
	public void updateRecommend(Integer replyNum) {
		
		ReplyVO tmp = boardDao.getReply(replyNum);
		if(tmp != null) {
			int oldRecommend = tmp.getRecommend();
			tmp.setRecommend(oldRecommend+1);
			boardDao.updateRecommend(tmp);
			
		}
	}
	

}
