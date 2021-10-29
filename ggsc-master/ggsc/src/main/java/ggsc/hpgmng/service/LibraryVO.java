package ggsc.hpgmng.service;

import org.springframework.web.multipart.MultipartFile;


import ams.cmm.PageVO;

public class LibraryVO extends PageVO{
	
	private int num;
	private int authCd;
	private String title;
	private String writer;
	private String cntn;
	private String regId;
	private String dbInsTm;
	
	private String schDcuStartDate;
	private String schDcuEndDate;
	private String schDcuType;
	private String schDcuText;
	
	public int getAuthCd() {
		return authCd;
	}
	public void setAuthCd(int authCd) {
		this.authCd = authCd;
	}
	public String getSchDcuStartDate() {
		return schDcuStartDate;
	}
	public void setSchDcuStartDate(String schDcuStartDate) {
		this.schDcuStartDate = schDcuStartDate;
	}
	public String getSchDcuEndDate() {
		return schDcuEndDate;
	}
	public void setSchDcuEndDate(String schDcuEndDate) {
		this.schDcuEndDate = schDcuEndDate;
	}
	public String getSchDcuType() {
		return schDcuType;
	}
	public void setSchDcuType(String schDcuType) {
		this.schDcuType = schDcuType;
	}
	public String getSchDcuText() {
		return schDcuText;
	}
	public void setSchDcuText(String schDcuText) {
		this.schDcuText = schDcuText;
	}
	private MultipartFile file;
	
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
	public String getCntn() {
		return cntn;
	}
	public void setCntn(String cntn) {
		this.cntn = cntn;
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
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
}
