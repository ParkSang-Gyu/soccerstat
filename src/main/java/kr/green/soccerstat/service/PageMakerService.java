package kr.green.soccerstat.service;

import kr.green.soccerstat.pagination.Criteria;
import kr.green.soccerstat.pagination.PageMaker;

public interface PageMakerService {

	PageMaker getPageMaker(int displayPageNum, Criteria cri, int totalCount);
}
