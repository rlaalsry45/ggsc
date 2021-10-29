package ggsc.cnsmng.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.cnsmng.service.CnsAcptVO;
import ggsc.cnsmng.service.EalyCnsDocVO;
import ggsc.cnsmng.service.GcnsVO;
import ggsc.cnsmng.service.LinkReqVO;
import ggsc.cnsmng.service.PerCnsVO;
import ggsc.cnsmng.service.PreExamVO;
import ggsc.cnsmng.service.PsyCnsDoc1VO;
import ggsc.cnsmng.service.PsyCnsDoc2VO;
import ggsc.cnsmng.service.PsyCnsDocVO;
import ggsc.cnsmng.service.PsyCnsVO;
import ggsc.cnsmng.service.SupperVisionVO;
import ggsc.cnsmng.service.UserInfoVO;
import ggsc.report.service.CnsEndVO;
import ggsc.support.service.ExcelVO;

@Repository("cnsMngDao")
public class CounselMngDAO extends EgovAbstractDAO {
	
	// 사용자 심리검사 목록
	@SuppressWarnings("unchecked")
	public List<EgovMap> getPsyCnsListUser(int g_idx){
		return (List<EgovMap>)list("cnsMngDao.getPsyCnsListUser", g_idx);
	}
	
	// 상담접수관리 목록
	@SuppressWarnings("unchecked")
	public List<EgovMap> getCnsAcceptList(CnsAcptVO vo){
		return (List<EgovMap>)list("cnsMngDao.getCnsAcceptList", vo);
	}
	
	// 기존상담접수관리 목록
	@SuppressWarnings("unchecked")
	public List<EgovMap> getExiCnsAcceptList(CnsAcptVO vo){
		return (List<EgovMap>)list("cnsMngDao.getExiCnsAcceptList", vo);
	}
	
	// 정보제공상담 목록
	@SuppressWarnings("unchecked")
	public List<EgovMap> getCnsInfoList(CnsAcptVO vo){
		return (List<EgovMap>)list("cnsMngDao.getCnsInfoList", vo);
	}
	
	// 상담접수관리 목록 갯수
	public int getCnsAcptListTotCnt(CnsAcptVO vo){
		return (Integer)select("cnsMngDao.getCnsAcptListTotCnt", vo);
	}
	
	// 기존상담접수관리 목록 갯수
	public int getExiCnsAcptListTotCnt(CnsAcptVO vo){
		return (Integer)select("cnsMngDao.getExiCnsAcptListTotCnt", vo);
	}
	
	public int getCnsInfoListTotCnt(CnsAcptVO vo){
		return (Integer)select("cnsMngDao.getCnsInfoListTotCnt", vo);
	}
	
	// 상담접수신청 ID중복체크
	public int idCheck(String userId){
		return (Integer)select("cnsMngDao.idCheck", userId);
	}
	
	// 상담접수신청 회원등록
	public void insertUser(CnsAcptVO vo){
		insert("cnsMngDao.insertUser", vo);
	}
	
	// 상담접수 신청
	public void insertCnsAccept(CnsAcptVO vo){
		insert("cnsMngDao.insertCnsAccept", vo);
	}
	
	// 정보제공상담 신청
	public void insertCnsInfo(CnsAcptVO vo){
		insert("cnsMngDao.insertCnsInfo", vo);
	}
	
	// 상담접수 상세
	public EgovMap getCnsAcceptDtl(String caseNo){
		return (EgovMap)select("cnsMngDao.getCnsAcceptDtl", caseNo);
	}
	
	// 정보제공상담 상세
	public EgovMap getCnsInfoDtl(int num){
		return (EgovMap)select("cnsMngDao.getCnsInfoDtl",  num);
	}
	
	// 상담접수신청 회원 수정
	public void updateUser(CnsAcptVO vo){
		update("cnsMngDao.updateUser", vo);
	}
	
	// 정보제공상담 회원 수정
	public void updateUserInfo(CnsAcptVO vo){
		update("cnsMngDao.updateUserInfo", vo);
	}
	
