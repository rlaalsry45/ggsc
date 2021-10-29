package ggsc.support.service;

import ams.cmm.PageVO;

public class SurveyMngVO extends PageVO{

	private int num;
	private int authCd;
	private String title;
	private String writer;
	private String regId;
	private String cntn;
	private String srvPriStd;
	private String srvPriEnd;
	private String dbInsTm;
	private String dbUpdTm;
	
	private String schType;
	private String schText;
	
	public String getCntn() {
		return cntn;
	}
	public void setCntn(String cntn) {
		this.cntn = cntn;
	}
	public int getAuthCd() {
		return authCd;
	}
	public void setAuthCd(int authCd) {
		this.authCd = authCd;
	}
	public String getSchType() {
		return schType;
	}
	public void setSchType(String schType) {
		this.schType = schType;
	}
	public String getSchText() {
		return schText;
	}
	public void setSchText(String schText) {
		this.schText = schText;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getRegId() {
		return regId;
	}
	public void setRegId(String regId) {
		this.regId = regId;
	}
	public String getSrvPriStd() {
		return srvPriStd;
	}
	public void setSrvPriStd(String srvPriStd) {
		this.srvPriStd = srvPriStd;
	}
	public String getSrvPriEnd() {
		return srvPriEnd;
	}
	public void setSrvPriEnd(String srvPriEnd) {
		this.srvPriEnd = srvPriEnd;
	}
	public String getDbInsTm() {
		return dbInsTm;
	}
	public void setDbInsTm(String dbInsTm) {
		this.dbInsTm = dbInsTm;
	}
	public String getDbUpdTm() {
		return dbUpdTm;
	}
	public void setDbUpdTm(String dbUpdTm) {
		this.dbUpdTm = dbUpdTm;
	}
	
}
