package ams.cmm.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ams.cmm.AMSComm;
import ams.cmm.PageEditVO;
import ams.cmm.service.CmmService;

import egovframework.com.cmm.util.EgovStringUtil;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import ggsc.com.util.service.ComCodeService;
import ggsc.com.util.service.ComCodeVO;

@Service("cmmService")
public class CmmServiceImpl implements CmmService {

	@Resource(name = "cmmDAO")
	private CmmDAO cmmDAO;

	@Resource(name = "comCodeService")
	private ComCodeService comCodeService;

	/*
	 * @Override public List<?> selectExtList(ExtVO vo) { // TODO Auto-generated
	 * method stub return extDAO.selectExtList(vo); }
	 * 
	 * @Override public int selectExtListTotalCnt(ExtVO vo) { // TODO Auto-generated
	 * method stub return extDAO.selectExtListTotalCnt(vo); }
	 * 
	 * @Override public EgovMap getPartsInfo(ExtVO vo) { // TODO Auto-generated
	 * method stub return extDAO.getPartsInfo(vo); }
	 * 
	 * @Override public void insertParts(ExtVO vo) { // TODO Auto-generated method
	 * stub extDAO.insertParts(vo); }
	 * 
	 * @Override public void updateParts(ExtVO vo) { // TODO Auto-generated method
	 * stub extDAO.updateParts(vo); }
	 * 
	 * @Override public List<?> selectPartsAllList(ExtVO vo) { return
	 * extDAO.selectPartsAllList(vo); }
	 */