	// 상담접수 신청 수정
	public void updateCnsAccept(CnsAcptVO vo){
		update("cnsMngDao.updateCnsAccept", vo);
	}
	
	// 정보제공상담 신청 수정
	public void updateCnsInfo(CnsAcptVO vo){
		update("cnsMngDao.updateCnsInfo", vo);
	}
	
	// 상담접수 신청 확인
	public void updateConfirm(CnsAcptVO vo){
		update("cnsMngDao.updateConfirm", vo);
	}
	
	//엑셀 다운
	@SuppressWarnings("unchecked")
	public List<EgovMap> getCnsAcptListExcel(ExcelVO vo){
		return (List<EgovMap>)list("cnsMngDao.getCnsAcptListExcel", vo);
	}
	
	// 엑셀 다운 (사전검사)
	@SuppressWarnings("unchecked")
	public List<EgovMap> getPretestListExcel(ExcelVO vo) {
		return (List<EgovMap>)list("cnsMngDao.getPretestListExcel", vo);
	}
	
	// 엑셀 다운 (초기상담검사)
	@SuppressWarnings("unchecked")
	public List<EgovMap> getEalyCnsDocListExcel(ExcelVO vo) {
		return (List<EgovMap>)list("cnsMngDao.getEalyCnsDocListExcel", vo);
	}
	
	// 엑셀 다운 (집단상담)
	@SuppressWarnings("unchecked")
	public List<EgovMap> getGcnsListExcel(ExcelVO vo) {
		return (List<EgovMap>)list("cnsMngDao.getGcnsListExcel", vo);
	}
	
	// 엑셀 다운 (개인상담)
	@SuppressWarnings("unchecked")
	public List<EgovMap> getPerCnsListExcel(ExcelVO vo) {
		return (List<EgovMap>)list("cnsMngDao.getPerCnsListExcel", vo);
	}
	
	// 엑셀 다운(연계의뢰서)
	@SuppressWarnings("unchecked")
	public List<EgovMap> getLinkageReqListExcel(ExcelVO vo) {
		return (List<EgovMap>)list("cnsMngDao.getLinkageReqListExcel", vo);
	}
	
	// 회원찾기
	@SuppressWarnings("unchecked")
	public List<EgovMap> findUserPopup(UserInfoVO vo){
		return (List<EgovMap>)list("cnsMngDao.findUserPopup", vo);
	}
	
	// 상담사찾기
	@SuppressWarnings("unchecked")
	public List<EgovMap> findCnsrPopup(UserInfoVO vo){
		return (List<EgovMap>)list("cnsMngDao.findCnsrPopup", vo);
	}
	
	// 노인상담선별척도지 사례번호
	public int getScsreenCnt() {
		return (Integer)select("cnsMngDao.getScsreenCnt");
	}
	
	// 상담동의서 상세보기
	public EgovMap getCnsAgreDocDtl(int caseNum) {
		return (EgovMap)select("cnsMngDao.getCnsAgreDocDtl", caseNum);
	}
	
	// 개인정보동의서 상세보기
	public EgovMap getPrivacyDtl(int caseNum) {
		return (EgovMap)select("cnsMngDao.getPrivacyDtl", caseNum);
	}
	
	// 노인상담선별척도지 상세보기
	public EgovMap getScScreenDtl(int caseNum) {
		return (EgovMap)select("cnsMngDao.getScScreenDtl", caseNum);
	}
	
	// 회원 찾기(명)
	public int getFindUserTotCnt(UserInfoVO vo) {
		return (Integer)select("cnsMngDao.getFindUserTotCnt", vo);
	}
	
	// 상담사 찾기(명)
	public int getFindCnsrTotCnt(UserInfoVO vo) {
		return (Integer)select("cnsMngDao.getFindCnsrTotCnt", vo);
	}
	
	// 개인상담일지 등록 중복등록 체크
	public int getPerCnsRegCheck(int caseNo) {
		return (Integer)select("cnsMngDao.getPerCnsRegCheck", caseNo);
	}
	
	// 초기상담 등록 중복 체크
	public int getEalyCnsleCheck(int caseNo) {
		return (Integer)select("cnsMngDao.getEalyCnsleCheck", caseNo);
	}
	
