package ggsc.hpgmng.service;

import ams.cmm.PageVO;

public class OnlineAskVO extends PageVO{
	
	private int num;
	private int authCd;
	private String title;
	private String ansCntn;
	private String regId;
	private String regNm;
	private String schOlaStartDate;
	private String schOlaEndDate;
	private String schOlaType;
	private String schOlaText;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getAuthCd() {
		return authCd;
	}
	public void setAuthCd(int authCd) {
		this.authCd = authCd;
	}
	public int getNum() {
		return num;
	}
	public String getSchOlaStartDate() {
		return schOlaStartDate;
	}
	public void setSchOlaStartDate(String schOlaStartDate) {
		this.schOlaStartDate = schOlaStartDate;
	}
	public String getSchOlaEndDate() {
		return schOlaEndDate;
	}
	public void setSchOlaEndDate(String schOlaEndDate) {
		this.schOlaEndDate = schOlaEndDate;
	}
	public String getSchOlaType() {
		return schOlaType;
	}
	public void setSchOlaType(String schOlaType) {
		this.schOlaType = schOlaType;
	}
	public String getSchOlaText() {
		return schOlaText;
	}
	public void setSchOlaText(String schOlaText) {
		this.schOlaText = schOlaText;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getAnsCntn() {
		return ansCntn;
	}
	public void setAnsCntn(String ansCntn) {
		this.ansCntn = ansCntn;
	}
	public String getRegId() {
		return regId;
	}
	public void setRegId(String regId) {
		this.regId = regId;
	}
	public String getRegNm() {
		return regNm;
	}
	public void setRegNm(String regNm) {
		this.regNm = regNm;
	}
}
