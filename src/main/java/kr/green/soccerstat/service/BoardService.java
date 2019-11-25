package kr.green.soccerstat.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import kr.green.soccerstat.pagination.Criteria;
import kr.green.soccerstat.vo.BoardVO;
import kr.green.soccerstat.vo.FileVO;

public interface BoardService {

	ArrayList<BoardVO> getBoardList(Criteria cri);

	BoardVO getBoard(Integer num);

	void updateViews(Integer num);

	void updateBoard(BoardVO bVo, HttpServletRequest r);

	int registerBoard(BoardVO boardVo);

	void deleteBoard(Integer num);

	boolean isWriter(Integer num, HttpServletRequest r);

	int getTotalCount(Criteria cri);

	ArrayList<BoardVO> getBoardListAll(Criteria cri);

	int getTotalCountAll(Criteria cri);

	void updateValid(BoardVO bVo);

	void addFile(String file, int num);

	ArrayList<FileVO> getFiles(Integer num);

}