	// 개인상담 내담자명 찾기 팝업
	@SuppressWarnings("unchecked")
	public List<EgovMap> perCnsFindUserPopup(String userNm) {
		return (List<EgovMap>)list("cnsMngDao.perCnsFindUserPopup", userNm);
	}
	
	// 사전검사 목록
	@SuppressWarnings("unchecked")
	public List<EgovMap> getPreList(PreExamVO vo){
		return (List<EgovMap>)list("cnsMngDao.getPreList", vo);
	}
	
	// 사점검사 목록 총갯수
	public int getPreListTotCnt(PreExamVO vo){
		return (Integer)select("cnsMngDao.getPreListTotCnt", vo);
	}
	
	// 사전검사M 등록
	public void insertPreExamM(PreExamVO vo){
		insert("cnsMngDao.insertPreExamM", vo);
	}
	
	// 상담접수 caseNo 생성(모바일,홈페이지로 상담접수했을 경우)
	public void updateCnsAcceptCaseNo(CnsAcptVO vo) {
		update("cnsMngDao.updateCnsAcceptCaseNo", vo);
	}
	
	// 사전검사D 등록
	public void insertPreExamD(PreExamVO vo){
		insert("cnsMngDao.insertPreExamD", vo);
	}
	
	// 사전검사M 수정
	public void updatePreExamM(PreExamVO vo){
		insert("cnsMngDao.updatePreExamM", vo);
	}
	
	// 사전검사D 수정
	public void updatePreExamD(PreExamVO vo){
		insert("cnsMngDao.updatePreExamD", vo);
	}
	// 사전검사 file 저장
	public void insertPreExamFile(PreExamVO vo){
		insert("cnsMngDao.insertPreExamFile", vo);
	}
	
	// 사전검사-상담동의서 파일 저장
	public void updateCnsAgreDocFile(PreExamVO vo){
		insert("cnsMngDao.updateCnsAgreDocFile", vo);
	}
	// 사전검사-개인정보동의서 파일 저장
	public void updatePerInfoAgreFile(PreExamVO vo){
		insert("cnsMngDao.updatePerInfoAgreFile", vo);
	}
	// 사전검사-노인상담선별척도지 파일 저장
	public void updateDocCntnFile(PreExamVO vo){
		insert("cnsMngDao.updateDocCntnFile", vo);
	}
	
	// 보안서약서 등록
	public void insertCcrtPlgr(PreExamVO vo){
		insert("cnsMngDao.insertCcrtPlgr", vo);
	}
	// 상담동의서 등록
	public void insertCnsAgreDoc(PreExamVO vo){
		insert("cnsMngDao.insertCnsAgreDoc", vo);		
	}
	// 상담동의서 수정
	public void updateCnsAgreDoc(PreExamVO vo) {
		update("cnsMngDao.updateCnsAgreDoc", vo);
	}
	// 개인정보수집이용동의서 등록
	public void insertPerInfoAgre(PreExamVO vo){
		insert("cnsMngDao.insertPerInfoAgre", vo);
	}
	// 개인정보수집이용동의서 수정
	public void updatePerInfoAgre(PreExamVO vo){
		update("cnsMngDao.updatePerInfoAgre", vo);
	}
	// 노인상담선별척도지 등록
	public void insertDocCntnComm(PreExamVO vo){
		insert("cnsMngDao.insertDocCntnComm", vo);
	}
	// 노인상담선별척도지 수정
	public void updateDocCntnComm(PreExamVO vo){
		update("cnsMngDao.updateDocCntnComm", vo);
	}
	// 초기상담신청서 등록
	public void insertEalyCnsDoc(EalyCnsDocVO vo){
		insert("cnsMngDao.insertEalyCnsDoc", vo);
	}
	
	// 초기상담신청서 수정
	public void updateEalyCnsDoc(EalyCnsDocVO vo) {
		update("cnsMngDao.updateEalyCnsDoc", vo);
	}
	
