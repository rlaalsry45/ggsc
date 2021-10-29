package ggsc.cnsmng.service.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.StringReader;
import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.itextpdf.text.Document;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.tool.xml.XMLWorker;
import com.itextpdf.tool.xml.XMLWorkerFontProvider;
import com.itextpdf.tool.xml.XMLWorkerHelper;
import com.itextpdf.tool.xml.css.CssFile;
import com.itextpdf.tool.xml.css.StyleAttrCSSResolver;
import com.itextpdf.tool.xml.html.CssAppliers;
import com.itextpdf.tool.xml.html.CssAppliersImpl;
import com.itextpdf.tool.xml.html.Tags;
import com.itextpdf.tool.xml.parser.XMLParser;
import com.itextpdf.tool.xml.pipeline.css.CSSResolver;
import com.itextpdf.tool.xml.pipeline.css.CssResolverPipeline;
import com.itextpdf.tool.xml.pipeline.end.PdfWriterPipeline;
import com.itextpdf.tool.xml.pipeline.html.HtmlPipeline;
import com.itextpdf.tool.xml.pipeline.html.HtmlPipelineContext;

import ams.cmm.AMSComm;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.cnsmng.service.CnsAcptVO;
import ggsc.cnsmng.service.CounselMngService;
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

@Service("counselMngService")
public class CounselMngServiceImpl extends EgovAbstractServiceImpl implements CounselMngService {
	
	@Resource(name="cnsMngDao")
    private CounselMngDAO cnsMngDao;
	
	// 사용자 심리검사 목록
	@Override
	public List<EgovMap> getPsyCnsListUser(int g_idx) {
		return cnsMngDao.getPsyCnsListUser(g_idx);
	}
	
	// 상담접수관리 목록
	@Override
	public List<EgovMap> getCnsAcceptList(CnsAcptVO vo) {
		return cnsMngDao.getCnsAcceptList(vo);
	}
	
	// 기존상담접수관리 목록
	@Override
	public List<EgovMap> getExiCnsAcceptList(CnsAcptVO vo) {
		return cnsMngDao.getExiCnsAcceptList(vo);
	}
	
	// 정보제공상담 목록
	@Override
	public List<EgovMap> getCnsInfoList(CnsAcptVO vo) {
		return cnsMngDao.getCnsInfoList(vo);
	}
	
	@Override
	public int getCnsAcptListTotCnt(CnsAcptVO vo) {
		return cnsMngDao.getCnsAcptListTotCnt(vo);
	}
	
	@Override
	public int getExiCnsAcptListTotCnt(CnsAcptVO vo) {
		return cnsMngDao.getExiCnsAcptListTotCnt(vo);
	}
	
	@Override
	public int getCnsInfoListTotCnt(CnsAcptVO vo) {
		return cnsMngDao.getCnsInfoListTotCnt(vo);
	}
	
	// 상담접수신청 ID중복 체크
	@Override
	public int idCheck(String userId) {
		return cnsMngDao.idCheck(userId);
	}
	
	// 상담접수신청 회원등록
	@Override
	public void insertUser(CnsAcptVO vo) {
		cnsMngDao.insertUser(vo);
	}
	
	// 상담접수 신청
	@Override
	public void insertCnsAccept(CnsAcptVO vo) {
		cnsMngDao.insertCnsAccept(vo);
	}
	
	// 정보제공상담 신청
	@Override
	public void insertCnsInfo(CnsAcptVO vo) {
		cnsMngDao.insertCnsInfo(vo);
	}
	
	// 상담접수 상세
	@Override
	public EgovMap getCnsAcceptDtl(String caseNo) {
		return cnsMngDao.getCnsAcceptDtl(caseNo);
	}
	
	// 정보제공상담 상세
	@Override
	public EgovMap getCnsInfoDtl(int num) {
		return cnsMngDao.getCnsInfoDtl(num);
	}
	
	// 상담접수신청 회원수정
	@Override
	public void updateUser(CnsAcptVO vo) {
		cnsMngDao.updateUser(vo);
	}
	
	// 정보제공상담 회원수정
	@Override
	public void updateUserInfo(CnsAcptVO vo) {
		cnsMngDao.updateUserInfo(vo);
	}
	
	// 상담접수 신청 수정
	@Override
	public void updateCnsAccept(CnsAcptVO vo) {
		cnsMngDao.updateCnsAccept(vo);
	}
	