	@Override
	public synchronized String get(String reqAppName, String reqCodeName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public synchronized String get(String reqAppName, String reqCodeName, boolean reqConvertBase36) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public synchronized String get(String reqAppName, String reqCodeName, int reqLength) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public synchronized String get(String reqAppName, String reqCodeName, int reqLength, boolean reqConvertBase36) {
		String wAppName = reqAppName.trim().toUpperCase();
		String wCodeName = reqCodeName.trim().toUpperCase();

		long wSEQ = 0L;

		String wTmp = "";

		EgovMap egovMap = new EgovMap();
		egovMap.put("idName", wAppName);
		egovMap.put("idCode", wCodeName);

		wSEQ = cmmDAO.selectSeq(egovMap);

		if (wSEQ > 1) {
			egovMap.put("seq", wSEQ);
			cmmDAO.updateSeq(egovMap);
		} else {
			cmmDAO.insertIdTable(egovMap);
		}

		if (reqConvertBase36) {
			return AMSComm.getBASE36("" + wSEQ, reqLength);
		}

		StringBuffer wResult = new StringBuffer();
		wTmp = "" + wSEQ;
		for (int i = 0; i < reqLength - wTmp.length(); i++)
			wResult.append("0");

		wResult.append(wTmp);

		return wResult.toString();
	}

	@Override
	public Object selectPageData(PageEditVO vo) {
		return cmmDAO.selectPageData(vo);
	}

	@Override
	public String mergePageData(PageEditVO vo) {
		return cmmDAO.mergePageData(vo) == 1 ? "SUCCESS" : "FAIL";
	}

	/*
	 * ===================================================================== 지문정보를
	 * 찾는다. =====================================================================
	 */
	@Override
	public String getInOutDate(String reqType, String reqDate, String reqUser_ID) {

		EgovMap paramMap = new EgovMap();
		paramMap.put("reqType", reqType);
		paramMap.put("reqDate", reqDate);
		paramMap.put("reqUserId", reqUser_ID);

		return cmmDAO.getInOutDate(paramMap);
	}

	@Override
	public EgovMap selectMealTimeCut() {
		return cmmDAO.selectMealTimeCut();
	}

	/*
	 * ===================================================================== 출장근무의
	 * 출근 퇴근값 구하기 (분으로 환산되어 나감)
	 * =====================================================================
	 */
	@Override
	public String getTripGtInOutDate(String reqDate, String reqUser_ID, String reqType) {

		EgovMap paramMap = new EgovMap();
		paramMap.put("reqDate", reqDate);
		paramMap.put("reqUserId", reqUser_ID);
		paramMap.put("reqType", reqType);

		String wTmp = "";

		int wInt_SSum = 0;
		int wInt_ESum = 0;

		int wInt_STmp = 0;
		int wInt_ETmp = 0;

		String wDate = "";

		/** 근무상황부에서 출장1일 이상 휴일근무 관련 데이터 연동 END */
		// 시작일
		if (reqType.equals("S")) {
			// 최종적으로 지문값과 비교함
			wDate = getInOutDate("0", reqDate, reqUser_ID);
			if (!EgovStringUtil.isEmpty(wDate)) {
				wInt_SSum = (Integer.parseInt(wDate.substring(11, 13)) * 60)
						+ Integer.parseInt(wDate.substring(14, 16));

				if (wInt_STmp == 0) {
					wInt_STmp = wInt_SSum;
				} else {
					if (wInt_STmp > wInt_SSum) {
						wInt_STmp = wInt_SSum;
					}
				}
			}
			wTmp = "" + wInt_STmp;
		}

		// 종료일
		if (reqType.equals("E")) {
			// 최종적으로 지문값과 비교함
			wDate = getInOutDate("1", reqDate, reqUser_ID);
			if (!EgovStringUtil.isEmpty(wDate)) {
				wInt_ESum = (Integer.parseInt(wDate.substring(11, 13)) * 60)
						+ Integer.parseInt(wDate.substring(14, 16));
				if (wInt_ETmp < wInt_ESum) {
					wInt_ETmp = wInt_ESum;
				}
			}
			wTmp = "" + wInt_ETmp;
		}

		return wTmp;
	}

	@Override
	public String getMonthHdwString(String sYear, String sMonth) {
		// 대체휴일신청시 사용가능 월수 가져오기
		ComCodeVO comCodeVO2 = new ComCodeVO();
		comCodeVO2.setComGrp("HW_USECODE");
		comCodeVO2.setComCd("MONTH");
		EgovMap monthMap = comCodeService.getComCode(comCodeVO2);

		String fvSumMonth = String.valueOf(monthMap.get("comNm"));

		String fvSYear = sYear;
		String fvSMonth = "";

		int wSMonth = Integer.parseInt(sMonth);

		if (wSMonth == 1) {
			fvSYear = "" + (Integer.parseInt(sYear) - 1);
			fvSMonth = "12";
		} else {
			fvSMonth = getMonthString(sMonth, fvSumMonth);
		}

		return fvSYear + fvSMonth;
	}

	private String getMonthString(String reqMonth, String reqSumMonth) {
		String wTmp = reqMonth;

		int wMonth = Integer.parseInt(reqMonth) - Integer.parseInt(reqSumMonth);
		if (wMonth < 1) {
			wMonth = 1;
		}

		wTmp = "" + wMonth;

		wTmp = getStringSize(wTmp, 2);

		return wTmp;
	}

	/*
	 * ===================================================================== 지정된
	 * 크기만큼 0 붙이기
	 * =====================================================================
	 */
	private String getStringSize(String reqValue, int size) {
		String wTmp = reqValue;

		if (wTmp.length() < size) {
			for (int i = 0; i < (size - wTmp.length()); i++) {
				wTmp = "0" + wTmp;
			}
		}

		return wTmp;
	}

	@Override
	public String getAuthGrp(EgovMap loginVO, String mnuCd) {
		String authGrp = "";

		EgovMap authMap = new EgovMap();
		authMap.put("userId", loginVO.get("userId").toString());
		authMap.put("mnuCd", mnuCd);

		// 기본권한외에 화면의 권한 여부 확인
		// String adminYn = cmmDAO.getMenuAdminYn(authMap);

		// if(!EgovStringUtil.isEmpty(adminYn) && "Y".equals(adminYn)){
		// authGrp = "ADMIN";
		// }else{
		// authGrp = loginVO.get("authGrpCd").toString();
		// }

		return authGrp;
	}

	@Override
	public String getAuthBtnArray(String userId) {
		return (String) cmmDAO.getAuthBtnArray(userId);
	}

}
