package kr.green.soccerstat.service;

import java.util.ArrayList;

import kr.green.soccerstat.vo.BoardVO;

public interface BoardService {

	ArrayList<BoardVO> getList(BoardVO bVo);

}
