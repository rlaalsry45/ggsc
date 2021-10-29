package ggsc.support.service;

import ams.cmm.PageVO;

public class MailVO extends PageVO{
	
	private String title;
	private String send_tm;
	private String cntn;
	private String odr;
	private String useYn;
	private String fileNm;
	private String sysFileNm;
	private String filePath;
	private String fileSize;
	private String regId;
	
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSend_tm() {
		return send_tm;
	}
	public void setSend_tm(String send_tm) {
		this.send_tm = send_tm;
	}
	public String getCntn() {
		return cntn;
	}
	public void setCntn(String cntn) {
		this.cntn = cntn;
	}
	public String getOdr() {
		return odr;
	}
	public void setOdr(String odr) {
		this.odr = odr;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getFileNm() {
		return fileNm;
	}
	public void setFileNm(String fileNm) {
		this.fileNm = fileNm;
	}
	public String getSysFileNm() {
		return sysFileNm;
	}
	public void setSysFileNm(String sysFileNm) {
		this.sysFileNm = sysFileNm;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getFileSize() {
		return fileSize;
	}
	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}
	public String getRegId() {
		return regId;
	}
	public void setRegId(String regId) {
		this.regId = regId;
	}
}                                
