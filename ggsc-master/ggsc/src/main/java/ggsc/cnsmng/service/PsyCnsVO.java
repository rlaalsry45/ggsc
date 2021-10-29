package ggsc.cnsmng.service;

import ams.cmm.PageVO;

public class PsyCnsVO extends PageVO{

	private int caseNo;
	private String cnsleNm;
	private String cnsGb;
	private String cnsCnt;
	private String cnsDt;
	private String cnsrNm;
	private String cnsEndDt;
	private String gender;
	private String edu;
	private String examDocNm;
	private String examDocCd;
	private String beingYn;
	private String dbInsTm;
	private String killsRskn;
	private String cnsStat;
	private String authCd;
	
	private String schCnsGb;
	private String schCnsleNm;
	private String schCenterGb;
	private String schStartDate;
	private String schEndDate;

	public String getSchStartDate() {
		return schStartDate;
	}
	public void setSchStartDate(String schStartDate) {
		this.schStartDate = schStartDate;
	}
	public String getSchEndDate() {
		return schEndDate;
	}
	public void setSchEndDate(String schEndDate) {
		this.schEndDate = schEndDate;
	}
	public String getAuthCd() {
		return authCd;
	}
	public void setAuthCd(String authCd) {
		this.authCd = authCd;
	}
	public String getSchCenterGb() {
		return schCenterGb;
	}
	public void setSchCenterGb(String schCenterGb) {
		this.schCenterGb = schCenterGb;
	}
	public String getSchCnsGb() {
		return schCnsGb;
	}
	public void setSchCnsGb(String schCnsGb) {
		this.schCnsGb = schCnsGb;
	}
	public String getSchCnsleNm() {
		return schCnsleNm;
	}
	public void setSchCnsleNm(String schCnsleNm) {
		this.schCnsleNm = schCnsleNm;
	}
	public String getCnsStat() {
		return cnsStat;
	}
	public void setCnsStat(String cnsStat) {
		this.cnsStat = cnsStat;
	}
	public String getKillsRskn() {
		return killsRskn;
	}
	public void setKillsRskn(String killsRskn) {
		this.killsRskn = killsRskn;
	}
	public int getCaseNo() {
		return caseNo;
	}
	public void setCaseNo(int caseNo) {
		this.caseNo = caseNo;
	}
	public String getCnsleNm() {
		return cnsleNm;
	}
	public void setCnsleNm(String cnsleNm) {
		this.cnsleNm = cnsleNm;
	}
	public String getCnsGb() {
		return cnsGb;
	}
	public void setCnsGb(String cnsGb) {
		this.cnsGb = cnsGb;
	}
	public String getCnsCnt() {
		return cnsCnt;
	}
	public void setCnsCnt(String cnsCnt) {
		this.cnsCnt = cnsCnt;
	}
	public String getCnsDt() {
		return cnsDt;
	}
	public void setCnsDt(String cnsDt) {
		this.cnsDt = cnsDt;
	}
	public String getCnsrNm() {
		return cnsrNm;
	}
	public void setCnsrNm(String cnsrNm) {
		this.cnsrNm = cnsrNm;
	}
	public String getCnsEndDt() {
		return cnsEndDt;
	}
	public void setCnsEndDt(String cnsEndDt) {
		this.cnsEndDt = cnsEndDt;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEdu() {
		return edu;
	}
	public void setEdu(String edu) {
		this.edu = edu;
	}
	public String getExamDocNm() {
		return examDocNm;
	}
	public void setExamDocNm(String examDocNm) {
		this.examDocNm = examDocNm;
	}
	public String getExamDocCd() {
		return examDocCd;
	}
	public void setExamDocCd(String examDocCd) {
		this.examDocCd = examDocCd;
	}
	public String getBeingYn() {
		return beingYn;
	}
	public void setBeingYn(String beingYn) {
		this.beingYn = beingYn;
	}
	public String getDbInsTm() {
		return dbInsTm;
	}
	public void setDbInsTm(String dbInsTm) {
		this.dbInsTm = dbInsTm;
	}
	
	@Override
	public String toString() {
		return "PsyCnsVO [caseNo=" + caseNo + ", cnsleNm=" + cnsleNm + ", cnsGb=" + cnsGb + ", cnsCnt=" + cnsCnt
				+ ", cnsDt=" + cnsDt + ", cnsrNm=" + cnsrNm + ", cnsEndDt=" + cnsEndDt + ", gender=" + gender + ", edu="
				+ edu + ", examDocNm=" + examDocNm + ", examDocCd=" + examDocCd + ", beingYn=" + beingYn + ", dbInsTm="
				+ dbInsTm + ", killsRskn=" + killsRskn + ", cnsStat=" + cnsStat + "]";
	}
	
}