	// 정보제공상담 신청 수정
	@Override
	public void updateCnsInfo(CnsAcptVO vo) {
		cnsMngDao.updateCnsInfo(vo);
	}

	// 상담접수 신청 확인
	@Override
	public void updateConfirm(CnsAcptVO vo, String cnsrId) {
		cnsMngDao.updateConfirm(vo);
		PreExamVO preVO = new PreExamVO();
		preVO.setCaseNo(vo.getCaseNo());
		preVO.setCnsleId(vo.getUserId());
		preVO.setCnsleNm(vo.getUserNm());
		preVO.setCnsGb(vo.getCnsGb());
		preVO.setZoneGb(vo.getZoneGb());
		preVO.setLocalGb(vo.getLocalGb());
		preVO.setCenterGb(vo.getCenterGb());
		preVO.setSigunCd(vo.getSigunCd());
		preVO.setCnsrId(cnsrId);
		preVO.setDocGb("1");
		preVO.setRegId(vo.getRegId());
		preVO.setExamDocCd("0");
		cnsMngDao.insertPreExamM(preVO);
		cnsMngDao.insertPreExamFile(preVO);
		// cnsMngDao.insertPreExamD(preVO);
		
	}
	
	// 상담접수 caseNo 생성(모바일,홈페이지로 상담접수했을 경우)
	@Override
	public void updateCnsAcceptCaseNo(CnsAcptVO vo) {
		cnsMngDao.updateCnsAcceptCaseNo(vo);
	}
	
	// 엑셀 다운 (상담접수)
	@Override
	public List<EgovMap> getCnsAcptListExcel(ExcelVO vo) {
		return cnsMngDao.getCnsAcptListExcel(vo);
	}
	
	// 엑셀 다운 (사전검사)
	@Override
	public List<EgovMap> getPretestListExcel(ExcelVO vo) {
		return cnsMngDao.getPretestListExcel(vo);
	}
	
	// 엑셀 다운 (초기상담검사)
	public List<EgovMap> getEalyCnsDocListExcel(ExcelVO vo) {
		return cnsMngDao.getEalyCnsDocListExcel(vo);
	}
	
	// 엑셀 다운 (집단상담)
	public List<EgovMap> getGcnsListExcel(ExcelVO vo) {
		return cnsMngDao.getGcnsListExcel(vo);
	}
	
	// 엑셀 다운 (개인상담)
	public List<EgovMap> getPerCnsListExcel(ExcelVO vo) {
		return cnsMngDao.getPerCnsListExcel(vo);
	}
	
	// 엑셀 다운(연계의뢰서)
	public List<EgovMap> getLinkageReqListExcel(ExcelVO vo) {
		return cnsMngDao.getLinkageReqListExcel(vo);
	}
	
	// 회원찾기
	@Override
	public List<EgovMap> findUserPopup(UserInfoVO vo) {
		return cnsMngDao.findUserPopup(vo);
	}
	
	// 상담사 찾기
	@Override
	public List<EgovMap> findCnsrPopup(UserInfoVO vo) {
		return cnsMngDao.findCnsrPopup(vo);
	}
	
	// 노인상담선별척도지 사례번호
	@Override
	public int getScsreenCnt() {
		return cnsMngDao.getScsreenCnt();
	}
	
	// 상담동의서 상세보기
	@Override
	public EgovMap getCnsAgreDocDtl(int caseNum) {
		return cnsMngDao.getCnsAgreDocDtl(caseNum);
	}
	
	// 개인정보동의서 상세보기
	@Override
	public EgovMap getPrivacyDtl(int caseNum) {
		return cnsMngDao.getPrivacyDtl(caseNum);
	}
	
	// 노인상담선별척도지 상세보기
	@Override
	public EgovMap getScScreenDtl(int caseNum) {
		return cnsMngDao.getScScreenDtl(caseNum);
	}
	
	// 회원 찾기(명)
	@Override
	public int getFindUserTotCnt(UserInfoVO vo) {
		return cnsMngDao.getFindUserTotCnt(vo);
	}
	
	// 상담사 찾기(명)
	@Override
	public int getFindCnsrTotCnt(UserInfoVO vo) {
		return cnsMngDao.getFindCnsrTotCnt(vo);
	}
	
	// 개인상담일지 등록 중복등록 체크
	@Override
	public int getPerCnsRegCheck(int caseNo) {
		return cnsMngDao.getPerCnsRegCheck(caseNo);
	}
	