	// 초기상담신청서 목록
	@SuppressWarnings("unchecked")
	public List<EgovMap> getEalyCnsDocList(EalyCnsDocVO vo){
		return (List<EgovMap>)list("cnsMngDao.getEalyCnsDocList", vo);
	}
	// 초기상담신청서 pdf 저장
	public void insertEalyFile(EalyCnsDocVO vo){
		insert("cnsMngDao.insertEalyFile", vo);
	}
	
	// 초기상담신청서 pdf 수정
	public void updateEalyFile(EalyCnsDocVO vo){
		update("cnsMngDao.updateEalyFile", vo);
	}
	
	
	// 초기상담신청서 목록 갯수
	public int getEalyCnsDocListTotCnt(EalyCnsDocVO vo){
		return (Integer)select("cnsMngDao.getEalyCnsDocListTotCnt", vo);
	}
	
	// 초기상담신청서 상세
	public EgovMap getEalyCnsDoc(int caseNo){
		return (EgovMap)select("cnsMngDao.getEalyCnsDoc", caseNo);
	}
	
	// 초기상담신청서 중복 등록 체크
	public int getEalyCnsRegCheck(int caseNo) {
		return (Integer)select("cnsMngDao.getEalyCnsRegCheck", caseNo);
	}
	
	// 상담일지 이력정보 목록
	@SuppressWarnings("unchecked")
	public List<EgovMap> getCnsDiaHysList(EalyCnsDocVO vo) {
		return (List<EgovMap>)list("cnsMngDao.getCnsDiaHysList", vo);
	}
	
	// 개인상담일지 목록 총갯수
	public int getCnsDiaHysListTotCnt(EalyCnsDocVO vo) {
		return (Integer)select("cnsMngDao.getCnsDiaHysListTotCnt", vo);
	}
	
	// 개인상담 재신청 목록
	@SuppressWarnings("unchecked")
	List<EgovMap> getCnsCntReList(EalyCnsDocVO vo) {
		return (List<EgovMap>)list("cnsMngDao.getCnsCntReList", vo);
	}
	
	// 개인상담 종결 목록
	@SuppressWarnings("unchecked")
	public List<EgovMap> getCnsCntEndList(EalyCnsDocVO vo) {
		return (List<EgovMap>)list("cnsMngDao.getCnsCntEndList", vo);
	}
	
	// 개인상담일지 등록
	public void insertPerCns(PerCnsVO vo){
		insert("cnsMngDao.insertPerCns", vo);
	}
	
	// 개인상담일지(상세) 등록
	public void insertPerCnsDtl(PerCnsVO vo){
		insert("cnsMngDao.insertPerCnsDtl", vo);
	}
	// 개인상담일지 pdf 저장
	/*public void insertPerCnsPdf(PerCnsVO vo){
		insert("cnsMngDao.insertPerCnsPdf", vo);
	}*/
	// 개인상담일지 수정
	public void updatePerCns(PerCnsVO vo){
		update("cnsMngDao.updatePerCns", vo);
	}
	
	// 개인상담일지(상세) 수정
	public void updatePerCnsDtl(PerCnsVO vo){
		update("cnsMngDao.updatePerCnsDtl", vo);
	}
	
	// 개인상담일지 상세
	public EgovMap getPerCns(PerCnsVO vo){
		return (EgovMap)select("cnsMngDao.getPerCns", vo);
	}
	
	// 집단상담일지 이력정보 목록
	@SuppressWarnings("unchecked")
	public List<EgovMap> getGcnsList(GcnsVO vo) {
		return (List<EgovMap>)list("cnsMngDao.getGcnsList", vo);
	}
	
	// 집단상담일지 목록 총갯수
	public int getGcnsListTotCnt(GcnsVO vo) {
		return (Integer)select("cnsMngDao.getGcnsListTotCnt", vo);
	}
	
	// 집단상담일지 등록
	/*
	public void insertGcns(GcnsVO vo){
		insert("cnsMngDao.insertGcns", vo);
	}
	*/
	// 집단상담일지(상세) 등록
	public int insertGcnsDtl(GcnsVO vo) throws Exception{
		return (Integer)insert("cnsMngDao.insertGcnsDtl", vo);
	}
	
