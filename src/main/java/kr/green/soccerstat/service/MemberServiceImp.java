package kr.green.soccerstat.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.soccerstat.dao.MemberDAO;
import kr.green.soccerstat.vo.MemberVO;

@Service
public class MemberServiceImp implements MemberService{

	@Autowired
	MemberDAO memberDao;
	
	@Override
	public MemberVO login(String id, String pw) {
		// TODO Auto-generated method stub
		return null;
	}

}
