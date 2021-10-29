package egovframework.homepage.mypage.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface HomepageMypageService {
	
	// 마이페이지 최근상담내역
	EgovMap getMypageRecCns(MypageVO vo);
	
	// 상담이력 목록
	List<EgovMap> getMypageCnsHisList(MypageVO vo);
	
	// 마이페이지 상세보기
	EgovMap getMypageRecCnsDtl(MypageVO vo);
	
}