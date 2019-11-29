package kr.green.soccerstat.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import kr.green.soccerstat.pagination.Criteria;
import kr.green.soccerstat.vo.BoardVO;
import kr.green.soccerstat.vo.FileVO;
import kr.green.soccerstat.vo.MemberVO;
import kr.green.soccerstat.vo.ReplyVO;

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

	void getRegisterReply(Integer num, ReplyVO rVo, MemberVO mVo);

	ArrayList<ReplyVO> getReply(Integer num);

}
