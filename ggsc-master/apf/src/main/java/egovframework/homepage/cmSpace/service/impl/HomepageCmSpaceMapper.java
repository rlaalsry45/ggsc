package egovframework.homepage.cmSpace.service.impl;

import java.util.List;

import egovframework.homepage.cmSpace.service.CmSpaceVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("homepageCmSpaceMapper")
public interface HomepageCmSpaceMapper {

	// 공지사항 목록
	List<EgovMap> getNoticeList(CmSpaceVO vo);
	
	// 공지사항 목록 갯수
	int getNoticeTotal(CmSpaceVO vo); 
	
	// 공지사항 등록
	void insertNoticeReg(CmSpaceVO vo);
	
	// 공지사항 파일업로드 등록
	void insertNoticeFileUpload(CmSpaceVO vo);
	
	// 공지사항 상세
	EgovMap getNoticeDtl(CmSpaceVO vo);
	
	// 공지사항 조회수 증가
	void updateNoticeViewCount(int num);
	
	// 센터소식 목록
	List<EgovMap> getCenterNewsList(CmSpaceVO vo);
	
	// 메인화면 센터소식(보여질 목록 3개)
	List<EgovMap> getCenterNewsListM(CmSpaceVO vo);
	
	// 센터목록 갯수
	int getCenterNewsTotal(CmSpaceVO vo);
	
	// 센터소식 등록
	void insertCenterNewsReg(CmSpaceVO vo);
	
	// 센터소식 파일업로드 등록
	void insertCenterNewsFileUpload(CmSpaceVO vo);
	
	// 센터소식 조회수 증가
	void updateCenterNewsViewCount(int num);
	
	// 센터소식 상세
	EgovMap getCenterNewsDtl(CmSpaceVO vo);
	
	// 문서자료실 목록
	List<EgovMap> getDocLibraryList(CmSpaceVO vo);
	
	// 메인화면 문서자료실(보여질 목록 4개)
	List<EgovMap> getDocLibraryListM(CmSpaceVO vo);
	
	// 문서자료실 목록 갯수
	int getDocLibraryTotal(CmSpaceVO vo);
	
	// 문서자료실 등록
	void insertDocLibraryReg(CmSpaceVO vo);
	
	// 문서자료실 파일업로드 등록
	void insertDocLibraryFileUpload(CmSpaceVO vo);
	
	// 문서자료실 조회수 증가
	void updateDocLibraryViewCount(int num);
	
	// 문서자료실 상세
	EgovMap getDocLibraryDtl(CmSpaceVO vo);
	
	// 자유게시판 목록
	List<EgovMap> getFreeBoardList(CmSpaceVO vo);
	
	// 메인화면 자유게시판(보여질 목록 4개)
	List<EgovMap> getFreeBoardListM(CmSpaceVO vo);
	
	// 자유게시판 목록 갯수
	int getFreeBoardTotal(CmSpaceVO vo);
	
	// 자유게시판 등록
	void insertFreeBoardReg(CmSpaceVO vo);
	
	// 자유게시판 파일업로드 등록
	void insertFreeBoardFileUpload(CmSpaceVO vo);
	
	// 자유게시판 조회수 증가
	void updateFreeBoardViewCount(int num);
	
	// 자유게시판 상세
	EgovMap getFreeBoardDtl(CmSpaceVO vo);
	
	// 온라인상담 목록
	List<EgovMap> getOnlineCnsList(CmSpaceVO vo);
	
	// 온라인상담 목록 갯수
	int getOnlineCnsTotal(CmSpaceVO vo);
	
	// 온라인상담 등록
	void insertOnlineCnsReg(CmSpaceVO vo);
	
	// 온라인상담 파일업로드 등록
	void insertOnlineCnsFileUpload(CmSpaceVO vo);
	
	// 온라인상담 상세
	EgovMap getOnlineCnsDtl(CmSpaceVO vo);
	
}
