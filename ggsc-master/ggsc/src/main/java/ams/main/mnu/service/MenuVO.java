package ams.main.mnu.service;

import ams.cmm.PageVO;

/**
 * 메뉴목록관리 처리를 위한 VO 클래스르를 정의한다
 * @author 개발환경 개발팀 이용
 * @since 2009.06.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.03.20  이  용          최초 생성
 *   2011.08.31  JJY            경량환경 템플릿 커스터마이징버전 생성
 *
 * </pre>
 */

public class MenuVO extends PageVO {

	private int mnuSer;
	private int mnuNo;
	private String mnuCd;
	private String authCd;
	private String authNm;
	private String authGrpNm;
	private String mnuNm;
	private String cntn;
	private String mnuPath;
	private int odr;
	private int mnuLvl;
	private String useYn;
	private String adminYn;
	private String hMnuCd;
	private String dbUpdDt;
	private String dbInsDt;
	private String regId;
	private String searchYn;
	private String mapSers;

	private String searchNm;
	private String searchLvl;

	private int mapSer;
	private int authSer;

	private String mnuCds;
	private String mnuSers;
	private String authCds;
	private String mnuType;
	private String authType;

	private String userId;
	public int getMnuSer() {
		return mnuSer;
	}

	public void setMnuSer(int mnuSer) {
		this.mnuSer = mnuSer;
	}

	public int getMnuNo() {
		return mnuNo;
	}

	public void setMnuNo(int mnuNo) {
		this.mnuNo = mnuNo;
	}

	public String getMnuCd() {
		return mnuCd;
	}

	public void setMnuCd(String mnuCd) {
		this.mnuCd = mnuCd;
	}

	public String getAuthCd() {
		return authCd;
	}

	public void setAuthCd(String authCd) {
		this.authCd = authCd;
	}

	public String getAuthNm() {
		return authNm;
	}

	public void setAuthNm(String authNm) {
		this.authNm = authNm;
	}

	public String getAuthGrpNm() {
		return authGrpNm;
	}

	public void setAuthGrpNm(String authGrpNm) {
		this.authGrpNm = authGrpNm;
	}

	public String getMnuNm() {
		return mnuNm;
	}

	public void setMnuNm(String mnuNm) {
		this.mnuNm = mnuNm;
	}

	public String getCntn() {
		return cntn;
	}

	public void setCntn(String cntn) {
		this.cntn = cntn;
	}

	public String getMnuPath() {
		return mnuPath;
	}

	public void setMnuPath(String mnuPath) {
		this.mnuPath = mnuPath;
	}

	public int getOdr() {
		return odr;
	}

	public void setOdr(int odr) {
		this.odr = odr;
	}

	public int getMnuLvl() {
		return mnuLvl;
	}

	public void setMnuLvl(int mnuLvl) {
		this.mnuLvl = mnuLvl;
	}

	public String getUseYn() {
		return useYn;
	}

	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}

	public String getAdminYn() {
		return adminYn;
	}

	public void setAdminYn(String adminYn) {
		this.adminYn = adminYn;
	}

	public String gethMnuCd() {
		return hMnuCd;
	}

	public void sethMnuCd(String hMnuCd) {
		this.hMnuCd = hMnuCd;
	}

	public String getDbUpdDt() {
		return dbUpdDt;
	}

	public void setDbUpdDt(String dbUpdDt) {
		this.dbUpdDt = dbUpdDt;
	}

	public String getDbInsDt() {
		return dbInsDt;
	}

	public void setDbInsDt(String dbInsDt) {
		this.dbInsDt = dbInsDt;
	}

	public String getRegId() {
		return regId;
	}

	public void setRegId(String regId) {
		this.regId = regId;
	}

	public String getSearchYn() {
		return searchYn;
	}

	public void setSearchYn(String searchYn) {
		this.searchYn = searchYn;
	}

	public String getMapSers() {
		return mapSers;
	}

	public void setMapSers(String mapSers) {
		this.mapSers = mapSers;
	}

	public String getSearchNm() {
		return searchNm;
	}

	public void setSearchNm(String searchNm) {
		this.searchNm = searchNm;
	}

	public String getSearchLvl() {
		return searchLvl;
	}

	public void setSearchLvl(String searchLvl) {
		this.searchLvl = searchLvl;
	}

	public int getMapSer() {
		return mapSer;
	}

	public void setMapSer(int mapSer) {
		this.mapSer = mapSer;
	}

	public int getAuthSer() {
		return authSer;
	}

	public void setAuthSer(int authSer) {
		this.authSer = authSer;
	}

	public String getMnuCds() {
		return mnuCds;
	}

	public void setMnuCds(String mnuCds) {
		this.mnuCds = mnuCds;
	}

	public String getMnuSers() {
		return mnuSers;
	}

	public void setMnuSers(String mnuSers) {
		this.mnuSers = mnuSers;
	}

	public String getAuthCds() {
		return authCds;
	}

	public void setAuthCds(String authCds) {
		this.authCds = authCds;
	}

	public String getMnuType() {
		return mnuType;
	}

	public void setMnuType(String mnuType) {
		this.mnuType = mnuType;
	}

	public String getAuthType() {
		return authType;
	}

	public void setAuthType(String authType) {
		this.authType = authType;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	
}