package kr.green.soccerstat.service;

import kr.green.soccerstat.vo.MemberVO;

public interface MemberService {

	MemberVO login(String id, String pw);

}
