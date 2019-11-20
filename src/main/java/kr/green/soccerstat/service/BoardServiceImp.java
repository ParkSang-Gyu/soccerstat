package kr.green.soccerstat.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.soccerstat.dao.BoardDAO;
import kr.green.soccerstat.pagination.Criteria;
import kr.green.soccerstat.vo.BoardVO;

@Service
public class BoardServiceImp implements BoardService{

	@Autowired
	BoardDAO boardDao;
	
	@Override
	public ArrayList<BoardVO> getList(Criteria cri) {
		
		return boardDao.getList(cri);
	}

	@Override
	public int getCountBoardList(Criteria cri) {
		return boardDao.getCountBoardList(cri);
	}
	
	@Override
	public BoardVO getDisplay(int listNum) {
		
		return boardDao.getDisplay(listNum);
	}

}
