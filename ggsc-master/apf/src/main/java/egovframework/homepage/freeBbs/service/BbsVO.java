package egovframework.homepage.freeBbs.service;

import org.springframework.web.multipart.MultipartFile;

public class BbsVO {
	
	private int num;
	private String title;
	private String writer;
	private String cntn;
	private String regId;
	private String dbInsTm;
	private MultipartFile file;
	private String fileNm;
	private String sysFileNm;
	private String filePath;
	private int fileSize;
	private String fileDesc;
	
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
	public int getFileSize() {
		return fileSize;
	}
	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}
	public String getFileDesc() {
		return fileDesc;
	}
	public void setFileDesc(String fileDesc) {
		this.fileDesc = fileDesc;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	
	@Override
	public String toString() {
		return "BbsVO [num=" + num + ", title=" + title + ", writer=" + writer + ", cntn=" + cntn + ", regId=" + regId
				+ ", dbInsTm=" + dbInsTm + ", file=" + file + ", fileNm=" + fileNm + ", sysFileNm=" + sysFileNm
				+ ", filePath=" + filePath + ", fileSize=" + fileSize + ", fileDesc=" + fileDesc + "]";
	}
	
}
