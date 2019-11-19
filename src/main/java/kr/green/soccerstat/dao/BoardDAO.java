package kr.green.soccerstat.dao;

import java.util.ArrayList;

import kr.green.soccerstat.vo.BoardVO;

public interface BoardDAO {

	ArrayList<BoardVO> getList(BoardVO bVo);

}
