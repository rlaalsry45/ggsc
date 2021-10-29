package ggsc.support.service;

import org.springframework.web.multipart.MultipartFile;

import ams.cmm.PageVO;

public class RescRoomVO extends PageVO{
	
	private int num;
	private int authCd;
	private String title;
	private String writer;
	private String content;
	private String regId;
	private String dbInsTm;
	private String dbUpdTm;
	
	private String fileNm;
	private String sysFileNm;
	private String filePath;
	private String fileSize;
	private MultipartFile file;
	
	private String schStartDate;
	private String schEndDate;
	private String schText;
	private String schType;
	
	public int getAuthCd() {
		return authCd;
	}
	public void setAuthCd(int authCd) {
		this.authCd = authCd;
	}
	public String getSchStartDate() {
		return schStartDate;
	}
	public void setSchStartDate(String schStartDate) {
		this.schStartDate = schStartDate;
	}
	public String getSchEndDate() {
		return schEndDate;
	}
	public void setSchEndDate(String schEndDate) {
		this.schEndDate = schEndDate;
	}
	public String getSchText() {
		return schText;
	}
	public void setSchText(String schText) {
		this.schText = schText;
	}
	public String getSchType() {
		return schType;
	}
	public void setSchType(String schType) {
		this.schType = schType;
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
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
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
	
	@Override
	public String toString() {
		return "RescRoomVO [num=" + num + ", title=" + title + ", writer=" + writer + ", content=" + content
				+ ", regId=" + regId + ", dbInsTm=" + dbInsTm + ", dbUpdTm=" + dbUpdTm + ", fileNm=" + fileNm
				+ ", sysFileNm=" + sysFileNm + ", filePath=" + filePath + ", fileSize=" + fileSize + ", file=" + file
				+ ", schStartDate=" + schStartDate + ", schEndDate=" + schEndDate + ", schText=" + schText
				+ ", schType=" + schType + "]";
	}
	
	
	
}
