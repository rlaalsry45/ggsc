package ggsc.cnsmng.service;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.report.service.CnsEndVO;
import ggsc.support.service.ExcelVO;

public interface CounselMngService {
	
	// 사용자 심리검사 목록
	List<EgovMap> getPsyCnsListUser(int g_idx);
	
	// 상담접수관리 목록
	List<EgovMap> getCnsAcceptList(CnsAcptVO vo);
	
	// 기존상담접수관리 목록
	List<EgovMap> getExiCnsAcceptList(CnsAcptVO vo);
	
	// 정보제공상담 목록
	List<EgovMap> getCnsInfoList(CnsAcptVO vo);
	
	// 상담접수관리 목록 갯수
	int getCnsAcptListTotCnt(CnsAcptVO vo);
	
	// 기존상담접수관리 갯수
	int getExiCnsAcptListTotCnt(CnsAcptVO vo);
	
	// 정보제공상담 목록 갯수
	int getCnsInfoListTotCnt(CnsAcptVO vo);
	
	// 상담접수 신청 - 아이디 중복 체크
	int idCheck(String userId);
	
	// 상담접수 회원등록
	void insertUser(CnsAcptVO vo);
	
	// 상담접수 신청
	void insertCnsAccept(CnsAcptVO vo);
	
	// 상담접수 신청
	void insertCnsInfo(CnsAcptVO vo);
	
	// 상담정수 상세
	EgovMap getCnsAcceptDtl(String caseNo);
	
	// 정보제공상담 상세
	EgovMap getCnsInfoDtl(int num);
	
	// 상담접수 회원 수정
	void updateUser(CnsAcptVO vo);
	
	// 정보제공상담 회원 수정
	void updateUserInfo(CnsAcptVO vo);
	
	// 상담접수 신청 수정
	void updateCnsAccept(CnsAcptVO vo);
	
	// 정보제공상담 신청 수정
	void updateCnsInfo(CnsAcptVO vo);
	
	// 상담접수 신청 확인
	void updateConfirm(CnsAcptVO vo, String cnsrId);
	
	// 상담접수 caseNo 생성(모바일,홈페이지로 상담접수했을 경우)
	void updateCnsAcceptCaseNo(CnsAcptVO vo);
	
	// 엑셀 다운 (상담접수)
	List<EgovMap> getCnsAcptListExcel(ExcelVO vo);
	
	// 엑셀 다운 (사전검사)
	List<EgovMap> getPretestListExcel(ExcelVO vo);
	
	// 엑셀 다운 (초기상담검사)
	List<EgovMap> getEalyCnsDocListExcel(ExcelVO vo);	
	
	// 엑셀 다운 (집단상담)
	List<EgovMap> getGcnsListExcel(ExcelVO vo);	
	
	// 엑셀 다운 (개인상담)
	List<EgovMap> getPerCnsListExcel(ExcelVO vo);
	
	// 엑셀 다운(연계의뢰서)
	List<EgovMap> getLinkageReqListExcel(ExcelVO vo);
	
	// 회원 찾기
	List<EgovMap> findUserPopup(UserInfoVO vo);
	
	// 상담사 찾기
	List<EgovMap> findCnsrPopup(UserInfoVO vo);
	
	// 노인상담선별척도지 사례번호
	int getScsreenCnt();
	
	// 상담동의서 상세보기
	EgovMap getCnsAgreDocDtl(int caseNum);
	
	// 개인정보동의서 상세보기
	EgovMap getPrivacyDtl(int caseNum);
	
	// 노인상담선별척도지 상세보기
	EgovMap getScScreenDtl(int caseNum);
	
	// 회원 찾기(명)
	int getFindUserTotCnt(UserInfoVO vo);
	
	// 상담사 찾기(명)
	int getFindCnsrTotCnt(UserInfoVO vo);
	
	// 개인상담일지 등록 중복등록 체크
	int getPerCnsRegCheck(int caseNo);
	
