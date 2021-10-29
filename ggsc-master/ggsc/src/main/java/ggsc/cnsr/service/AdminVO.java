package ggsc.cnsr.service;

import ams.cmm.PageVO;

public class AdminVO extends PageVO{
	
	private String schCnsGb;
    private String schZoneGb;
    private String schLocalGb;
    private String schCenterGb;
    private String schCnsleNm;
    private int authCd;
    
	public int getAuthCd() {
		return authCd;
	}
	public void setAuthCd(int authCd) {
		this.authCd = authCd;
	}
	public String getSchCnsGb() {
		return schCnsGb;
	}
	public void setSchCnsGb(String schCnsGb) {
		this.schCnsGb = schCnsGb;
	}
	public String getSchZoneGb() {
		return schZoneGb;
	}
	public void setSchZoneGb(String schZoneGb) {
		this.schZoneGb = schZoneGb;
	}
	public String getSchLocalGb() {
		return schLocalGb;
	}
	public void setSchLocalGb(String schLocalGb) {
		this.schLocalGb = schLocalGb;
	}
	public String getSchCenterGb() {
		return schCenterGb;
	}
	public void setSchCenterGb(String schCenterGb) {
		this.schCenterGb = schCenterGb;
	}
	public String getSchCnsleNm() {
		return schCnsleNm;
	}
	public void setSchCnsleNm(String schCnsleNm) {
		this.schCnsleNm = schCnsleNm;
	}
	private String cnsrCd;
	private String cnsGb;
	private String zoneGb;
	private String localGb;
	private String centerGb;
	private String cnsrGb;
	private String apprvYn;
	private String birthDt;
	private String emplDt;
	private String emplType;
	private String contTermStd;
	private String contTermEnd;
	private String edu;
	private String major;
	private String posi;
	private String pdsrYn;
	private int acptPaystep;
	private String empProv;
	private String joinDt;
	private String socialWorkProv;
	private String cnsProv;
	private int oneOrgCareer;
	private String mtncStndRigt;
	private String useYn;
	private String dbInsTm;
	private String regId;
	private String cnsrNm;
	private String userId;
	
	private String schCnsrType; // 상담구분
	private String schCnsrGb; // 상담그룹
	private String schCenNm; // 센터명
	private String schUserId; // 아이디
	private String schCnsrNm; // 성명
	private String securityYn; // 보안서약서 등록 유무
	
	public String getSecurityYn() {
		return securityYn;
	}
	public void setSecurityYn(String securityYn) {
		this.securityYn = securityYn;
	}
	public String getSchCnsrNm() {
		return schCnsrNm;
	}
	public void setSchCnsrNm(String schCnsrNm) {
		this.schCnsrNm = schCnsrNm;
	}
	public String getSchUserId() {
		return schUserId;
	}
	public void setSchUserId(String schUserId) {
		this.schUserId = schUserId;
	}
	public String getCnsrCd() {
		return cnsrCd;
	}
	public void setCnsrCd(String cnsrCd) {
		this.cnsrCd = cnsrCd;
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
	public String getCnsrGb() {
		return cnsrGb;
	}
	public void setCnsrGb(String cnsrGb) {
		this.cnsrGb = cnsrGb;
	}
	public String getApprvYn() {
		return apprvYn;
	}
	public void setApprvYn(String apprvYn) {
		this.apprvYn = apprvYn;
	}
	public String getBirthDt() {
		return birthDt;
	}
	public void setBirthDt(String birthDt) {
		this.birthDt = birthDt;
	}
	public String getEmplDt() {
		return emplDt;
	}
	public void setEmplDt(String emplDt) {
		this.emplDt = emplDt;
	}
	public String getEmplType() {
		return emplType;
	}
	public void setEmplType(String emplType) {
		this.emplType = emplType;
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
	public String getEdu() {
		return edu;
	}
	public void setEdu(String edu) {
		this.edu = edu;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getPosi() {
		return posi;
	}
	public void setPosi(String posi) {
		this.posi = posi;
	}
	public String getPdsrYn() {
		return pdsrYn;
	}
	public void setPdsrYn(String pdsrYn) {
		this.pdsrYn = pdsrYn;
	}
	public int getAcptPaystep() {
		return acptPaystep;
	}
	public void setAcptPaystep(int acptPaystep) {
		this.acptPaystep = acptPaystep;
	}
	public String getEmpProv() {
		return empProv;
	}
	public void setEmpProv(String empProv) {
		this.empProv = empProv;
	}
	public String getJoinDt() {
		return joinDt;
	}
	public void setJoinDt(String joinDt) {
		this.joinDt = joinDt;
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
	public int getOneOrgCareer() {
		return oneOrgCareer;
	}
	public void setOneOrgCareer(int oneOrgCareer) {
		this.oneOrgCareer = oneOrgCareer;
	}
	public String getMtncStndRigt() {
		return mtncStndRigt;
	}
	public void setMtncStndRigt(String mtncStndRigt) {
		this.mtncStndRigt = mtncStndRigt;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getDbInsTm() {
		return dbInsTm;
	}
	public void setDbInsTm(String dbInsTm) {
		this.dbInsTm = dbInsTm;
	}
	public String getRegId() {
		return regId;
	}
	public void setRegId(String regId) {
		this.regId = regId;
	}
	public String getCnsrNm() {
		return cnsrNm;
	}
	public void setCnsrNm(String cnsrNm) {
		this.cnsrNm = cnsrNm;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getSchCnsrType() {
		return schCnsrType;
	}
	public void setSchCnsrType(String schCnsrType) {
		this.schCnsrType = schCnsrType;
	}
	public String getSchCnsrGb() {
		return schCnsrGb;
	}
	public void setSchCnsrGb(String schCnsrGb) {
		this.schCnsrGb = schCnsrGb;
	}
	public String getSchCenNm() {
		return schCenNm;
	}
	public void setSchCenNm(String schCenNm) {
		this.schCenNm = schCenNm;
	}
	
	
	
	
}
