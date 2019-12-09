package kr.green.soccerstat.service;

import javax.servlet.http.HttpServletRequest;

import kr.green.soccerstat.vo.BoardVO;

public interface BoardService {

	BoardVO getBoard(Integer num);

	void updateViews(Integer num);
	
	void updateBoard(BoardVO bVo, HttpServletRequest r);

	int registerBoard(BoardVO boardVo);

	void deleteBoard(Integer num);

	boolean isWriter(Integer num, HttpServletRequest r);

	void addFile(String file, int num);
	
	void updateRecommend(Integer replyNum);
	

}
