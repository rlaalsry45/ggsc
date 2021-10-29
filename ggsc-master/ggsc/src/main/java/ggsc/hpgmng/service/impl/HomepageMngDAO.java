package ggsc.hpgmng.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.hpgmng.service.EduAppVO;
import ggsc.hpgmng.service.FreeBrdVO;
import ggsc.hpgmng.service.HnoticeVO;
import ggsc.hpgmng.service.LibraryVO;
import ggsc.hpgmng.service.NewsVO;
import ggsc.hpgmng.service.OnlineAskVO;

@Repository("hpgmngDao")
public class HomepageMngDAO extends EgovAbstractDAO {

	// 공지사항 목록
	@SuppressWarnings("unchecked")
	public List<EgovMap> getNoticeList(HnoticeVO vo){
		return (List<EgovMap>)list("hpgmngDao.getNoticeList", vo);
	}
	
	// 공지사항 갯수
	public int getNoticeListTotCnt(HnoticeVO vo){
		return (Integer)select("hpgmngDao.getNoticeListTotCnt", vo);
	}
	
	// 공지사항 등록
	public void insertNotice(HnoticeVO vo){
		insert("hpgmngDao.insertNotice", vo);
	}
	
	// 공지사항 파일업로드 등록
	public void insertNoticeUpload(EgovMap map) {
		insert("hpgmngDao.insertNoticeUpload", map);
	}
	
	// 공지사항 수정
	public void updateNotice(HnoticeVO vo) {
		update("hpgmngDao.updateNotice", vo);
	}
	
	
//	// 공지사항 파일업로드 수정
//	public void updateNoticeUpload(NoticeVO vo) {
//		update("hpgmngDao.updateNoticeUpload", vo);
//	}
	
	// 공지사항 상세
	public EgovMap getNoticeDtl(int num){
		return (EgovMap)select("hpgmngDao.getNoticeDtl", num);
	}
	
	// 게시판관리 목록
	@SuppressWarnings("unchecked")
	public List<EgovMap> getFreeBoardList(FreeBrdVO vo){
		return (List<EgovMap>)list("hpgmngDao.getFreeBoardList", vo);
	}
	
	// 게시판관리 갯수
	public int getFreeBoardListTotCnt(FreeBrdVO vo){
		return (Integer)select("hpgmngDao.getFreeBoardListTotCnt", vo);
	}
	
	// 게시판관리 등록
	public void insertFreeBoard(FreeBrdVO vo){
		insert("hpgmngDao.insertFreeBoard", vo);
	}
	
	// 게시판관리 파일업로드 등록
	public void insertFreeBoardUpload(EgovMap map) {
		insert("hpgmngDao.insertFreeBoardUpload", map);
	}
	
	// 게시판관리 수정
	public void updateFreeBoard(FreeBrdVO vo) {
		update("hpgmngDao.updateFreeBoard", vo);
	}
	
	
//	// 게시판관리 파일업로드 수정
//	public void updateFreeBoardUpload(FreeBrdVO vo) {
//		update("hpgmngDao.updateFreeBoardUpload", vo);
//	}
	
	// 게시판관리 상세
	public EgovMap getFreeBoardDtl(int num){
		return (EgovMap)select("hpgmngDao.getFreeBoardDtl", num);
	}
	
	// 문서자료실 목록
	@SuppressWarnings("unchecked")
	public List<EgovMap> getLibraryList(LibraryVO vo){
		return (List<EgovMap>)list("hpgmngDao.getLibraryList", vo);
	}
	
	// 문서자료실 갯수
	public int getLibraryListTotCnt(LibraryVO vo){
		return (Integer)select("hpgmngDao.getLibraryListTotCnt", vo);
	}
	
	// 문서자료실 등록
	public void insertLibrary(LibraryVO vo){
		insert("hpgmngDao.insertLibrary", vo);
	}
	
	// 문서자료실 파일업로드 등록
	public void insertLibraryUpload(EgovMap map) {
		insert("hpgmngDao.insertLibraryUpload", map);
	}
	
	// 문서자료실 수정
	public void updateLibrary(LibraryVO vo) {
		update("hpgmngDao.updateLibrary", vo);
	}
	
//	// 문서자료실 파일업로드 수정
//	public void updateLibraryUpload(LibraryVO vo) {
//		update("hpgmngDao.updateLibraryUpload", vo);
//	}
	