	// 초기상담 등록 중복 체크
	@Override
	public int getEalyCnsleCheck(int caseNo) {
		return cnsMngDao.getEalyCnsleCheck(caseNo);
	}
	
	// 개인상담 내담자명 찾기 팝업
	@Override
	public List<EgovMap> perCnsFindUserPopup(String userNm) {
		return cnsMngDao.perCnsFindUserPopup(userNm);
	}
	
	// 사전검사 목록
	@Override
	public List<EgovMap> getPreList(PreExamVO vo) {
		return cnsMngDao.getPreList(vo);
	}
	
	// 사전검사 목록 총갯수
	@Override
	public int getPreListTotCnt(PreExamVO vo) {
		return cnsMngDao.getPreListTotCnt(vo);
	}
	
	// 사전검사M 등록
	@Transactional
	@Override
	public void insertPreExamM(PreExamVO vo) {
		// cnsMngDao.updatePreExamM(vo);
		// cnsMngDao.updatePreExamD(vo);
		if(vo.getFile().getSize() != 0 && vo.getWriteYn().equals("N")){	// 사전검사 file 등록
			// DB에 파일 저장
			// cnsMngDao.insertPreExamFile(vo);
			cnsMngDao.updatePreExamM(vo);
			// 상담동의서 파일 등록
			if(vo.getExamDocCd().equals("2")) {
				// 파일 서버에 저장
				MultipartFile file = vo.getFile();
				EgovMap fMap = AMSComm.fileUpload(file, "cnsagredoc");
				vo.setFileNm((String)fMap.get("fileNm"));
				vo.setSysFileNm((String)fMap.get("sysFileNm"));
				vo.setFilePath((String)fMap.get("filePath"));
				// DB에 파일 저장
				cnsMngDao.updateCnsAgreDocFile(vo);
			}
			// 개인정보동의서 파일 등록
			if(vo.getExamDocCd().equals("3")) {
				// 파일 서버에 저장
				MultipartFile file = vo.getFile();
				EgovMap fMap = AMSComm.fileUpload(file, "perinfoagre");
				vo.setFileNm((String)fMap.get("fileNm"));
				vo.setSysFileNm((String)fMap.get("sysFileNm"));
				vo.setFilePath((String)fMap.get("filePath"));
				// DB에 파일 저장
				cnsMngDao.updatePerInfoAgreFile(vo);
			}
			// 노인상담선별척도지 파일 등록
			if(vo.getExamDocCd().equals("4")) {
				// 파일 서버에 저장
				MultipartFile file = vo.getFile();
				EgovMap fMap = AMSComm.fileUpload(file, "doccntn");
				vo.setFileNm((String)fMap.get("fileNm"));
				vo.setSysFileNm((String)fMap.get("sysFileNm"));
				vo.setFilePath((String)fMap.get("filePath"));
				// DB에 파일 저장
				cnsMngDao.updateDocCntnFile(vo);
			}
			/*// 파일 서버에 저장
			MultipartFile file = vo.getFile();
			EgovMap fMap = AMSComm.fileUpload(file, "preexam");
			vo.setFileNm((String)fMap.get("fileNm"));
			vo.setSysFileNm((String)fMap.get("sysFileNm"));
			vo.setFilePath((String)fMap.get("filePath"));*/
		}else{
			if(vo.getExamDocCd().equals("1")){
				// 보안서약서 등록
				cnsMngDao.insertCcrtPlgr(vo);
			}else if(vo.getExamDocCd().equals("2")){
				// 상담동의서 등록
				//vo.setAgrePath(vo.getSysFileNm());
				cnsMngDao.insertCnsAgreDoc(vo);
				cnsMngDao.updatePreExamM(vo);
			}else if(vo.getExamDocCd().equals("3")){
				// 개인정보동의서
				//vo.setPerInfoPath(vo.getSysFileNm());
				cnsMngDao.insertPerInfoAgre(vo);
				cnsMngDao.updatePreExamM(vo);
			}else if(vo.getExamDocCd().equals("4")){
				// 노인상담선별척도지
				//vo.setDocCntnPath(vo.getSysFileNm());
				cnsMngDao.insertDocCntnComm(vo);
				cnsMngDao.updatePreExamM(vo);
			}
		}
		// DB에 파일 저장
		// cnsMngDao.insertPreExamFile(vo);
	}
	
