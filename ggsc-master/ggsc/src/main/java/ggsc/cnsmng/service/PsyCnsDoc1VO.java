package ggsc.cnsmng.service;

import ams.cmm.PageVO;

public class PsyCnsDoc1VO extends PageVO{
	private int gIdx, psyIdx, dtlIdx;

	private int num;
	private int caseNo;
	private int cnsDtlGbCd;
	private String cnsGb;
	private String zoneGb;
	private String centerGb;
	private String localGb;
	private String cnsleId;
	private String examDocCd;
	private String examDocNm;
	private String cnsleNm;
	private String cnsStrtDt;
	private String cnsEndDt;
	private String awkwState;
	private String cnsState;
	private String majorAppl;
	private String sGds;
	private String gdsKr;
	private String cnsBefore;
	private String cnsAfter;
	private String suggestions;
	private String regId;
	private String dbInsTm;
	
	private String year;
	private String year2;
	private String month;
	private String month2;
	private String day;
	private String day2;
	
	private String cnsrId;
	private String cnsrNm;
	private int cnsCnt;
	private String pgrmCd;
	private String pgrmNm;
	
	public int getgIdx() {
		return gIdx;
	}
	public void setgIdx(int gIdx) {
		this.gIdx = gIdx;
	}
	
	public int getpsyIdx() {
		return psyIdx;
	}
	public void setpsyIdx(int psyIdx) {
		this.psyIdx = psyIdx;
	}
	
	public int getdtlIdx() {
		return dtlIdx;
	}
	public void setdtlIdx(int dtlIdx) {
		this.dtlIdx = dtlIdx;
	}
	
	
	public String getExamDocNm() {
		return examDocNm;
	}
	public void setExamDocNm(String examDocNm) {
		this.examDocNm = examDocNm;
	}
	public String getLocalGb() {
		return localGb;
	}
	public void setLocalGb(String localGb) {
		this.localGb = localGb;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getCaseNo() {
		return caseNo;
	}
	public void setCaseNo(int caseNo) {
		this.caseNo = caseNo;
	}
	public int getCnsDtlGbCd() {
		return cnsDtlGbCd;
	}
	public void setCnsDtlGbCd(int cnsDtlGbCd) {
		this.cnsDtlGbCd = cnsDtlGbCd;
	}
	public String getCnsGb() {
		return cnsGb;
	}
	public void setCnsGb(String cnsGb) {
		this.cnsGb = cnsGb;
	}
	public String getZoneGb() {
		return zoneGb;
	}
	public void setZoneGb(String zoneGb) {
		this.zoneGb = zoneGb;
	}
	public String getCenterGb() {
		return centerGb;
	}
	public void setCenterGb(String centerGb) {
		this.centerGb = centerGb;
	}
	public String getCnsleId() {
		return cnsleId;
	}
	public void setCnsleId(String cnsleId) {
		this.cnsleId = cnsleId;
	}
	public String getExamDocCd() {
		return examDocCd;
	}
	public void setExamDocCd(String examDocCd) {
		this.examDocCd = examDocCd;
	}
	public String getCnsleNm() {
		return cnsleNm;
	}
	public void setCnsleNm(String cnsleNm) {
		this.cnsleNm = cnsleNm;
	}
	public String getCnsStrtDt() {
		return cnsStrtDt;
	}
	public void setCnsStrtDt(String cnsStrtDt) {
		this.cnsStrtDt = cnsStrtDt;
	}
	public String getCnsEndDt() {
		return cnsEndDt;
	}
	public void setCnsEndDt(String cnsEndDt) {
		this.cnsEndDt = cnsEndDt;
	}
	
	public String getCnsState() {
		return cnsState;
	}
	public void setCnsState(String cnsState) {
		this.cnsState = cnsState;
	}
	public String getMajorAppl() {
		return majorAppl;
	}
	public void setMajorAppl(String majorAppl) {
		this.majorAppl = majorAppl;
	}
	public String getsGds() {
		return sGds;
	}
	public void setsGds(String sGds) {
		this.sGds = sGds;
	}
	public String getGdsKr() {
		return gdsKr;
	}
	public void setGdsKr(String gdsKr) {
		this.gdsKr = gdsKr;
	}
	public String getCnsBefore() {
		return cnsBefore;
	}
	public void setCnsBefore(String cnsBefore) {
		this.cnsBefore = cnsBefore;
	}
	public String getCnsAfter() {
		return cnsAfter;
	}
	public void setCnsAfter(String cnsAfter) {
		this.cnsAfter = cnsAfter;
	}
	public String getSuggestions() {
		return suggestions;
	}
	public void setSuggestions(String suggestions) {
		this.suggestions = suggestions;
	}
	public String getRegId() {
		return regId;
	}
	public void setRegId(String regId) {
		this.regId = regId;
	}
	public String getDbInsTm() {
		return dbInsTm;
	}
	public void setDbInsTm(String dbInsTm) {
		this.dbInsTm = dbInsTm;
	}
	public String getAwkwState() {
		return awkwState;
	}
	public void setAwkwState(String awkwState) {
		this.awkwState = awkwState;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getYear2() {
		return year2;
	}
	public void setYear2(String year2) {
		this.year2 = year2;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getMonth2() {
		return month2;
	}
	public void setMonth2(String month2) {
		this.month2 = month2;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getDay2() {
		return day2;
	}
	public void setDay2(String day2) {
		this.day2 = day2;
	}
	public String getCnsrId() {
		return cnsrId;
	}
	public void setCnsrId(String cnsrId) {
		this.cnsrId = cnsrId;
	}
	public String getCnsrNm() {
		return cnsrNm;
	}
	public void setCnsrNm(String cnsrNm) {
		this.cnsrNm = cnsrNm;
	}
	public int getCnsCnt() {
		return cnsCnt;
	}
	public void setCnsCnt(int cnsCnt) {
		this.cnsCnt = cnsCnt;
	}
	public String getPgrmCd() {
		return pgrmCd;
	}
	public void setPgrmCd(String pgrmCd) {
		this.pgrmCd = pgrmCd;
	}
	public String getPgrmNm() {
		return pgrmNm;
	}
	public void setPgrmNm(String pgrmNm) {
		this.pgrmNm = pgrmNm;
	}
	
}
