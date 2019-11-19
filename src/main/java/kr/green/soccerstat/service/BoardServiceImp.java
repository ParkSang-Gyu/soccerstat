package kr.green.soccerstat.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.soccerstat.dao.BoardDAO;
import kr.green.soccerstat.vo.BoardVO;

@Service
public class BoardServiceImp implements BoardService{

	@Autowired
	BoardDAO boardDao;
	
	@Override
	public ArrayList<BoardVO> getList(BoardVO bVo) {
		
		return boardDao.getList(bVo);
	}

}