	// 사전검사 문서 각각  수정
	@Override
	public void updatePreExamD(PreExamVO vo) {
		
		if(vo.getExamDocCd().equals("2")) {
			// 상담동의서 수정
			cnsMngDao.updateCnsAgreDoc(vo);
		} else if(vo.getExamDocCd().equals("3")) {
			// 개인정보동의서 수정
			cnsMngDao.updatePerInfoAgre(vo);
		} else if(vo.getExamDocCd().equals("4")) {
			// 노인상담선별척도지 수정
			cnsMngDao.updateDocCntnComm(vo);
		}
	}
	
	// 사전검사D 등록
	@Override
	public void insertPreExamD(PreExamVO vo) {
		cnsMngDao.insertPreExamD(vo);
	}
	
	// 보안서약서 등록
	@Override
	public void insertCcrtPlgr(PreExamVO vo) {
		cnsMngDao.insertCcrtPlgr(vo);
	}
	
	// 초기상담신청서 등록
	@Override
	public void insertEalyCnsDoc(EalyCnsDocVO vo) {
		cnsMngDao.insertEalyCnsDoc(vo);
		cnsMngDao.insertEalyFile(vo);
	}
	
	// 초기상담신청서 수정
	public void updateEalyCnsDoc(EalyCnsDocVO vo) {
		cnsMngDao.updateEalyCnsDoc(vo);
	}
	
	// 초기상담신청서 목록
	@Override
	public List<EgovMap> getEalyCnsDocList(EalyCnsDocVO vo) {
		return cnsMngDao.getEalyCnsDocList(vo);
	}
	
	// 초기상담신청서 목록 갯수
	@Override
	public int getEalyCnsDocListTotCnt(EalyCnsDocVO vo) {
		return cnsMngDao.getEalyCnsDocListTotCnt(vo);
	}
	
	// 초기상담신청서 상세
	@Override
	public EgovMap getEalyCnsDoc(int caseNo) {
		return cnsMngDao.getEalyCnsDoc(caseNo);
	}
	
	// 초기상담신청서 중복 등록 체크
	@Override
	public int getEalyCnsRegCheck(int caseNo) {
		return cnsMngDao.getEalyCnsRegCheck(caseNo);
	}
	
	// 상담일지 이력정보 목록
	@Override
	public List<EgovMap> getCnsDiaHysList(EalyCnsDocVO vo) {
		return cnsMngDao.getCnsDiaHysList(vo);
	}
	
	// 개인상담일지 목록 총갯수
	@Override
	public int getCnsDiaHysListTotCnt(EalyCnsDocVO vo) {
		return cnsMngDao.getCnsDiaHysListTotCnt(vo);
	}
	
	// 개인상담 재신청 목록
	@Override
	public List<EgovMap> getCnsCntReList(EalyCnsDocVO vo) {
		return cnsMngDao.getCnsCntReList(vo);
	}
	
	// 개인상담 종결 목록
	@Override
	public List<EgovMap> getCnsCntEndList(EalyCnsDocVO vo) {
		return cnsMngDao.getCnsCntEndList(vo);
	}
	
	// 개인상담일지 등록
	@Override
	public void insertPerCns(PerCnsVO vo) {
		// cnsMngDao.insertPerCns(vo);
		cnsMngDao.insertPerCnsDtl(vo);
		// cnsMngDao.insertPerCnsPdf(vo);
	}
	
	// 개인상담일지 수정
	@Override
	public void updatePerCns(PerCnsVO vo) {
		// cnsMngDao.updatePerCns(vo);
		cnsMngDao.updatePerCnsDtl(vo);
	}
	
	// 개인상담일지 상세
	@Override
	public EgovMap getPerCns(PerCnsVO vo) {
		return cnsMngDao.getPerCns(vo);
	}
	
	// 집단상담일지 목록
	@Override
	public List<EgovMap> getGcnsList(GcnsVO vo) {
		return cnsMngDao.getGcnsList(vo);
	}
	
	// 집단상담일지 목록 총갯수
	@Override
	public int getGcnsListTotCnt(GcnsVO vo) {
		return cnsMngDao.getGcnsListTotCnt(vo);
	}
	
