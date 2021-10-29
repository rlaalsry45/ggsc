package ggsc.rorgmng.service;

import ams.cmm.PageVO;

public class RorgMngVO extends PageVO{

	private int num;
	private String relOrgCd;
	private String relOrgGb;
	private String localGb;
	private String relOrgNm;
	private String addr;
	private String addrDtl;
	private String url;
	private String tel;
	private String fax;
	private String regId;
	private String dbInsTm;
	
	private String schLocalGb;
	private String schorganGb;
	private String schCenterGb;
	
	public String getSchLocalGb() {
		return schLocalGb;
	}
	public void setSchLocalGb(String schLocalGb) {
		this.schLocalGb = schLocalGb;
	}
	public String getSchorganGb() {
		return schorganGb;
	}
	public void setSchorganGb(String schorganGb) {
		this.schorganGb = schorganGb;
	}
	public String getSchCenterGb() {
		return schCenterGb;
	}
	public void setSchCenterGb(String schCenterGb) {
		this.schCenterGb = schCenterGb;
	}
	// 검색 변수
	private String schRelOrgNm;
	
	public String getSchRelOrgNm() {
		return schRelOrgNm;
	}
	public void setSchRelOrgNm(String schRelOrgNm) {
		this.schRelOrgNm = schRelOrgNm;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getRelOrgCd() {
		return relOrgCd;
	}
	public void setRelOrgCd(String relOrgCd) {
		this.relOrgCd = relOrgCd;
	}
	public String getRelOrgGb() {
		return relOrgGb;
	}
	public void setRelOrgGb(String relOrgGb) {
		this.relOrgGb = relOrgGb;
	}
	public String getLocalGb() {
		return localGb;
	}
	public void setLocalGb(String localGb) {
		this.localGb = localGb;
	}
	public String getRelOrgNm() {
		return relOrgNm;
	}
	public void setRelOrgNm(String relOrgNm) {
		this.relOrgNm = relOrgNm;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getAddrDtl() {
		return addrDtl;
	}
	public void setAddrDtl(String addrDtl) {
		this.addrDtl = addrDtl;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
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
	
	@Override
	public String toString() {
		return "RorgMngVO [num=" + num + ", relOrgCd=" + relOrgCd + ", relOrgGb=" + relOrgGb + ", localGb=" + localGb
				+ ", relOrgNm=" + relOrgNm + ", addr=" + addr + ", addrDtl=" + addrDtl + ", url=" + url + ", tel=" + tel
				+ ", fax=" + fax + ", regId=" + regId + ", dbInsTm=" + dbInsTm + ", schLocalGb=" + schLocalGb
				+ ", schorganGb=" + schorganGb + ", schCenterGb=" + schCenterGb + ", schRelOrgNm=" + schRelOrgNm + "]";
	}
	
}
