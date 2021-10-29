package ggsc.hpgmng.service;

import ams.cmm.PageVO;

public class FaqVO extends PageVO{

	private int num;
	private String title;
	private String writer;
	private String content;
	private String regId;
	private String rplyCntn;
	private String dbInsTm;
	private String dbUpdTm;
	
	private String schType;
	private String schText;
	
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegId() {
		return regId;
	}
	public void setRegId(String regId) {
		this.regId = regId;
	}
	public String getRplyCntn() {
		return rplyCntn;
	}
	public void setRplyCntn(String rplyCntn) {
		this.rplyCntn = rplyCntn;
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
	public String getSchType() {
		return schType;
	}
	public void setSchType(String schType) {
		this.schType = schType;
	}
	
	@Override
	public String toString() {
		return "FaqVO [num=" + num + ", title=" + title + ", writer=" + writer + ", content=" + content + ", regId="
				+ regId + ", rplyCntn=" + rplyCntn + ", dbInsTm=" + dbInsTm + ", dbUpdTm=" + dbUpdTm + ", schType="
				+ schType + ", schText=" + schText + "]";
	}

}
