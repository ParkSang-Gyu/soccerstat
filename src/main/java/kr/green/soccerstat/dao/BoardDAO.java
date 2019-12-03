package kr.green.soccerstat.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.soccerstat.pagination.Criteria;
import kr.green.soccerstat.vo.BoardVO;
import kr.green.soccerstat.vo.FileVO;
import kr.green.soccerstat.vo.MemberVO;
import kr.green.soccerstat.vo.ReplyVO;

public interface BoardDAO {

	ArrayList<BoardVO> getBoardList(Criteria cri);

	BoardVO getBoard(Integer num);

	void updateViews(Integer num);

	void updateBoard(BoardVO tmp);

	void deleteBoard(Integer num);

	int getTotalCount(Criteria cri);

	ArrayList<BoardVO> getBoardListAll(Criteria cri);

	int getTotalCountAll(Criteria cri);

	void updateValid(BoardVO bVo);

	void insertFile(@Param("file")String file, @Param("num")int num);

	ArrayList<FileVO> selectFileList(Integer num);

	int getMaxBoardNum();

	void registerBoard(BoardVO boardVo);
	
	void insertReply(@Param("num")Integer num, @Param("rVo")ReplyVO rVo, @Param("mVo")MemberVO mVo);

	void updateRecommend(ReplyVO tmp);
	
	ArrayList<ReplyVO> getReplyList(Integer num);
	
	ReplyVO getReply(Integer replyNum);
	
	

}