	// 집단상담일지 등록
	@Override
	public void insertGcns(GcnsVO vo) throws Exception {
		//cnsMngDao.insertGcns(vo);
		//cnsMngDao.insertGcnsPdf(vo);
		
		int gcnsNum = 0;
		
		gcnsNum = cnsMngDao.insertGcnsDtl(vo);
		
		PerCnsVO perVo = new PerCnsVO();
		perVo.setCnsrId(vo.getCnsrId());
		perVo.setCnsrNm(vo.getInputNm());
		perVo.setCnsCnt(vo.getCnsCnt());
		perVo.setCnsDt(vo.getAtvyDt());
		perVo.setNum(gcnsNum);
		perVo.setMajorApplCd(vo.getMajorApplCd()); // 주호소문제
		perVo.setCnsleRel(vo.getOlderRel()); // 내담자와의 관계
		perVo.setCnsType(vo.getCnsType()); // 상담종류
		
		String str = vo.getAtdeId();
		String atdeIdArr[] = str.split(",");
		String str2 = vo.getAtdeNm();
		String atdeNmArr[] = str2.split(",");
		
		for(int i = 0; i<atdeIdArr.length; i++) {
			perVo.setCnsleId(atdeIdArr[i]);
			perVo.setCnsleNm(atdeNmArr[i]);
			cnsMngDao.insertAddPerCns(perVo);
		}
	}
	
	// 집단상담일지(내담자 수정시) 등록
	@Override
	public void insertUpdGcns(GcnsVO vo) throws Exception {
		
		int num = vo.getNum();
		cnsMngDao.deleteGcnsPer(num);
		
		PerCnsVO perVo = new PerCnsVO();
		perVo.setCnsrId(vo.getCnsrId());
		perVo.setCnsrNm(vo.getInputNm());
		perVo.setCnsCnt(vo.getCnsCnt());
		perVo.setCnsDt(vo.getAtvyDt());
		perVo.setNum(num);
		perVo.setMajorApplCd(vo.getMajorApplCd()); // 주호소문제
		perVo.setCnsleRel(vo.getOlderRel()); // 내담자와의 관계
		perVo.setCnsType(vo.getCnsType()); // 상담종류
		
		String str = vo.getAtdeId();
		String atdeIdArr[] = str.split(",");
		String str2 = vo.getAtdeNm();
		String atdeNmArr[] = str2.split(",");
		
		for(int i = 0; i<atdeIdArr.length; i++) {
			perVo.setCnsleId(atdeIdArr[i]);
			perVo.setCnsleNm(atdeNmArr[i]);
			cnsMngDao.insertAddPerCns(perVo);
		}
	}
	
	// 집단상담일지 상세
	@Override
	public EgovMap getGcns(GcnsVO vo) {
		return cnsMngDao.getGcns(vo);
	}
	
	// 집단상담일지 수정
	@Override
	public void updateGcns(GcnsVO vo) throws Exception {
		
		String str = vo.getAtdeId();
		String atdeIdArr[] = str.split(",");
		String str2 = vo.getAtdeNm();
		String atdeNmArr[] = str2.split(",");
		String str3 = vo.getOriAtdeId();
		String oriAtdeIdArr[] = str3.split(",");
		String str4 = vo.getOriAtdeNm();
		String oriAtdeNmArr[] = str4.split(",");
		
		PerCnsVO perVo = new PerCnsVO();
		perVo.setCnsCnt(vo.getCnsCnt());
		perVo.setCnsDt(vo.getAtvyDt());
		perVo.setCnsleRel(vo.getOlderRel());
		perVo.setCnsType(vo.getCnsType());
		perVo.setNum(vo.getNum());
		
		if(vo.getClearYn().equals("N")) {
			for(int i = 0; i<atdeIdArr.length; i++) {
				perVo.setCnsleId(oriAtdeIdArr[i]);
				perVo.setCnsleNm(oriAtdeNmArr[i]);
				cnsMngDao.updateAddPerCns(perVo);
			}
			cnsMngDao.updateGcnsDtl(vo);
		} else if(vo.getClearYn().equals("Y")) {
			/*for(int i = 0; i<atdeIdArr.length; i++) {
				perVo.setCnsleId(atdeIdArr[i]);
				// use_yn 'N' 처리
				cnsMngDao.updateDelPerCns(perVo);
			} */
			cnsMngDao.updateGcnsDtl(vo);
		}
		
		
	}
	
	// 상담내용 목록(심리)
	@Override
	public List<EgovMap> getPsyCnsList(PsyCnsVO vo) {
		return cnsMngDao.getPsyCnsList(vo);
	}
	
	// 상담내용 목록 갯수(심리)
	@Override
	public int getPsyCnsListTotCnt(PsyCnsVO vo) {
		return cnsMngDao.getPsyCnsListTotCnt(vo);
	}
	
