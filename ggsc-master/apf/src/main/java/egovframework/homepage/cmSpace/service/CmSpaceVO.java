package egovframework.homepage.cmSpace.service;

import org.springframework.web.multipart.MultipartFile;

public class CmSpaceVO extends PageVO{

	private int num;
	private int viewCount;
	private String title;
	private String writer;
	private String cntn;
	private String regId;
	private String dbInsTm;
	
	private String pw;
	private String openStatYn;
	
	private String ansTitle;
	private String ansCntn;
	private String regNm;
	private String ansDbInsTm;
	
	private String cnsrId;
	private String cnsrNm;
	private String cnsleId;
	private int viewCnt;
	
	private MultipartFile file;
	private String fileNm;
	private String sysFileNm;
	private String filePath;
	private int fileSize;
	private String fileDesc;
	private String prevYn;
	
	public String getPrevYn() {
		return prevYn;
	}
	public void setPrevYn(String prevYn) {
		this.prevYn = prevYn;
	}
	public String getCnsrId() {
		return cnsrId;
	}
	public void setCnsrId(String cnsrId) {
		this.cnsrId = cnsrId;
	}
	public String getCnsrNm() {
		return cnsrNm;
	}
	public void setCnsrNm(String cnsrNm) {
		this.cnsrNm = cnsrNm;
	}
	public String getCnsleId() {
		return cnsleId;
	}
	public void setCnsleId(String cnsleId) {
		this.cnsleId = cnsleId;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	public String getAnsTitle() {
		return ansTitle;
	}
	public void setAnsTitle(String ansTitle) {
		this.ansTitle = ansTitle;
	}
	public String getAnsCntn() {
		return ansCntn;
	}
	public void setAnsCntn(String ansCntn) {
		this.ansCntn = ansCntn;
	}
	public String getRegNm() {
		return regNm;
	}
	public void setRegNm(String regNm) {
		this.regNm = regNm;
	}
	public String getAnsDbInsTm() {
		return ansDbInsTm;
	}
	public void setAnsDbInsTm(String ansDbInsTm) {
		this.ansDbInsTm = ansDbInsTm;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getOpenStatYn() {
		return openStatYn;
	}
	public void setOpenStatYn(String openStatYn) {
		this.openStatYn = openStatYn;
	}
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
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
	
	@Override
	public String toString() {
		return "CmSpaceVO [num=" + num + ", viewCount=" + viewCount + ", title=" + title + ", writer=" + writer
				+ ", cntn=" + cntn + ", regId=" + regId + ", dbInsTm=" + dbInsTm + ", pw=" + pw + ", openStatYn="
				+ openStatYn + ", file=" + file + ", fileNm=" + fileNm + ", sysFileNm=" + sysFileNm + ", filePath="
				+ filePath + ", fileSize=" + fileSize + ", fileDesc=" + fileDesc + "]";
	}
	
}
