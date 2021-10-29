package ggsc.hpgmng.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface HomepageMngService {
	
	// 공지사항 목록
	List<EgovMap> getNoticeList(HnoticeVO vo);
	
	// 공지사항 갯수
	int getNoticeListTotCnt(HnoticeVO vo);
	
	// 공지사항 등록
	void insertNotice(HnoticeVO vo);
	
	// 공지사항 수정
	void updateNotice(HnoticeVO vo);
	
	// 공지사항 상세
	EgovMap getNoticeDtl(int num);
	
	// 게시판관리 목록
	List<EgovMap> getFreeBoardList(FreeBrdVO vo);
	
	// 게시판관리 갯수
	int getFreeBoardListTotCnt(FreeBrdVO vo);
	
	// 게시판관리 등록
	void insertFreeBoard(FreeBrdVO vo);
	
	// 게시판관리 수정
	void updateFreeBoard(FreeBrdVO vo);
	
	// 게시판관리 상세
	EgovMap getFreeBoardDtl(int num);
	
	// 문서자료실 목록
	List<EgovMap> getLibraryList(LibraryVO vo);
	
	// 문서자료실 갯수
	int getLibraryListTotCnt(LibraryVO vo);
	
	// 문서자료실 등록
	void insertLibrary(LibraryVO vo);
	
	// 문서자료실 수정
	void updateLibrary(LibraryVO vo);
	
	// 문서자료실 상세
	EgovMap getLibraryDtl(int num);
	
	// 센터소식 목록
	List<EgovMap> getCenterNewsList(NewsVO vo);
	
	// 센터소식 갯수
	int getCenterNewsListTotCnt(NewsVO vo);
	
	// 센터소식 등록
	void insertCenterNews(NewsVO vo);
	
	// 센터소식 수정
	void updateCenterNews(NewsVO vo);
	
	// 센터소식 상세
	EgovMap getCenterNewsDtl(int num);
	
	// 온라인상담 목록
	List<EgovMap> getOnlineAskList(OnlineAskVO vo);
	
	// 온라인상담 갯수
	int getOnlineAskListTotCnt(OnlineAskVO vo);
	
	// 온라인상담 등록
	void insertOnlineAsk(OnlineAskVO vo);
	
	// 온라인상담 수정
	void updateOnlineAsk(OnlineAskVO vo);
	
	// 온라인상담 상세
	EgovMap getOnlineAskDtl(int num);
	
	// 교육신청 목록
	List<EgovMap> getEduAppList(EduAppVO vo);
	
	// 교육신청 갯수
	int getEduAppListTotCnt(EduAppVO vo);
	
	// 교육신청 상세
	EgovMap getEduAppDtl(int num);
	
	// 교육신청 수정
	void updateEduApp(EduAppVO vo);
	
//	// FAQ 목록
//	List<EgovMap> getFaqList(FaqVO vo);
//	
//	// FAQ 갯수
//	int getFaqListTotCnt(FaqVO vo);
//	
//	// FAQ 등록
//	void insertFaq(FaqVO vo);
//	
//	// FAQ 상세
//	EgovMap getFaqDetail(int num);
//	
//	// FAQ 수정
//	void updateFaq(FaqVO vo);
//	

}