	// 심리검사지 목록
	@Override
	public List<EgovMap> getExamDocList(PsyCnsVO vo) {
		return cnsMngDao.getExamDocList(vo);
	}
	
	// 심리검사지 목록(연계)
	@Override
	public List<EgovMap> getLinkCnsList(LinkReqVO vo) {
		return cnsMngDao.getLinkCnsList(vo);
	}
	
	// 연계의뢰서 목록
	@Override
	public List<EgovMap> getLinkageReqList(LinkReqVO vo) {
		return cnsMngDao.getLinkageReqList(vo);
	}
	
	// 연계의뢰서 목록 갯수
	@Override
	public int getLinkageReqListTotCnt(LinkReqVO vo) {
		return cnsMngDao.getLinkageReqListTotCnt(vo);
	}
	
	// 내부 연계의뢰서 등록
	@Override
	public void insertLinkageInReq(LinkReqVO vo) {
		cnsMngDao.insertLinkageInReq(vo);
	}
	
	// 내부 연계의뢰서 수정
	@Override
	public void updateLinkageInReq(LinkReqVO vo) {
		cnsMngDao.updateLinkageInReq(vo);
	}
	
	// 외부 연계의뢰서 등록
	@Override
	public void insertLinkageOutReq(LinkReqVO vo) {
		String reqDt = "20"+vo.getYear()+vo.getMonth()+vo.getDay();
		String relyTerm = "20"+vo.getLinkReqRecvYear()+"."+vo.getLinkReqRecvMonth()+"."+vo.getLinkReqRecvDay();
		vo.setReqDt(reqDt);
		vo.setRelyTerm(relyTerm);
		cnsMngDao.insertLinkageOutReq(vo);
	}
	
	// 외부 연계의뢰서 수정
	@Override
	public void updateLinkageOutReq(LinkReqVO vo) {
		String reqDt = "20"+vo.getYear()+vo.getMonth()+vo.getDay();
		String relyTerm = "20"+vo.getLinkReqRecvYear()+"."+vo.getLinkReqRecvMonth()+"."+vo.getLinkReqRecvDay();
		vo.setReqDt(reqDt);
		vo.setRelyTerm(relyTerm);
		cnsMngDao.updateLinkageOutReq(vo);
	}
	
	// 연계의뢰서 상세보기
	@Override
	public EgovMap getLinkageReqDetail(int num) {
		return cnsMngDao.getLinkageReqDetail(num);
	}
	
	// 연계의뢰서 업로드
	@Override
	public void insertLinkageReqUpload(LinkReqVO vo) {
		// 파일 서버에 저장

		if(vo.getFile().getSize() != 0) {
			MultipartFile file = vo.getFile();
			EgovMap fMap = AMSComm.fileUpload(file, "linkage");
			vo.setFileNm2("");
			vo.setSysFileNm2("");
			vo.setFilePath2("");
			vo.setFileNm2((String)fMap.get("fileNm"));
			vo.setSysFileNm2((String)fMap.get("sysFileNm"));
			vo.setFilePath2((String)fMap.get("filePath"));		
			cnsMngDao.insertLinkageReqUpload(vo);
		}
		if(vo.getFile2().getSize() != 0) {
		    MultipartFile file2 = vo.getFile2();
			EgovMap fMap2 = AMSComm.fileUpload(file2, "gongMun");
			vo.setFileNm3("");
			vo.setSysFileNm3("");
			vo.setFilePath3("");
			vo.setFileNm3((String)fMap2.get("fileNm"));
			vo.setSysFileNm3((String)fMap2.get("sysFileNm"));
			vo.setFilePath3((String)fMap2.get("filePath"));		
			cnsMngDao.insertLinkageReqUpload2(vo);
		}
		// cnsMngDao.insertLinkageReqUpload(vo);
		//cnsMngDao.insertLinkageReq(vo);
	}
	
	// 연계의뢰서 등록
	@Override
	public void insertLinkageReq(LinkReqVO vo) {
		cnsMngDao.insertLinkageReq(vo);
	}
	
	// 슈퍼비전 목록
	@Override
	public List<EgovMap> getSuperVisionList(SupperVisionVO svo) {
		return cnsMngDao.getSuperVisionList(svo);
	}
	
	// 슈퍼비전 목록 갯수
	@Override
	public int getSuperVisionListTotCnt(SupperVisionVO svo) {
		return cnsMngDao.getSuperVisionListTotCnt(svo);
	}
	