	// 초기상담 등록 중복 체크
	int getEalyCnsleCheck(int caseNo);
	
	// 개인상담 내담자명 찾기 팝업
	List<EgovMap> perCnsFindUserPopup(String userNm);
	
	// 사전검사 목록
	List<EgovMap> getPreList(PreExamVO vo);
	
	// 사전검사 목록 총갯수
	int getPreListTotCnt(PreExamVO vo);
	
	// 사전검사M 등록
	void insertPreExamM(PreExamVO vo);
	
	// 사전검사M 수정
	void updatePreExamD(PreExamVO vo);
	
	// 사전검사D 등록
	void insertPreExamD(PreExamVO vo);
	
	// 보안서약서 등록
	void insertCcrtPlgr(PreExamVO vo);
	
	// 초기상담신청서 등록
	void insertEalyCnsDoc(EalyCnsDocVO vo);
	
	// 초기상담신청서 수정
	void updateEalyCnsDoc(EalyCnsDocVO vo);
	
	// 초기상담신청서 목록
	List<EgovMap> getEalyCnsDocList(EalyCnsDocVO vo);
	
	// 초기상담신청서 목록 총갯수
	int getEalyCnsDocListTotCnt(EalyCnsDocVO vo);
	
	// 초기상담신청서 상세
	EgovMap getEalyCnsDoc(int caseNo);
	
	// 초기상담신청서 중복 등록 체크
	int getEalyCnsRegCheck(int caseNo);
	
	// 개인상담일지 이력정보 목록 
	List<EgovMap> getCnsDiaHysList(EalyCnsDocVO vo);
	
	// 개인상담일지 목록 총갯수
	int getCnsDiaHysListTotCnt(EalyCnsDocVO vo);
	
	// 개인상담 재신청 목록
	List<EgovMap> getCnsCntReList(EalyCnsDocVO vo);
	
	// 개인상담 재신청 목록 총갯수
	
	
	// 개인상담 종결 목록
	List<EgovMap> getCnsCntEndList(EalyCnsDocVO vo);
	
	
	// 개인상담일지 등록
	void insertPerCns(PerCnsVO vo);
	
	// 개인상담일지 수정
	void updatePerCns(PerCnsVO vo);
	
	// 개인상담일지 상세
	EgovMap getPerCns(PerCnsVO vo);
	
	// 집단상담일지 이력정보 목록 
	List<EgovMap> getGcnsList(GcnsVO vo);
	
	// 집단상담일지 목록 총갯수
	int getGcnsListTotCnt(GcnsVO vo);
	
	// 집단상담일지 등록
	void insertGcns(GcnsVO vo) throws Exception;
	
	// 집단상담일지 등록(내담자 수정시)
	void insertUpdGcns(GcnsVO vo) throws Exception;
	
	// 집단상담일지 상세
	EgovMap getGcns(GcnsVO vo);
	
	// 집단상담일지 수정
	void updateGcns(GcnsVO vo) throws Exception;
		
	// 상담내용 목록(심리)
	List<EgovMap> getPsyCnsList(PsyCnsVO vo);
	
	// 상담내용 목록 갯수(심리)
	int getPsyCnsListTotCnt(PsyCnsVO vo);
	
	// 심리검사지 목록
	List<EgovMap> getExamDocList(PsyCnsVO vo);
	
	// 상담내용 목록(연계)
	List<EgovMap> getLinkCnsList(LinkReqVO vo);
	
	// 연계의뢰서 목록
	List<EgovMap> getLinkageReqList(LinkReqVO vo);
	
	// 연계의뢰서 목록 갯수
	int getLinkageReqListTotCnt(LinkReqVO vo);
	
	// 내부 연계의뢰서 등록
	void insertLinkageInReq(LinkReqVO vo);
	
	// 내부 연계의뢰서 수정
	void updateLinkageInReq(LinkReqVO vo);
	
	// 외부 연계의뢰서 등록
	void insertLinkageOutReq(LinkReqVO vo);
	
