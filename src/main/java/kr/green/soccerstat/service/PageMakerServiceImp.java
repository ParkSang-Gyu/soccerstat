package kr.green.soccerstat.service;

import org.springframework.stereotype.Service;

import kr.green.soccerstat.pagination.Criteria;
import kr.green.soccerstat.pagination.PageMaker;

@Service
public class PageMakerServiceImp implements PageMakerService{

	@Override
	public PageMaker getPageMaker(int displayPageNum, Criteria cri, int totalCount) {
		PageMaker pm = new PageMaker();
		pm.setCriteria(cri);
		pm.setDisplayPageNum(displayPageNum);
		pm.setTotalCount(totalCount);
		return pm;
	}
}
