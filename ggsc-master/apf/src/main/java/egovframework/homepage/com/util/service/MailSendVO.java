package egovframework.homepage.com.util.service;

public class MailSendVO {

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
	private String sendList;
	private String sendGb;
	private String newPw;
	private String userNm;
	private String tel;
	private String email;
	
	public String getUserNm() {
		return userNm;
	}
	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNewPw() {
		return newPw;
	}
	public void setNewPw(String newPw) {
		this.newPw = newPw;
	}
	public String getSendGb() {
		return sendGb;
	}
	public void setSendGb(String sendGb) {
		this.sendGb = sendGb;
	}
	public String getSendList() {
		return sendList;
	}
	public void setSendList(String sendList) {
		this.sendList = sendList;
	}
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
	
	@Override
	public String toString() {
		return "MailSendVO [title=" + title + ", send_tm=" + send_tm + ", cntn=" + cntn + ", odr=" + odr + ", useYn="
				+ useYn + ", fileNm=" + fileNm + ", sysFileNm=" + sysFileNm + ", filePath=" + filePath + ", fileSize="
				+ fileSize + ", regId=" + regId + ", sendList=" + sendList + ", sendGb=" + sendGb + ", newPw=" + newPw
				+ ", userNm=" + userNm + ", tel=" + tel + ", email=" + email + "]";
	}
	
}