	// 슈퍼비전 의뢰내용 등록
	public void insertSuperVisionReg(SupperVisionVO vo) {
		if(vo.getFile().getSize() != 0) {
			MultipartFile file = vo.getFile();
			EgovMap fMap = AMSComm.fileUpload(file, "supervision");
			vo.setFileNm((String)fMap.get("fileNm"));
			vo.setSysFileNm((String)fMap.get("sysFileNm"));
			vo.setFilePath((String)fMap.get("filePath"));					
		}
		
		cnsMngDao.insertSuperVisionReg(vo);
	}
	
	// 슈퍼비전 의뢰내용 수정
	public void updateSuperVisionReg(SupperVisionVO vo) {
		if(vo.getFile().getSize() != 0) {
			MultipartFile file = vo.getFile();
			EgovMap fMap = AMSComm.fileUpload(file, "supervision");
			vo.setFileNm((String)fMap.get("fileNm"));
			vo.setSysFileNm((String)fMap.get("sysFileNm"));
			vo.setFilePath((String)fMap.get("filePath"));	
		}
		
		cnsMngDao.updateSuperVisionReg(vo);
	}
	
	// 슈퍼비전 의뢰내용 상세
	public EgovMap getSuperVisionDtl(int num) {
		return cnsMngDao.getSuperVisionDtl(num);
	}
	
	// 슈퍼비전 답변내용 등록
	public void insertSuperVisionReplyReg(SupperVisionVO vo) {
		/*if(vo.getFile2().getSize() != 0) {
			MultipartFile file2 = vo.getFile2();
			EgovMap fMap = AMSComm.fileUpload(file2, "supervision");
			vo.setFileNm((String)fMap.get("fileNm"));
			vo.setSysFileNm((String)fMap.get("sysFileNm"));
			vo.setFilePath((String)fMap.get("filePath"));
		}*/
		
		cnsMngDao.insertSuperVisionReplyReg(vo);
		cnsMngDao.updateSpAnswerYn(vo);
	}
	
	// 슈퍼비전 답변 상세
	public EgovMap getSuperVisionReplyDtl(int num) {
		return cnsMngDao.getSuperVisionReplyDtl(num);
	}
	
	// 슈퍼비전 답변내용 수정
	public void updateSuperVisionReplyReg(SupperVisionVO vo) {
		/*if(vo.getFile2().getSize() != 0) {
			MultipartFile file2 = vo.getFile2();
			EgovMap fMap = AMSComm.fileUpload(file2, "supervision");
			vo.setFileNm((String)fMap.get("fileNm"));
			vo.setSysFileNm((String)fMap.get("sysFileNm"));
			vo.setFilePath((String)fMap.get("filePath"));
		}*/
		cnsMngDao.updateSuperVisionReplyReg(vo);
	}
	
	// 상담종결서 등록
	@Override
	public void insertCnsEnd(CnsEndVO vo) {
		cnsMngDao.insertCnsEnd(vo);		
		// 개인상담 M 수정
		cnsMngDao.updateEndPerCnsDtl(vo);
		//cnsMngDao.insertCnsEndPdf(vo);
	}
	
	// 심리 검사 SELECT
	@Override
	public EgovMap selectPsyCnsDoc(PsyCnsDocVO vo) {
		return cnsMngDao.selectPsyCnsDoc(vo);
	}
	
	// 심리 검사 INSERT
	@Override
	public void insertPsyCnsDoc(PsyCnsDocVO vo) {
		cnsMngDao.insertPsyCnsDoc(vo);
	}
	
	//심리 검사 UPDATE
	public void updatePsyCnsDoc(PsyCnsDocVO vo) {
		cnsMngDao.updatePsyCnsDoc(vo);
	}
	
	
	// 상담 사전·사후 기록지 등록
	@Override
	public void insertPsyCnsDoc1(PsyCnsDoc1VO vo) {
		cnsMngDao.insertPsyCnsDoc1(vo);
	}
	
	// DUKE-AD 기록지 등록
	@Override
	public void insertPsyCnsDoc2(PsyCnsDoc2VO vo) {
		cnsMngDao.insertPsyCnsDoc2(vo);
	}
	
	// 죽음학대 기록지 등록
	@Override
	public void insertPsyCnsDoc3(PsyCnsDoc2VO vo) {
		cnsMngDao.insertPsyCnsDoc3(vo);
	}
	
