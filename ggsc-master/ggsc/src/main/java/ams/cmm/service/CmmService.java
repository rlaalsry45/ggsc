package ams.cmm.service;

import ams.cmm.PageEditVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface CmmService {
	public String get(String reqAppName, String reqCodeName);

	public String get(String reqAppName, String reqCodeName, boolean reqConvertBase36);

	public String get(String reqAppName, String reqCodeName, int reqLength);

	public String get(String reqAppName, String reqCodeName, int reqLength, boolean reqConvertBase36);

	public Object selectPageData(PageEditVO vo);

	public String mergePageData(PageEditVO vo);

	public String getInOutDate(String reqType, String reqDate, String reqUser_ID);

	public String getTripGtInOutDate(String reqDate, String reqUser_ID, String reqType);

	public EgovMap selectMealTimeCut();

	public String getMonthHdwString(String sYear, String sMonth);

	public String getAuthGrp(EgovMap loginVO, String mnuCd);

	public String getAuthBtnArray(String userId);
}
