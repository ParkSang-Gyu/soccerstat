package kr.green.soccerstat.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.green.soccerstat.dao.MemberDAO;
import kr.green.soccerstat.pagination.Criteria;
import kr.green.soccerstat.vo.MemberVO;

@Service
public class MemberServiceImp implements MemberService{

	@Autowired
	MemberDAO memberDao;
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public MemberVO login(MemberVO mVo) {
		if(mVo == null)//예외처리
			return null;
		MemberVO oVo = memberDao.getMember(mVo.getId());
		if(oVo == null)
			return null;
		if(passwordEncoder.matches(mVo.getPw(), oVo.getPw()))
			return oVo;
		return null;
	}

	@Override
	public boolean signin(MemberVO mVo) {
		// 기존에 해당 아이디기 있는지 체크
		// 있으면 false 반환하고 종료
		// 없으면 회원가입 진행
		if(mVo == null)
			return false;
		//mVo.setName("");
		if(memberDao.getMember(mVo.getId()) != null)
			return false;
		//회원가입창에서 입력받은 암호를 암호화 시킴
		String encodePw = passwordEncoder.encode(mVo.getPw());
		//회원 정보의 비밀번호를 암호화된 비밀번호로 변경
		mVo.setPw(encodePw);
		memberDao.signin(mVo);
		return true;
	}

	@Override
	public boolean retouch(MemberVO mVo, String oldPw) {
		if(mVo == null)	
			return false;
		MemberVO oVo = memberDao.getMember(mVo.getId());
		if(passwordEncoder.matches(oldPw, oVo.getPw())) {
			//회원정보수정에서 입력받은 암호를 암호화 시킴
			String encodePw = passwordEncoder.encode(mVo.getPw());
			//회원 정보의 비밀번호를 암호화된 비밀번호로 변경
			mVo.setPw(encodePw);
			memberDao.retouch(mVo);
			return true;
		}
		return false;
	}
	
	@Override
	public boolean isMember(String id) {
		if(memberDao.getMember(id) == null) {
			return false;
		}
		return true;
	}

	@Override
	public ArrayList<MemberVO> getAllMember(Criteria cri) {
		return memberDao.getAllMember(cri);
	}

	@Override
	public int getTotalCount() {
		return memberDao.getTotalCount();
	}

	@Override
	public void updateAuthority(MemberVO mVo) {
		memberDao.updateAuthority(mVo);
	}

	
}