	// 노인우울척도 등록
	@Override
	public void insertPsyCnsDoc4(PsyCnsDoc2VO vo) {
		cnsMngDao.insertPsyCnsDoc4(vo);
	}
	
	// 노인우울및 자살사고 척도 등록
	@Override
	public void insertPsyCnsDoc5(PsyCnsDoc2VO vo) {
		cnsMngDao.insertPsyCnsDoc5(vo);
	}
	// 대인관계변화척도 등록
	@Override
	public void insertPsyCnsDoc8(PsyCnsDoc2VO vo) {
		cnsMngDao.insertPsyCnsDoc8(vo);
	}
	
	// 한국형 알코올 중독 선별 검사 등록
	@Override
	public void insertPsyCnsDoc9(PsyCnsDoc2VO vo) {
		cnsMngDao.insertPsyCnsDoc9(vo);
	}
	
	// 불안척도 등록
	@Override
	public void insertPsyCnsDoc10(PsyCnsDoc2VO vo) {
		cnsMngDao.insertPsyCnsDoc10(vo);
	}
	
	// 스트레스 척도 등록
	@Override
	public void insertPsyCnsDoc11(PsyCnsDoc2VO vo) {
		cnsMngDao.insertPsyCnsDoc11(vo);
	}
	
	// 사별 스트레스 척도 등록
	@Override
	public void insertPsyCnsDoc12(PsyCnsDoc2VO vo) {
		cnsMngDao.insertPsyCnsDoc12(vo);
	}
	
	// 부부의사소통 척도 등록
	@Override
	public void insertPsyCnsDoc14(PsyCnsDoc2VO vo) {
		cnsMngDao.insertPsyCnsDoc14(vo);
	}
	
	// 문장완성검사 등록
	@Override
	public void insertPsyCnsDoc15(PsyCnsDoc2VO vo) {
		cnsMngDao.insertPsyCnsDoc15(vo);
	}
	
	// 치매선별용 한국어판 간이정신상태검사 등록
	@Override
	public void insertPsyCnsDoc16(PsyCnsDoc2VO vo) {
		cnsMngDao.insertPsyCnsDoc16(vo);
	}
	
	// 기존상담관리부터 일괄 삭제
	@Override 
	public void deleteExiCnsAcpt(String caseNo) {
		cnsMngDao.deleteUser(caseNo);
		cnsMngDao.deleteCnsAccept(caseNo);
		cnsMngDao.deletePreExamM(caseNo);
		cnsMngDao.deleteCnsAgre(caseNo);
		cnsMngDao.deletePerInfo(caseNo);
		cnsMngDao.deleteDocCntn(caseNo);
		cnsMngDao.deleteEalyCnsDoc(caseNo);
		cnsMngDao.deletePerCnsDtl(caseNo);
		cnsMngDao.deletePsyCnsDocDtl(caseNo);
		cnsMngDao.deleteLinkReq(caseNo);
		cnsMngDao.deleteCnsEnd(caseNo);
	}
	
	// 초기상담부터 일괄 삭제
	@Override
	public void deleteExiEalyCnsDoc(String caseNo) {
		cnsMngDao.deleteEalyCnsDoc(caseNo);
		cnsMngDao.deletePerCnsDtl(caseNo);
		cnsMngDao.deletePsyCnsDocDtl(caseNo);
		cnsMngDao.deleteLinkReq(caseNo);
		cnsMngDao.deleteCnsEnd(caseNo);
	}
	
	// 개인상담부터 일괄 삭제
	@Override
	public void deleteExiPerCnsDoc(Map<String, Object> map) {
		String caseNo = map.get("caseNo").toString();
		String num = map.get("num").toString();
		cnsMngDao.deletePerCnsDtl(caseNo);
		cnsMngDao.deleteExiPsyCnsDocDtl(map);
		cnsMngDao.deleteCnsEnd(caseNo);
	}
	
	@Override 
	public void updateExiCnsAcpt(String caseNo) {
		cnsMngDao.updateExiCnsAccept(caseNo);
	}
	
	// 정보제공상담(유저도) 삭제
	@Override 
	public void deleteCnsInfo(String userId) {
		cnsMngDao.deleteCnsInfo(userId);
		cnsMngDao.deleteUserInfo(userId);
	}
	
	// 집단상담(개인상담도) 삭제
	@Override 
	public void deleteGcns(int num) {
		cnsMngDao.deleteGcns(num);
		cnsMngDao.deleteGcnsPer(num);
	}
	

	
}