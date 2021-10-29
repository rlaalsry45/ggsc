package ggsc.join.service;

import ams.cmm.PageVO;

public class CnsrVO extends PageVO{

	private int authCd; // 권한
	private String cnsGb; // 상담구분
	private String centerGb; // 센터구분
	private String cnsrGb; // 상담사구분
	private String cnsrNm; // 상담사명
	private String birthDt; // 생년월일
	private String posi; // 직책
	private String major; // 전공
	private String edu; // 학력
	private String socialWorkProv; // 사회복지사자격증
	private String cnsProv; // 상담자격증
	private String apprvYn; // 승인여부
	private String contTermStd; // 계약시작
	private String contTermEnd; // 계약종료
	private String dbInsTm; // 등록일시
	
	
	private String userId; // 아이디
	private String age; // 나이
	private String userNm; // 이름

	private String zoneGb;
	private String localGb;
	private String sigunCd;
	
	private String schCenterGb;
	
	public int getAuthCd() {
		return authCd;
	}
	public void setAuthCd(int authCd) {
		this.authCd = authCd;
	}
	public String getSigunCd() {
		return sigunCd;
	}
	public void setSigunCd(String sigunCd) {
		this.sigunCd = sigunCd;
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
	public String getSchCenterGb() {
		return schCenterGb;
	}
	public void setSchCenterGb(String schCenterGb) {
		this.schCenterGb = schCenterGb;
	}
	public String getzoneGb() {
		return zoneGb;
	}
	public void setzoneGb(String zoneGb) {
		this.zoneGb = zoneGb;
	}
	
	public String getlocalGb() {
		return localGb;
	}
	public void setlocalGb(String localGb) {
		this.localGb = localGb;
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
	public String getCnsrNm() {
		return cnsrNm;
	}
	public void setCnsrNm(String cnsrNm) {
		this.cnsrNm = cnsrNm;
	}
	public String getBirthDt() {
		return birthDt;
	}
	public void setBirthDt(String birthDt) {
		this.birthDt = birthDt;
	}
	public String getPosi() {
		return posi;
	}
	public void setPosi(String posi) {
		this.posi = posi;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getEdu() {
		return edu;
	}
	public void setEdu(String edu) {
		this.edu = edu;
	}
	public String getSocialWorkProv() {
		return socialWorkProv;
	}
	public void setSocialWorkProv(String socialWorkProv) {
		this.socialWorkProv = socialWorkProv;
	}
	public String getCnsProv() {
		return cnsProv;
	}
	public void setCnsProv(String cnsProv) {
		this.cnsProv = cnsProv;
	}
	public String getApprvYn() {
		return apprvYn;
	}
	public void setApprvYn(String apprvYn) {
		this.apprvYn = apprvYn;
	}
	public String getContTermStd() {
		return contTermStd;
	}
	public void setContTermStd(String contTermStd) {
		this.contTermStd = contTermStd;
	}
	public String getContTermEnd() {
		return contTermEnd;
	}
	public void setContTermEnd(String contTermEnd) {
		this.contTermEnd = contTermEnd;
	}
	public String getDbInsTm() {
		return dbInsTm;
	}
	public void setDbInsTm(String dbInsTm) {
		this.dbInsTm = dbInsTm;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
}
