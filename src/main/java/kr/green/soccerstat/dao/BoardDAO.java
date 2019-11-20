package kr.green.soccerstat.dao;

import java.util.ArrayList;

import kr.green.soccerstat.pagination.Criteria;
import kr.green.soccerstat.vo.BoardVO;

public interface BoardDAO {

	ArrayList<BoardVO> getList(Criteria cri);

	int getCountBoardList(Criteria cri);
	
	BoardVO getDisplay(int listNum);

}