	// 집단상담일지 등록(개인상담 각각 값 추가)
	public void insertAddPerCns(PerCnsVO vo) {
		insert("cnsMngDao.insertAddPerCns", vo);
	}
	
	// 집단상담 수정(개인상담 각각 수정)
	public void updateAddPerCns(PerCnsVO vo) throws Exception {
		update("cnsMngDao.updateAddPerCns", vo);
	}
	
	// 집단상담 수정(개인상담 각각 삭제)
	public void updateDelPerCns(PerCnsVO vo) throws Exception {
		update("cnsMngDao.updateDelPerCns", vo);
	}
	
	// 집단상담일지 pdf 저장
	/*public void insertGcnsPdf(GcnsVO vo){
		insert("cnsMngDao.insertGcnsPdf", vo);
	}*/
	// 집단상담일지 상세
	public EgovMap getGcns(GcnsVO vo){
		return (EgovMap)select("cnsMngDao.getGcns", vo);
	}
	
	// 집단상담일지(상세) 수정
	public void updateGcnsDtl(GcnsVO vo){
		update("cnsMngDao.updateGcnsDtl", vo);
	}
	
	// 상담내용 목록(심리)
	@SuppressWarnings("unchecked")
	public List<EgovMap> getPsyCnsList(PsyCnsVO vo) {
		return (List<EgovMap>)list("cnsMngDao.getPsyCnsList", vo);
	}
	
	// 상담내용 목록 갯수(심리)
	public int getPsyCnsListTotCnt(PsyCnsVO vo) {
		return (Integer)select("cnsMngDao.getPsyCnsListTotCnt", vo);
	}
	
	// 심리검사지 목록
	@SuppressWarnings("unchecked")
	public List<EgovMap> getExamDocList(PsyCnsVO vo) {
		return (List<EgovMap>)list("cnsMngDao.getExamDocList", vo);
	}
	
	// 상담내용 목록(연계)
	@SuppressWarnings("unchecked")
	public List<EgovMap> getLinkCnsList(LinkReqVO vo) {
		return (List<EgovMap>)list("cnsMngDao.getLinkCnsList", vo);
	}
	
	// 연계의뢰서 목록
	@SuppressWarnings("unchecked")
	public List<EgovMap> getLinkageReqList(LinkReqVO vo) {
		return (List<EgovMap>)list("cnsMngDao.getLinkageReqList", vo);
	}
	
	// 연계의뢰서 목록 갯수
	public int getLinkageReqListTotCnt(LinkReqVO vo) {
		return (Integer)select("cnsMngDao.getLinkageReqListTotCnt", vo);
	}
	
	// 연계의뢰서 등록
	public void insertLinkageInReq(LinkReqVO vo) {
		insert("cnsMngDao.insertLinkageInReq", vo);
	}
	
	// 연계의뢰서 수정
	public void updateLinkageInReq(LinkReqVO vo) {
		update("cnsMngDao.updateLinkageInReq", vo);
	}
	
	// 외부 연계의뢰서 등록
	public void insertLinkageOutReq(LinkReqVO vo) {
		insert("cnsMngDao.insertLinkageOutReq", vo);
	}
	
	// 외부 연계의뢰서 수정
	public void updateLinkageOutReq(LinkReqVO vo) {
		update("cnsMngDao.updateLinkageOutReq", vo);
	}
	
	// 연계의뢰서 상세보기
	public EgovMap getLinkageReqDetail(int num) {
		return (EgovMap)select("cnsMngDao.getLinkageReqDetail", num);
	}
	
	// 연계의뢰서 업로드(연계의뢰서)
	public void insertLinkageReqUpload(LinkReqVO vo) {
		insert("cnsMngDao.insertLinkageReqUpload", vo);
	}
	
	// 연계의뢰서 업로드(공문)
	public void insertLinkageReqUpload2(LinkReqVO vo) {
		insert("cnsMngDao.insertLinkageReqUpload2", vo);
	}
	
	// 연계의뢰서 등록
	public void insertLinkageReq(LinkReqVO vo) {
		insert("cnsMngDao.insertLinkageReq", vo);
	}
	
