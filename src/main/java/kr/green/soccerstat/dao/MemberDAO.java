package kr.green.soccerstat.dao;

import java.util.ArrayList;

import kr.green.soccerstat.pagination.Criteria;
import kr.green.soccerstat.vo.MemberVO;

public interface MemberDAO {

	MemberVO getMember(String id);

	MemberVO getWriter(String writer);
	
	void signin(MemberVO mVo);
	
	void retouch(MemberVO mVo);
	
	ArrayList<MemberVO> getAllMember(Criteria cri);

	int getTotalCount();

	void updateAuthority(MemberVO mVo);


	
}