	// 문서자료실 상세
	public EgovMap getLibraryDtl(int num){
		return (EgovMap)select("hpgmngDao.getLibraryDtl", num);
	}
	
	// 센터소식 목록
	@SuppressWarnings("unchecked")
	public List<EgovMap> getCenterNewsList(NewsVO vo){
		return (List<EgovMap>)list("hpgmngDao.getCenterNewsList", vo);
	}
	
	// 센터소식 갯수
	public int getCenterNewsListTotCnt(NewsVO vo){
		return (Integer)select("hpgmngDao.getCenterNewsListTotCnt", vo);
	}
	
	// 센터소식 등록
	public void insertCenterNews(NewsVO vo){
		insert("hpgmngDao.insertCenterNews", vo);
	}
	
	// 센터소식 파일업로드 등록
	public void insertCenterNewsUpload(EgovMap map) {
		insert("hpgmngDao.insertCenterNewsUpload", map);
	}
	
	// 센터소식 수정
	public void updateCenterNews(NewsVO vo) {
		update("hpgmngDao.updateCenterNews", vo);
	}
	
	
//	// 센터소식 파일업로드 수정
//	public void updateCenterNewsUpload(LibraryVO vo) {
//		update("hpgmngDao.updateCenterNewsUpload", vo);
//	}
	
	// 센터소식 상세
	public EgovMap getCenterNewsDtl(int num){
		return (EgovMap)select("hpgmngDao.getCenterNewsDtl", num);
	}
	
	// 온라인상담 목록
	@SuppressWarnings("unchecked")
	public List<EgovMap> getOnlineAskList(OnlineAskVO vo){
		return (List<EgovMap>)list("hpgmngDao.getOnlineAskList", vo);
	}
	
	// 온라인상담 갯수
	public int getOnlineAskListTotCnt(OnlineAskVO vo){
		return (Integer)select("hpgmngDao.getOnlineAskListTotCnt", vo);
	}
	
	// 온라인상담 등록
	public void insertOnlineAsk(OnlineAskVO vo){
		insert("hpgmngDao.insertOnlineAsk", vo);
	}
	
	// 온라인상담 수정
	public void updateOnlineAsk(OnlineAskVO vo) {
		update("hpgmngDao.updateOnlineAsk", vo);
	}
	
	// 온라인상담 상세
	public EgovMap getOnlineAskDtl(int num){
		return (EgovMap)select("hpgmngDao.getOnlineAskDtl", num);
	}
	
	// 교육신청 목록
	@SuppressWarnings("unchecked")
	public List<EgovMap> getEduAppList(EduAppVO vo) {
		return (List<EgovMap>)list("hpgmngDao.getEduAppList", vo);
	}
	
	// 교육신청 갯수
	public int getEduAppListTotCnt(EduAppVO vo) {
		return (Integer)select("hpgmngDao.getEduAppListTotCnt" , vo);
	}
	
	// 교육신청 상세
	public EgovMap getEduAppDtl(int num) {
		return  (EgovMap)select("hpgmngDao.getEduAppDtl", num);
	}
	
	// 교육신청 수정
	public void updateEduApp(EduAppVO vo) {
		update("hpgmngDao.updateEduApp", vo);
	}
	
//	// FAQ 목록
//	@SuppressWarnings("unchecked")
//	public List<EgovMap> getFaqList(FaqVO vo) {
//		return (List<EgovMap>)list("hpgmngDao.getFaqList", vo);
//	}
//	
//	// FAQ 갯수
//	public int getFaqListTotCnt(FaqVO vo) {
//		return (Integer)select("hpgmngDao.getFaqListTotCnt", vo);
//	}
//	
//	// FAQ 등록
//	public void insertFaq(FaqVO vo) {
//		insert("hpgmngDao.insertFaq", vo);
//	}
//		
//	// FAQ 상세
//	public EgovMap getFaqDetail(int num) {
//		return (EgovMap)select("hpgmngDao.getFaqDetail", num);
//	}
//	
//	// FAQ 수정
//	public void updateFaq(FaqVO vo) {
//		update("hpgmngDao.updateFaq", vo);
//	}
//	

}
