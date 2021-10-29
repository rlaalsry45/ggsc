package ggsc.cnsmng.service;

import ams.cmm.PageVO;

public class CnsAcptVO extends PageVO {
	
	private String cnsGb;
	private String userId;
	private String pw;
	private String userNm;
	private String gender;
	private String birthDt;
	private String email;
	private String tel;
	private String mobile;
	private String addr;
	private String cnsHistYn;
	private String cnsMethd;
	private String cnsDtl;
	private String cnsCntn;
	private String acptYn;
	private int num;
	private int caseNo;
	private String regId;
	private String authCd;
	private String sigunCd;
	
	private String cnsDt;
	private String cnsDtWeekCd;
	private int cnsDtStdHour;
	private int cnsDtStdMin;
	private int cnsDtEndHour;
	private int cnsDtEndMin;
	private int cnsTimeTotMin;
	
	private String zoneGb;
	private String localGb;
	private String centerGb;
	
	private String majorApplCd;
	private String schCnsGb;
	private String schCenterGb;
	private String schAcptNm;
	private String schDt;
	private String schStartDate;
	private String schEndDate;
	
	
	public String getSigunCd() {
		return sigunCd;
	}
	public void setSigunCd(String sigunCd) {
		this.sigunCd = sigunCd;
	}
	public String getCnsDt() {
		return cnsDt;
	}
	public void setCnsDt(String cnsDt) {
		this.cnsDt = cnsDt;
	}
	public String getCnsDtWeekCd() {
		return cnsDtWeekCd;
	}
	public void setCnsDtWeekCd(String cnsDtWeekCd) {
		this.cnsDtWeekCd = cnsDtWeekCd;
	}
	public int getCnsDtStdHour() {
		return cnsDtStdHour;
	}
	public void setCnsDtStdHour(int cnsDtStdHour) {
		this.cnsDtStdHour = cnsDtStdHour;
	}
	public int getCnsDtStdMin() {
		return cnsDtStdMin;
	}
	public void setCnsDtStdMin(int cnsDtStdMin) {
		this.cnsDtStdMin = cnsDtStdMin;
	}
	public int getCnsDtEndHour() {
		return cnsDtEndHour;
	}
	public void setCnsDtEndHour(int cnsDtEndHour) {
		this.cnsDtEndHour = cnsDtEndHour;
	}
	public int getCnsDtEndMin() {
		return cnsDtEndMin;
	}
	public void setCnsDtEndMin(int cnsDtEndMin) {
		this.cnsDtEndMin = cnsDtEndMin;
	}
	public int getCnsTimeTotMin() {
		return cnsTimeTotMin;
	}
	public void setCnsTimeTotMin(int cnsTimeTotMin) {
		this.cnsTimeTotMin = cnsTimeTotMin;
	}
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
	public String getRegId() {
		return regId;
	}
	public void setRegId(String regId) {
		this.regId = regId;
	}
	public String getCnsGb() {
		return cnsGb;
	}
	public void setCnsGb(String cnsGb) {
		this.cnsGb = cnsGb;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getUserNm() {
		return userNm;
	}
	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
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
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getCnsHistYn() {
		return cnsHistYn;
	}
	public void setCnsHistYn(String cnsHistYn) {
		this.cnsHistYn = cnsHistYn;
	}
	public String getCnsMethd() {
		return cnsMethd;
	}
	public void setCnsMethd(String cnsMethd) {
		this.cnsMethd = cnsMethd;
	}
	public String getCnsDtl() {
		return cnsDtl;
	}
	public void setCnsDtl(String cnsDtl) {
		this.cnsDtl = cnsDtl;
	}
	public String getCnsCntn() {
		return cnsCntn;
	}
	public void setCnsCntn(String cnsCntn) {
		this.cnsCntn = cnsCntn;
	}
	public String getMajorApplCd() {
		return majorApplCd;
	}
	public void setMajorApplCd(String majorApplCd) {
		this.majorApplCd = majorApplCd;
	}
	public String getZoneGb() {
		return zoneGb;
	}
	public void setZoneGb(String zoneGb) {
		this.zoneGb = zoneGb;
	}
	public String getLocalGb() {
		return localGb;
	}
	public void setLocalGb(String localGb) {
		this.localGb = localGb;
	}
	public String getCenterGb() {
		return centerGb;
	}
	public void setCenterGb(String centerGb) {
		this.centerGb = centerGb;
	}
	public String getSchCnsGb() {
		return schCnsGb;
	}
	public void setSchCnsGb(String schCnsGb) {
		this.schCnsGb = schCnsGb;
	}
	public String getSchCenterGb() {
		return schCenterGb;
	}
	public void setSchCenterGb(String schCenterGb) {
		this.schCenterGb = schCenterGb;
	}
	public String getSchAcptNm() {
		return schAcptNm;
	}
	public void setSchAcptNm(String schAcptNm) {
		this.schAcptNm = schAcptNm;
	}
	public String getSchDt() {
		return schDt;
	}
	public void setSchDt(String schDt) {
		this.schDt = schDt;
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
	
	public String getAcptYn() {
		return acptYn;
	}
	
	public void setAcptYn(String acptYn) {
		this.acptYn = acptYn;
	}
	
	@Override
	public String toString() {
		return "CnsAcptVO [cnsGb=" + cnsGb + ", userId=" + userId + ", pw=" + pw + ", userNm=" + userNm + ", gender="
				+ gender + ", birthDt=" + birthDt + ", email=" + email + ", tel=" + tel + ", mobile=" + mobile
				+ ", addr=" + addr + ", cnsHistYn=" + cnsHistYn + ", acptYn=" + acptYn + ", caseNo=" + caseNo
				+ ", zoneGb=" + zoneGb + ", localGb=" + localGb + ", centerGb=" + centerGb + ", majorApplCd="
				+ majorApplCd + ", schCnsGb=" + schCnsGb + ", schCenterGb=" + schCenterGb + ", schAcptNm=" + schAcptNm
				+ ", schDt=" + schDt + "]";
	}
}