	// 외부 연계의뢰서 수정
	void updateLinkageOutReq(LinkReqVO vo);
	
	// 연계의뢰서 상세보기
	EgovMap getLinkageReqDetail(int num);
	
	// 연계의뢰서 업로드
	void insertLinkageReqUpload(LinkReqVO vo);
	
	// 연계의뢰서 등록
	void insertLinkageReq(LinkReqVO vo);
	
	// 슈퍼비전 목록
	List<EgovMap> getSuperVisionList(SupperVisionVO svo);
	
	// 슈퍼비전 목록 갯수
	int getSuperVisionListTotCnt(SupperVisionVO svo);
	
	// 슈퍼비전 의뢰내용 등록
	void insertSuperVisionReg(SupperVisionVO vo);
	
	// 슈퍼비전 의뢰내용 수정
	void updateSuperVisionReg(SupperVisionVO vo);
	
	// 슈퍼비전 의뢰내용 상세
	EgovMap getSuperVisionDtl(int num);
	
	// 슈퍼비전 답변내용 등록
	void insertSuperVisionReplyReg(SupperVisionVO vo);
	
	// 슈퍼비전 답변 상세
	EgovMap getSuperVisionReplyDtl(int num);
	
	// 슈퍼비전 답변내용 수정
	void updateSuperVisionReplyReg(SupperVisionVO vo);
	
	// 상담종결서 등록
	void insertCnsEnd(CnsEndVO vo);
	
	// 심리 검사 SELECT
	EgovMap selectPsyCnsDoc(PsyCnsDocVO vo);
		
	// 심리 검사 INSERT
	void insertPsyCnsDoc(PsyCnsDocVO vo);
	
	// 심리 검사 UPDATE
	void updatePsyCnsDoc(PsyCnsDocVO vo);
	
	// 상담 사전·사후 기록지 등록
	void insertPsyCnsDoc1(PsyCnsDoc1VO vo);
	
	// DUKE-AD 기록지 등록
	void insertPsyCnsDoc2(PsyCnsDoc2VO vo);
	
	// 죽음학대 기록지 등록
	void insertPsyCnsDoc3(PsyCnsDoc2VO vo);
	
	// 노인우울척도
	void insertPsyCnsDoc4(PsyCnsDoc2VO vo);
	
	// 노인우울및 자살사고 척도 등록
	void insertPsyCnsDoc5(PsyCnsDoc2VO vo);
	
	// 대인관계변화척도 등록
	void insertPsyCnsDoc8(PsyCnsDoc2VO vo);
	
	// 한국형 알코올 중독 선별 검사 등록
	void insertPsyCnsDoc9(PsyCnsDoc2VO vo);
	
	// 불안척도 등록
	void insertPsyCnsDoc10(PsyCnsDoc2VO vo);
	
	// 스트레스 척도 등록
	void insertPsyCnsDoc11(PsyCnsDoc2VO vo);
	
	// 사별 스트레스 척도 등록
	void insertPsyCnsDoc12(PsyCnsDoc2VO vo);
	
	// 부부의사소통 척도 등록
	void insertPsyCnsDoc14(PsyCnsDoc2VO vo);
	
	// 문장완성검사 등록
	void insertPsyCnsDoc15(PsyCnsDoc2VO vo);
	
	// 치매선별용 한국어판 간이정신상태검사 등록
	void insertPsyCnsDoc16(PsyCnsDoc2VO vo);
	
	// 기존상담관리부터 일괄 삭제
	void deleteExiCnsAcpt(String caseNo);
	
	void updateExiCnsAcpt(String caseNo);

	// 초기상담부터 일괄 삭제
	void deleteExiEalyCnsDoc(String caseNo);
	
	// 개인상담부터 일괄 삭제
	public void deleteExiPerCnsDoc(Map<String, Object> map);
	
	// 정보제공상담(유저도) 삭제
	void deleteCnsInfo(String userId);
	
	// 집단상담(개인상담도) 삭제
	void deleteGcns(int num);
	
	
}
