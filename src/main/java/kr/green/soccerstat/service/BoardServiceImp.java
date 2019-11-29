package kr.green.soccerstat.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.soccerstat.dao.BoardDAO;
import kr.green.soccerstat.pagination.Criteria;
import kr.green.soccerstat.vo.BoardVO;
import kr.green.soccerstat.vo.FileVO;
import kr.green.soccerstat.vo.MemberVO;
import kr.green.soccerstat.vo.ReplyVO;

@Service
public class BoardServiceImp implements BoardService{

	@Autowired
	BoardDAO boardDao;
	
	@Override
	public ArrayList<BoardVO> getBoardList(Criteria cri) {
		
		return boardDao.getBoardList(cri);
	}

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
	public int getTotalCount(Criteria cri) {
		
		return boardDao.getTotalCount(cri);
	}

	@Override
	public ArrayList<BoardVO> getBoardListAll(Criteria cri) {
		
		return boardDao.getBoardListAll(cri);
	}

	@Override
	public int getTotalCountAll(Criteria cri) {
		
		return boardDao.getTotalCountAll(cri);
	}

	@Override
	public void updateValid(BoardVO bVo) {
		
		boardDao.updateValid(bVo);		
	}

	@Override
	public void addFile(String file, int num) {
		
		boardDao.insertFile(file,num);
	}

	@Override
	public ArrayList<FileVO> getFiles(Integer num) {
		
		return boardDao.selectFileList(num);
	}

	@Override
	public void getRegisterReply(Integer num, ReplyVO rVo, MemberVO mVo) {
		
		boardDao.insertReply(num,rVo,mVo);	
	}

	@Override
	public ArrayList<ReplyVO> getReply(Integer num) {
		
		return boardDao.getReplyList(num);
	}

}
