package ggsc.cnsmng.service;

import ams.cmm.PageVO;

public class UserInfoVO extends PageVO{
	
	private int num;
	private int caseNo;
	private String userId;
	private String userNm;
	private String cnsGb;
	private String birthDt;
	private String email;
	private String addr;
	private String schUserId;
	private String schUserNm;
	private String schCnsGb;
	private String schCenterGb;
	private String cnsTargetGb;
	private String cnsPerTargetGb;
	private String authCd;
	private String regId;
	private String schCaseNo;
	
	public String getSchCaseNo() {
		return schCaseNo;
	}
	public void setSchCaseNo(String schCaseNo) {
		this.schCaseNo = schCaseNo;
	}
	public String getRegId() {
		return regId;
	}
	public void setRegId(String regId) {
		this.regId = regId;
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
	public String getCnsTargetGb() {
		return cnsTargetGb;
	}
	public void setCnsTargetGb(String cnsTargetGb) {
		this.cnsTargetGb = cnsTargetGb;
	}
	public String getCnsPerTargetGb() {
		return cnsPerTargetGb;
	}
	public void setCnsPerTargetGb(String cnsPerTargetGb) {
		this.cnsPerTargetGb = cnsPerTargetGb;
	}
	public String getBirthDt() {
		return birthDt;
	}
	public void setBirthDt(String birthDt) {
		this.birthDt = birthDt;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
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
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserNm() {
		return userNm;
	}
	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}
	public String getCnsGb() {
		return cnsGb;
	}
	public void setCnsGb(String cnsGb) {
		this.cnsGb = cnsGb;
	}
	public String getSchUserId() {
		return schUserId;
	}
	public void setSchUserId(String schUserId) {
		this.schUserId = schUserId;
	}
	public String getSchUserNm() {
		return schUserNm;
	}
	public void setSchUserNm(String schUserNm) {
		this.schUserNm = schUserNm;
	}
	public String getSchCnsGb() {
		return schCnsGb;
	}
	public void setSchCnsGb(String schCnsGb) {
		this.schCnsGb = schCnsGb;
	}
	
}
