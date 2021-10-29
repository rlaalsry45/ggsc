package ggsc.report.service;

import org.springframework.web.multipart.MultipartFile;

import ams.cmm.PageVO;

public class NtwkMeetRptVO extends PageVO{
	
	private String schCnsGb;
    private String schZoneGb;
    private String schLocalGb;
    private String schCenterGb;
    private String schCnsleNm;
    private String schStartDate;
    private String schEndDate;
    private String schJoinOrgCd;
    private String schCnsrNm;
    
	public String getSchJoinOrgCd() {
		return schJoinOrgCd;
	}
	public void setSchJoinOrgCd(String schJoinOrgCd) {
		this.schJoinOrgCd = schJoinOrgCd;
	}
	public String getSchCnsrNm() {
		return schCnsrNm;
	}
	public void setSchCnsrNm(String schCnsrNm) {
		this.schCnsrNm = schCnsrNm;
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
	public String getSchCnsGb() {
		return schCnsGb;
	}
	public void setSchCnsGb(String schCnsGb) {
		this.schCnsGb = schCnsGb;
	}
	public String getSchZoneGb() {
		return schZoneGb;
	}
	public void setSchZoneGb(String schZoneGb) {
		this.schZoneGb = schZoneGb;
	}
	public String getSchLocalGb() {
		return schLocalGb;
	}
	public void setSchLocalGb(String schLocalGb) {
		this.schLocalGb = schLocalGb;
	}
	public String getSchCenterGb() {
		return schCenterGb;
	}
	public void setSchCenterGb(String schCenterGb) {
		this.schCenterGb = schCenterGb;
	}
	public String getSchCnsleNm() {
		return schCnsleNm;
	}
	public void setSchCnsleNm(String schCnsleNm) {
		this.schCnsleNm = schCnsleNm;
	}
	
	private String ntwkMeetNo;
	private String caseNo;
	private String cnsGb;
	private String zoneGb;
	private String localGb;
	private String localGbNm;
	private String centerGb;
	private String joinOrgCd;
	private String meetDt;
	private String joinMan;
	private String joinPlace;
	private String joinCntn;
	private String fileNm;
	private String sysFileNm;
	private String filePath;
	private int fileSize;
	private String inputNm;
	private String fileName;
	private String sysFileName;
	private String fDel, delYn;
	private String cnsrId;
	
	
	private MultipartFile file;

	
	public String getCnsrId() {
		return cnsrId;
	}
	public void setCnsrId(String cnsrId) {
		this.cnsrId = cnsrId;
	}
	public String getfDel() {
		return fDel;
	}
	public void setfDel(String fDel) {
		this.fDel = fDel;
	}
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getSysFileName() {
		return sysFileName;
	}
	public void setSysFileName(String sysFileName) {
		this.sysFileName = sysFileName;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public String getNtwkMeetNo() {
		return ntwkMeetNo;
	}
	public void setNtwkMeetNo(String ntwkMeetNo) {
		this.ntwkMeetNo = ntwkMeetNo;
	}
	public String getCaseNo() {
		return caseNo;
	}
	public void setCaseNo(String caseNo) {
		this.caseNo = caseNo;
	}
	public String getCnsGb() {
		return cnsGb;
	}
	public void setCnsGb(String cnsGb) {
		this.cnsGb = cnsGb;
	}
	public String getZoneGb() {
		return zoneGb;
	}
	public void setZoneGb(String zoneGb) {
		this.zoneGb = zoneGb;
	}
	public String getLocalGb() {
		return localGb;
	}
	public void setLocalGb(String localGb) {
		this.localGb = localGb;
	}
	public String getCenterGb() {
		return centerGb;
	}
	public void setCenterGb(String centerGb) {
		this.centerGb = centerGb;
	}
	public String getJoinOrgCd() {
		return joinOrgCd;
	}
	public void setJoinOrgCd(String joinOrgCd) {
		this.joinOrgCd = joinOrgCd;
	}
	public String getMeetDt() {
		return meetDt;
	}
	public void setMeetDt(String meetDt) {
		this.meetDt = meetDt;
	}
	public String getJoinMan() {
		return joinMan;
	}
	public void setJoinMan(String joinMan) {
		this.joinMan = joinMan;
	}
	public String getJoinPlace() {
		return joinPlace;
	}
	public void setJoinPlace(String joinPlace) {
		this.joinPlace = joinPlace;
	}
	public String getJoinCntn() {
		return joinCntn;
	}
	public void setJoinCntn(String joinCntn) {
		this.joinCntn = joinCntn;
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
	public String getInputNm() {
		return inputNm;
	}
	public void setInputNm(String inputNm) {
		this.inputNm = inputNm;
	}
	public String getLocalGbNm() {
		return localGbNm;
	}
	public void setLocalGbNm(String localGbNm) {
		this.localGbNm = localGbNm;
	}
	
	@Override
	public String toString() {
		return "NtwkMeetRptVO [schCnsGb=" + schCnsGb + ", schZoneGb=" + schZoneGb + ", schLocalGb=" + schLocalGb
				+ ", schCenterGb=" + schCenterGb + ", schCnsleNm=" + schCnsleNm + ", schStartDate=" + schStartDate
				+ ", schEndDate=" + schEndDate + ", ntwkMeetNo=" + ntwkMeetNo + ", caseNo=" + caseNo + ", cnsGb="
				+ cnsGb + ", zoneGb=" + zoneGb + ", localGb=" + localGb + ", localGbNm=" + localGbNm + ", centerGb="
				+ centerGb + ", joinOrgCd=" + joinOrgCd + ", meetDt=" + meetDt + ", joinMan=" + joinMan + ", joinPlace="
				+ joinPlace + ", joinCntn=" + joinCntn + ", fileNm=" + fileNm + ", sysFileNm=" + sysFileNm
				+ ", filePath=" + filePath + ", fileSize=" + fileSize + ", inputNm=" + inputNm + ", fileName="
				+ fileName + ", sysFileName=" + sysFileName + ", file=" + file + "]";
	}
	
	
}