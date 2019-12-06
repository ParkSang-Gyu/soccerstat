package kr.green.soccerstat.service;

import kr.green.soccerstat.vo.MemberVO;

public interface MemberService {

	public MemberVO login(MemberVO mVo);

	public boolean signin(MemberVO mVo);

	public boolean retouch(MemberVO mVo, String oldPw);
	
	public boolean isMember(String id);
	
	public boolean isWriter(String writer);

}
