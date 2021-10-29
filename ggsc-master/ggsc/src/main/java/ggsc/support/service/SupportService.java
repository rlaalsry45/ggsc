package ggsc.support.service;
 
import java.util.List;

import com.daou.ppurio.mmsVO;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface SupportService {
	
	// 공지사항 목록
	List<EgovMap> getNoticeList(NoticeVO vo);
	
	// 공지사항 갯수
	int getNoticeListTotCnt(NoticeVO vo);
	
	// 공지사항 등록
	void insertNotice(NoticeVO vo);
	
	// 공지사항 수정
	void updateNotice(NoticeVO vo);
	
	// 공지사항 상세
	EgovMap getNoticeDtl(int num);
	
	// FAQ 목록
	List<EgovMap> getFaqList(FaqVO vo);
	
	// FAQ 갯수
	int getFaqListTotCnt(FaqVO vo);
	
	// FAQ 등록
	void insertFaq(FaqVO vo);
	
	// FAQ 상세
	EgovMap getFaqDetail(int num);
	
	// FAQ 수정
	void updateFaq(FaqVO vo);
	
	// 자료실 목록
	List<EgovMap> getRescRoomList(RescRoomVO vo);
	
	// 자료실 갯수
	int getRescRoomListTotCnt(RescRoomVO vo);
	
	// 자료실 등록
	void insertRescRoom(RescRoomVO vo);
	
	// 자료실 상세
	EgovMap getRescRoomDetail(int num);
	
	// 자료실 수정
	void updateRescRoom(RescRoomVO vo);
	
	// 사용자메뉴얼 목록
	List<EgovMap> getUserManualList(UserManualVO vo);
	
	// 사용자메뉴얼 갯수
	int getUserManualListTotCnt(UserManualVO vo);
	
	// 사용자메뉴얼 상세
	EgovMap getUserManualDetail(int num);
	
	// 사용자메뉴얼 등록
	void insertUserManual(UserManualVO vo);
	
	// 사용자메뉴얼 수정
	void updateUserManual(UserManualVO vo);
	
	// 설문관리 목록
	List<EgovMap> getSurveyMngList(SurveyMngVO vo);
	
	// 설문관리 갯수
	int getSurveyMngListTotCnt(SurveyMngVO vo);
	
	// 설문관리 상세
	EgovMap getSurveyMngDetail(int num);
	
	// 설문관리 등록
	void insertSurveyMng(SurveyMngVO vo);
	
	// 설문관리 수정
	void updateSurveyMng(SurveyMngVO vo);
	
	// 서명관리 목록
	List<EgovMap> getSignList(SignVO vo);
	
	// 서명관리 갯수
	int getSignListTotCnt(SignVO vo);
	
	// 서명관리 등록
	void insertSign(SignVO vo);
	
	// 서명관리 상세
	EgovMap getSignDetail(SignVO vo);
	
	// 서명관리 수정
	void updateSign(SignVO vo);
	
	// 메일관리 등록
	void insertMail(MailVO vo);
	
	// 서명관리 목록
	List<EgovMap> listMms(mmsVO vo);
	
	// 서명관리 갯수
	int countMms(mmsVO vo);
	
	// 서명관리 등록
	void insertMms(mmsVO vo);
	
	// 서명관리 상세
	EgovMap selectMms(mmsVO vo);
	
	// 개인정보동의 PDF
	EgovMap PDFDownload(PdfVO vo, String sqlName);
}