	// 슈퍼비전 목록
	@SuppressWarnings("unchecked")
	public List<EgovMap> getSuperVisionList(SupperVisionVO svo) {
		return (List<EgovMap>)list("cnsMngDao.getSuperVisionList", svo);
	}
	
	// 슈퍼비전 목록 갯수
	public int getSuperVisionListTotCnt(SupperVisionVO svo) {
		return (Integer)select("cnsMngDao.getSuperVisionListTotCnt", svo);
	}
	
	// 슈퍼비전 의뢰내용 등록
	public void insertSuperVisionReg(SupperVisionVO vo) {
		insert("cnsMngDao.insertSuperVisionReg", vo);
	}
	
	// 슈퍼비전 의뢰내용 수정
	public void updateSuperVisionReg(SupperVisionVO vo) {
		update("cnsMngDao.updateSuperVisionReg", vo);
	}
	
	// 슈퍼비전 의뢰내용 상세
	public EgovMap getSuperVisionDtl(int num) {
		return (EgovMap) select("cnsMngDao.getSuperVisionDtl", num);
	}
	
	// 슈퍼비전 답변내용 등록
	public void insertSuperVisionReplyReg(SupperVisionVO vo) {
		insert("cnsMngDao.insertSuperVisionReplyReg", vo);
	}
	
	// 슈퍼비전 의뢰 테이블 답변컬럼 수정
	public void updateSpAnswerYn(SupperVisionVO vo) {
		update("cnsMngDao.updateSpAnswerYn", vo);
	}
	
	// 슈퍼비전 답변 상세
	public EgovMap getSuperVisionReplyDtl(int num) {
		return (EgovMap) select("cnsMngDao.getSuperVisionReplyDtl", num);
	}
	
	// 슈퍼비전 답변내용 수정
	public void updateSuperVisionReplyReg(SupperVisionVO vo) {
		update("cnsMngDao.updateSuperVisionReplyReg", vo);
	}
	
	// 상담종결서 등록
	public void insertCnsEnd(CnsEndVO vo){
		insert("cnsMngDao.insertCnsEnd", vo);
	}
	
	// 개인상담 M 수정
	public void updateEndPerCnsDtl(CnsEndVO vo) {
		update("cnsMngDao.updateEndPerCnsDtl", vo);
	}
	
	// 상담종결서 PDF
	/*public void insertCnsEndPdf(CnsEndVO vo){
		insert("cnsMngDao.insertCnsEndPdf", vo);
	}*/
	
	
	// 심리 검사 SELECT
	public EgovMap selectPsyCnsDoc(PsyCnsDocVO vo) {
		return (EgovMap) select("cnsMngDao.selectPsyCnsDoc", vo);
	}
	
		
	// 심리 검사 INSERT
	public void insertPsyCnsDoc(PsyCnsDocVO vo) {
		insert("cnsMngDao.insertPsyCnsDoc", vo);
	}
	
	//심리 검사 UPDATE
	public void updatePsyCnsDoc(PsyCnsDocVO vo) {
		update("cnsMngDao.updatePsyCnsDoc", vo);
	}
	
	
	// 상담 사전·사후 기록지 등록
	public void insertPsyCnsDoc1(PsyCnsDoc1VO vo) {
		insert("cnsMngDao.insertPsyCnsDoc1", vo);
	}
	
	// DUKE-AD 기록지 등록
	public void insertPsyCnsDoc2(PsyCnsDoc2VO vo) {
		insert("cnsMngDao.insertPsyCnsDoc2", vo);
	}
	
	// 죽음학대 기록지 등록
	public void insertPsyCnsDoc3(PsyCnsDoc2VO vo) {
		insert("cnsMngDao.insertPsyCnsDoc3", vo);
	}
	
	// 노인우울척도 등록
	public void insertPsyCnsDoc4(PsyCnsDoc2VO vo) {
		insert("cnsMngDao.insertPsyCnsDoc4", vo);
	}
	
