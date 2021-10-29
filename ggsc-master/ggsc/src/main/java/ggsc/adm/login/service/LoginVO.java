package ggsc.adm.login.service;

import java.io.Serializable;

/**
 * @Class Name : LoginVO.java
 * @Description : Login VO class
 * @Modification Information
 * @
 * @  수정일         수정자                   수정내용
 * @ -------    --------    ---------------------------
 * @ 2009.03.03    박지욱          최초 생성
 *
 *  @author 공통서비스 개발팀 박지욱
 *  @since 2009.03.03
 *  @version 1.0
 *  @see
 *
 */
@SuppressWarnings("serial")
public class LoginVO implements Serializable{

	private int userNum;
	private String pw;

	private String pbCd;
	private int deptCd;
	private int authCd;
	private int posiCd;
	private String deptNm;
	private String posiNm;
	private String empCode;
	
	// 노인상담시스템에서 사용되는 값
	private String userId;
	private String userNm;
	private String centerNm;
	private String centerGb; // 센터구분
	private String cnsrGb; // 상담사구분
	private String cnsGb; // 상담구분
	private String zoneGb; // 권역구분
	private String localGb; // 지역구분
	private String mobile;
	
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getCenterNm() {
		return centerNm;
	}
	public void setCenterNm(String centerNm) {
		this.centerNm = centerNm;
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
	public String getCnsGb() {
		return cnsGb;
	}
	public void setCnsGb(String cnsGb) {
		this.cnsGb = cnsGb;
	}
	public String getCenterGb() {
		return centerGb;
	}
	public void setCenterGb(String centerGb) {
		this.centerGb = centerGb;
	}
	public String getCnsrGb() {
		return cnsrGb;
	}
	public void setCnsrGb(String cnsrGb) {
		this.cnsrGb = cnsrGb;
	}
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
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
	public String getPbCd() {
		return pbCd;
	}
	public void setPbCd(String pbCd) {
		this.pbCd = pbCd;
	}
	public int getDeptCd() {
		return deptCd;
	}
	public void setDeptCd(int deptCd) {
		this.deptCd = deptCd;
	}
	public int getAuthCd() {
		return authCd;
	}
	public void setAuthCd(int authCd) {
		this.authCd = authCd;
	}
	public int getPosiCd() {
		return posiCd;
	}
	public void setPosiCd(int posiCd) {
		this.posiCd = posiCd;
	}
	public String getDeptNm() {
		return deptNm;
	}
	public void setDeptNm(String deptNm) {
		this.deptNm = deptNm;
	}
	public String getUserNm() {
		return userNm;
	}
	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}
	public String getPosiNm() {
		return posiNm;
	}
	public void setPosiNm(String posiNm) {
		this.posiNm = posiNm;
	}
	public String getEmpCode() {
		return empCode;
	}
	public void setEmpCode(String empCode) {
		this.empCode = empCode;
	}
	
	@Override
	public String toString() {
		return "LoginVO [userNum=" + userNum + ", pw=" + pw + ", pbCd=" + pbCd + ", deptCd=" + deptCd + ", authCd="
				+ authCd + ", posiCd=" + posiCd + ", deptNm=" + deptNm + ", posiNm=" + posiNm + ", empCode=" + empCode
				+ ", userId=" + userId + ", userNm=" + userNm + ", centerNm=" + centerNm + ", centerGb=" + centerGb
				+ ", cnsrGb=" + cnsrGb + ", cnsGb=" + cnsGb + ", zoneGb=" + zoneGb + ", localGb=" + localGb + "]";
	}

}
