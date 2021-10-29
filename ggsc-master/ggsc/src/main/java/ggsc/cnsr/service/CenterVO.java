package ggsc.cnsr.service;

import ams.cmm.PageVO;

public class CenterVO extends PageVO{
	private int num;
	private int authCd;
	private String centerGb;
	private String sigunCd;
	private String zoneGb;
	private String localGb;
	private String localNm;
	private String sigunNm;
	private String centerNm;
	private String addr;
	private String addr_dtl;
	private String email;
	private String fax;
	private String zipCd;
	private String homepage;
	private String tel;
	private String useYn;
	private String regId;
	private String ctDesc;
	private String etc;
	private String dbInsTm;
	
	private String schSigunNm; // 시군 검색값
	private String schZoneGb; // 권역구분 검색값
	private String schCenterGb; // 센터구분 검색값
	
	public int getAuthCd() {
		return authCd;
	}
	public void setAuthCd(int authCd) {
		this.authCd = authCd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	public String getLocalNm() {
		return localNm;
	}
	public void setLocalNm(String localNm) {
		this.localNm = localNm;
	}
	public String getCtDesc() {
		return ctDesc;
	}
	public void setCtDesc(String ctDesc) {
		this.ctDesc = ctDesc;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getCenterGb() {
		return centerGb;
	}
	public void setCenterGb(String centerGb) {
		this.centerGb = centerGb;
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
	public String getSigunNm() {
		return sigunNm;
	}
	public void setSigunNm(String sigunNm) {
		this.sigunNm = sigunNm;
	}
	public String getCenterNm() {
		return centerNm;
	}
	public void setCenterNm(String centerNm) {
		this.centerNm = centerNm;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getAddr_dtl() {
		return addr_dtl;
	}
	public void setAddr_dtl(String addr_dtl) {
		this.addr_dtl = addr_dtl;
	}
	public String getZipCd() {
		return zipCd;
	}
	public void setZipCd(String zipCd) {
		this.zipCd = zipCd;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
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
	public String getSchSigunNm() {
		return schSigunNm;
	}
	public void setSchSigunNm(String schSigunNm) {
		this.schSigunNm = schSigunNm;
	}
	public String getSchZoneGb() {
		return schZoneGb;
	}
	public void setSchZoneGb(String schZoneGb) {
		this.schZoneGb = schZoneGb;
	}
	public String getSchCenterGb() {
		return schCenterGb;
	}
	public void setSchCenterGb(String schCenterGb) {
		this.schCenterGb = schCenterGb;
	}
	
}