	// 노인우울및 자살사고 척도 등록
	public void insertPsyCnsDoc5(PsyCnsDoc2VO vo) {
		insert("cnsMngDao.insertPsyCnsDoc5", vo);
	}
	
	// 대인관계변화척도 등록
	public void insertPsyCnsDoc8(PsyCnsDoc2VO vo) {
		insert("cnsMngDao.insertPsyCnsDoc8", vo);
	}
	
	// 한국형 알코올 중독 선별 검사 등록
	public void insertPsyCnsDoc9(PsyCnsDoc2VO vo)  {
		insert("cnsMngDao.insertPsyCnsDoc9", vo);
	}
	
	// 불안척도 등록
	public void insertPsyCnsDoc10(PsyCnsDoc2VO vo) {
		insert("cnsMngDao.insertPsyCnsDoc10", vo);
	}
	
	// 스트레스 척도 등록
	public void insertPsyCnsDoc11(PsyCnsDoc2VO vo) {
		insert("cnsMngDao.insertPsyCnsDoc11", vo);
	}
	
	// 사별 스트레스 척도 등록
	public void insertPsyCnsDoc12(PsyCnsDoc2VO vo) {
		insert("cnsMngDao.insertPsyCnsDoc12", vo);
	}
	
	// 부부의사소통 척도 등록
	public void insertPsyCnsDoc14(PsyCnsDoc2VO vo) {
		insert("cnsMngDao.insertPsyCnsDoc14", vo);
	}
	
	// 문장완성검사 등록
	public void insertPsyCnsDoc15(PsyCnsDoc2VO vo) {
		insert("cnsMngDao.insertPsyCnsDoc15", vo);
	}
	
	// 치매선별용 한국어판 간이정신상태검사 등록
	public void insertPsyCnsDoc16(PsyCnsDoc2VO vo) {
		insert("cnsMngDao.insertPsyCnsDoc16", vo);
	}
	
	public void deleteUser(String caseNo) {
		update("cnsMngDao.deleteUser", caseNo);
	}
	
	public void deleteCnsAccept(String caseNo) {
		update("cnsMngDao.deleteCnsAccept", caseNo);
	}
	
	public void deletePreExamM(String caseNo) {
		update("cnsMngDao.deletePreExamM", caseNo);
	}
	
	public void deleteCnsAgre(String caseNo) {
		update("cnsMngDao.deleteCnsAgre", caseNo);
	}
	
	public void deletePerInfo(String caseNo) {
		update("cnsMngDao.deletePerInfo", caseNo);
	}
	
	public void deleteDocCntn(String caseNo) {
		update("cnsMngDao.deleteDocCntn", caseNo);
	}
	
	public void deleteEalyCnsDoc(String caseNo) {
		update("cnsMngDao.deleteEalyCnsDoc", caseNo);
	}
	
	public void deletePerCnsDtl(String caseNo) {
		update("cnsMngDao.deletePerCnsDtl", caseNo);
	}
	
	public void deletePsyCnsDocDtl(String caseNo) {
		update("cnsMngDao.deletePsyCnsDocDtl", caseNo);
	}
	
	public void deleteExiPsyCnsDocDtl(Map<String, Object> map) {
		update("cnsMngDao.deleteExiPsyCnsDocDtl", map);
	}
	
	public void deleteLinkReq(String caseNo) {
		update("cnsMngDao.deleteLinkReq", caseNo);
	}
	
	public void deleteCnsEnd(String caseNo) {
		update("cnsMngDao.deleteCnsEnd", caseNo);
	}
	
	public void updateExiCnsAccept(String caseNo) {
		update("cnsMngDao.updateExiCnsAccept", caseNo);
	}
	
	public void deleteCnsInfo(String userId) {
		update("cnsMngDao.deleteCnsInfo", userId);
	}
	
	public void deleteUserInfo(String userId) {
		update("cnsMngDao.deleteUserInfo", userId);
	}
	
	public void deleteGcns(int num) {
		update("cnsMngDao.deleteGcns", num);
	}
	
	public void deleteGcnsPer(int num) {
		update("cnsMngDao.deleteGcnsPer", num);
	}
}
